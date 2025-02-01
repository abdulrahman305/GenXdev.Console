###############################################################################

<#
.SYNOPSIS
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.DESCRIPTION
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.PARAMETER Filter
Allows you to search for Cmdlets by providing searchstrings, with or without wildcards

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Show-GenXDevCmdlets {

    [CmdletBinding()]
    [Alias("cmds")]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments
        )]
        [string] $Filter = "*",

        [Alias("m")]
        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false
        )]
        [string[]] $ModuleName = @("*"),

        [parameter(
            Mandatory = $false
        )]
        [switch] $Online
    )


    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    $ModuleName = $ModuleName.Replace("GenXdev.", "")

    $modules = Get-Module "GenXdev.$ModuleName" -All;
    $modules | ForEach-Object -Process {

        if ($Online -eq $true -and ($PSItem.Name -notin @("GenXdev.Local", "GenXdev.Git", "GenXdev.*.*"))) {

            Open-Webbrowser -Url "https://github.com/genXdev/$($PSItem.Name)/blob/main/README.md#cmdlet-index" -Monitor -1
            return;
        }
        else {
            if ($Online -eq $true) {

                return;
            }
            $module = $PSItem
            $name = $module.Name.SubString("GenXdev.".Length);
            $first = $true;
            [System.Collections.Generic.List[string]] $commandFilter = [System.Collections.Generic.List[string]]::new();

            if ($name.Contains(".") -eq $false) {

                foreach ($otherModule in $modules) {

                    if ($otherModule.Name -like "GenXdev.$name.*") {

                        foreach ($filteredCommand in $otherModule.ExportedCommands.Values) {

                            if ($commandFilter.Contains($filteredCommand.Name)) { continue; }

                            $commandFilter.Add($filteredCommand.Name);
                        }
                    }
                }
            }

            $result = [string]::Join(", ", @(
                    $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

                        $exportedCommand = $PSItem;

                        if ($exportedCommand.Name -in $commandFilter) { return }

                        if ($exportedCommand.Name -like $Filter) {

                            if ($first) {

                                "`r`n" + $name + ":" | Write-Host -ForegroundColor "Yellow"
                            }

                            $first = $false;

                            if ($exportedCommand.CommandType -eq "Function") {

                                $aliases = ((Get-Alias -Definition $exportedCommand.Name -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();

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

            if ([string]::IsNullOrWhiteSpace($result) -eq $false) {

                $result;
            }
        }
    }
}
