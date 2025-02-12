################################################################################
<#
.SYNOPSIS
Retrieves a list of all installed GenXdev modules, their cmdlets and aliases.

.DESCRIPTION
This function searches through all installed GenXdev modules and returns detailed
information about their cmdlets including names, aliases, and descriptions.

.PARAMETER Filter
Specifies a search pattern to filter cmdlets. Wildcards are supported.

.PARAMETER ModuleName
Specifies which GenXdev modules to search. Defaults to all modules.

.EXAMPLE
Get-GenXDevCmdlets -Filter "Get-*" -ModuleName "Console"

.EXAMPLE
cmds Get-*
#>
function Get-GenXDevCmdlets {

    [CmdletBinding()]
    [Alias("cmds")]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            HelpMessage = "Search pattern to filter cmdlets"
        )]
        [string] $Filter = "*",
        ########################################################################
        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false,
            Position = 1,
            HelpMessage = "GenXdev module names to search"
        )]
        [string[]] $ModuleName = @("*")
    )

    begin {

        # ensure filter has wildcards if not explicitly provided
        if (!$Filter.Contains("*")) {
            $Filter = "*$Filter*"
        }

        # remove GenXdev prefix from module names if present
        $ModuleName = $ModuleName.Replace("GenXdev.", "")

        Write-Verbose "Searching for cmdlets matching '$Filter' in modules: $($ModuleName -join ',')"
    }

    process {

        # get all matching modules and their nested modules
        $results = Get-Module "GenXdev.$ModuleName" -All |
        ForEach-Object {
            $module = $PSItem
            $module.NestedModules | ForEach-Object { $_ }
            $module
        } |
        Select-Object -Unique |
        Sort-Object { $_.Name.Length } |
        ForEach-Object {
            $_.ExportedCommands.Values
        } |
        Select-Object -Unique |
        ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.CommandType -eq "Function") {

                # get aliases for functions
                $aliases = ((Get-Alias -Definition $PSItem.Name `
                            -ErrorAction SilentlyContinue |
                        ForEach-Object Name) -join ", ").Trim()
            }
            else {
                $aliases = ""
            }

            # check if command matches filter criteria
            if ((($PSItem.Name -like $Filter) -or
                            ($aliases -like $Filter)) -and
                            (($PSItem.Module.Name -eq $module.Name) -or
                            ($PSItem.Module.Name -like "$($module.Name).*"))) {

                if ($PSItem.CommandType -eq "Function") {
                    # format name and aliases string
                    $nameAndAliases = if ($aliases) {
                        "$($PSItem.Name) --> $aliases"
                    }
                    else {
                        $PSItem.Name
                    }

                    # get function description
                    $desc = Get-FunctionDescription -Command $PSItem

                    @{
                        NameAndAliases = $nameAndAliases
                        Name           = $PSItem.Name
                        Aliases        = $aliases
                        Description    = $desc
                        ModuleName     = $PSItem.Module.Name
                        Position       = 0
                    }
                }
            }
        }

        # sort and return results
        $results | Sort-Object {
            $_.ModuleName.Length.ToString().PadLeft(4, "0") +
            $_.Name.Length.ToString().PadLeft(4, "0") +
            $_.Position.ToString().PadLeft("5", 0) +
            $_.ModuleName + "_" + $_.Name
        } -Unique
    }

    end {
    }
}

function Get-FunctionDescription {
    param([System.Management.Automation.FunctionInfo]$Command)

    try {
        # try getting description from help
        $help = Get-Help $Command.Name -Detailed -ErrorAction SilentlyContinue
        if ($help.Description.Text) { return $help.Description.Text }

        # fallback to parsing description from script block
        $pattern = "#\s*DESCRIPTION\s+$($Command.Name):([^`r`n]*)"
        $match = [regex]::Match("$($Command.ScriptBlock)".Replace("`u{00A0}", " "),
            $pattern)
        if ($match.Success) { return $match.Groups[1].Value.Trim() }
    }
    catch {
        Write-Verbose "Failed to get description for $($Command.Name): $($_.Exception.Message)"
    }
    return ""
}
################################################################################
