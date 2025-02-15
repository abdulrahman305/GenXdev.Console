################################################################################
<#
.SYNOPSIS
Displays GenXdev PowerShell modules with their cmdlets and aliases.

.DESCRIPTION
Lists all installed GenXdev PowerShell modules and their associated cmdlets and
aliases. Provides filtering capabilities for module names and cmdlet names. Can
display results in console or open online documentation on GitHub.

.PARAMETER Filter
Pattern to filter cmdlets by name. Wildcards (*) are supported and automatically
added if not present. Example: "Get" becomes "*Get*"

.PARAMETER ModuleName
Array of module names to filter on. The "GenXdev." prefix is optional.
Supports wildcards (*). Filters modules based on these names.

.PARAMETER Online
When specified, opens the GitHub documentation page instead of console output.
Links to the cmdlet index section of the module's README.md.

.EXAMPLE
Show-GenXDevCmdlets -Filter "Get" -ModuleName "Console"
Lists all cmdlets starting with "Get" in the Console module

.EXAMPLE
cmds get -m console
Same as above using alias and positional parameters
#>
function Show-GenXDevCmdlets {

    [CmdletBinding()]
    [Alias("cmds")]

    param(
        #######################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments,
            HelpMessage = "Search string to filter cmdlets"
        )]
        [string] $Filter = "*",
        #######################################################################

        #######################################################################
        [Alias("m")]
        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false,
            HelpMessage = "Module names to filter on"
        )]
        [string[]] $ModuleName = @("*"),
        #######################################################################

        #######################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Open GitHub documentation instead of console output"
        )]
        [switch] $Online
        #######################################################################
    )

    begin {

        # ensure filter has wildcards for flexible matching
        if (!$Filter.Contains("*")) {
            Write-Verbose "Adding wildcards to filter: *$Filter*"
            $Filter = "*$Filter*"
        }

        # standardize module names by removing genxdev prefix if present
        $ModuleName = $ModuleName.Replace("GenXdev.", "")
    }

    process {

        # retrieve all modules matching the specified name pattern
        $modules = Get-Module "GenXdev.$ModuleName" -All

        $modules | ForEach-Object -Process {

            # handle online documentation requests
            if ($Online -eq $true -and ($PSItem.Name -notin @(
                        "GenXdev.Local",
                        "GenXdev.*.*"))) {

                Write-Verbose "Opening online documentation for $($PSItem.Name)"
                Open-Webbrowser `
                    -Url "https://github.com/genXdev/$($PSItem.Name)/blob/main/README.md#cmdlet-index" `
                    -Monitor -1
                return
            }
            elseif ($Online -eq $true) {
                return
            }

            # setup tracking variables for current module processing
            $module = $PSItem
            $name = $module.Name.SubString("GenXdev.".Length)
            $first = $true

            # initialize list to track processed commands and prevent duplicates
            [System.Collections.Generic.List[string]] $commandFilter = `
                [System.Collections.Generic.List[string]]::new()

            # process any submodules for parent modules
            if ($name.Contains(".") -eq $false) {

                foreach ($otherModule in $modules) {

                    if ($otherModule.Name -like "GenXdev.$name.*") {

                        foreach ($filteredCommand in $otherModule.ExportedCommands.Values) {

                            if ($commandFilter.Contains($filteredCommand.Name)) {
                                continue
                            }

                            $null = $commandFilter.Add($filteredCommand.Name)
                        }
                    }
                }
            }

            # build output string with filtered commands and aliases
            $result = [string]::Join(", ", @(
                    $PSItem.ExportedCommands.Values |
                    ForEach-Object -ErrorAction SilentlyContinue {

                        $exportedCommand = $PSItem

                        if ($exportedCommand.Name -in $commandFilter) { return }

                        if ($exportedCommand.Name -like $Filter) {

                            if ($first) {
                                Write-Verbose "Processing module: $name"
                                "`r`n" + $name + ":" | Write-Host -ForegroundColor "Yellow"
                            }

                            $first = $false

                            if ($exportedCommand.CommandType -eq "Function") {

                                # get and format aliases for the current command
                                $aliases = ((Get-Alias -Definition $exportedCommand.Name `
                                            -ErrorAction SilentlyContinue |
                                        ForEach-Object Name) -Join ", ").Trim()

                                # format output string with command name and aliases
                                if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {
                                    "$($exportedCommand.Name) --> $aliases"
                                }
                                else {
                                    $exportedCommand.Name
                                }
                            }
                        }
                    }
                )
            ).Trim("`r`n ".ToCharArray())

            # output non-empty results
            if ([string]::IsNullOrWhiteSpace($result) -eq $false) {
                $result
            }
        }
    }

    end {
    }
}
################################################################################
