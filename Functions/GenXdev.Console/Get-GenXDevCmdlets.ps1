################################################################################
<#
.SYNOPSIS
Retrieves a list of all installed GenXdev modules, their cmdlets and aliases.

.DESCRIPTION
Searches through installed GenXdev modules and returns detailed information about
their cmdlets, including names, aliases, and descriptions. Supports filtering by
module name and cmdlet name patterns.

.PARAMETER Filter
A search pattern to filter cmdlets. Supports wildcards. If no wildcards are
provided, pattern is wrapped with * on both sides.

.PARAMETER ModuleName
One or more GenXdev module names to search. Defaults to all modules (*).
The "GenXdev." prefix is optional and will be added if missing.

.EXAMPLE
Get-GenXDevCmdlets -Filter "Get-*" -ModuleName "Console"

.EXAMPLE
cmds Get-*
#>
function Get-GenXDevCmdlets {

    [CmdletBinding()]
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

        # ensure search pattern has wildcards for partial matches
        if (-not $Filter.Contains("*")) {
            $Filter = "*$Filter*"
        }



        Write-Verbose "Searching for cmdlets matching '$Filter' in modules: $($ModuleName -join ',')"
    }

    process {

        # normalize module names by adding GenXdev prefix if not present
        $ModuleName = "GenXdev." + $ModuleName.Replace("GenXdev.", "")

        # initialize results collection for found cmdlets
        $results = [System.Collections.Generic.List[object]]::new()

        $modules = $ModuleName | ForEach-Object {

            # normalize module names by adding GenXdev prefix if not present
            $name = "GenXdev." + $PSItem.Replace("GenXdev.", "")

            # get all matching modules including their nested modules
            Get-Module "$($name.TrimEnd("*"))*" -All |
            ForEach-Object {
                $module = $PSItem
                $module.NestedModules | ForEach-Object { $_ }
                $module
            }
        } |
        Select-Object -Unique |
        Sort-Object { $_.Name.Length.PadLeft(4, '0') + "_" + $_.Name }

        foreach ($module in $modules) {

            # get all exported commands from the module
            $exportedCommands = $module.ExportedCommands.Values |
            ForEach-Object { $_ } |
            Select-Object -Unique

            $exportedCommands |
            ForEach-Object -ErrorAction SilentlyContinue {

                if ($PSItem.CommandType -eq "Function") {
                    # get all aliases for this function
                    $aliases = ((Get-Alias -Definition ($PSItem.Name) `
                                -ErrorAction SilentlyContinue |
                            ForEach-Object Name) -join ", ").Trim()
                }
                else {
                    $aliases = ""
                }

                # check if command matches filter criteria
                if ((($PSItem.Name -like $Filter) -or
                                ($aliases -like $Filter)) -and
                                (($PSItem.Module.Name -eq $moduleName) -or
                                ($PSItem.Module.Name -like "$($ModuleName.TrimEnd("*"))*"))) {

                    if ($PSItem.CommandType -eq "Function") {

                        # format display string with name and aliases
                        $nameAndAliases = if ($aliases) {
                            "$($PSItem.Name) --> $aliases"
                        }
                        else {
                            $PSItem.Name
                        }

                        # get function description from help or script block
                        $desc = Get-FunctionDescription -Command $PSItem

                        # add function info to results
                        $null = $results.Add(
                            @{
                                NameAndAliases = $nameAndAliases
                                Name           = $PSItem.Name
                                Aliases        = $aliases
                                Description    = $desc
                                ModuleName     = $PSItem.Module.Name
                                Position       = 0
                            }
                        )
                    }
                }
            }
        }

        # sort and return results by module name length, function name length
        $results | Sort-Object { (
                $_.ModuleName.Length.ToString().PadLeft(4, "0") +
                $_.Name.Length.ToString().PadLeft(4, "0") +
                $_.Position.ToString().PadLeft("5", 0) +
                $_.ModuleName + "_" + $_.Name
            ) } -Unique
    }

    end {
    }
}

########################################################################
<#
.SYNOPSIS
Helper function to extract function descriptions from help or script block.

.PARAMETER Command
The function info object to get the description for.
#>
function Get-FunctionDescription {

    param([System.Management.Automation.FunctionInfo]$Command)

    try {
        # try getting description from help documentation
        $help = Get-Help $Command.Name -Detailed -ErrorAction SilentlyContinue
        if ($help.Description.Text) { return $help.Description.Text }

        # fallback to parsing description from script block comments
        $pattern = "#\s*DESCRIPTION\s+$($Command.Name):([^`r`n]*)"
        $match = [regex]::Match("$($Command.ScriptBlock)".Replace("`u{00A0}", " "),
            $pattern)

        if ($match.Success) {
            return $match.Groups[1].Value.Trim()
        }
    }
    catch {
        Write-Verbose "Failed to get description for $($Command.Name): $($_.Exception.Message)"
    }
    return ""
}
################################################################################
