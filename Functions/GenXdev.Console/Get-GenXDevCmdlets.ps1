###############################################################################

<#
.SYNOPSIS
Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.DESCRIPTION
Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.PARAMETER Filter
Allows you to search for Cmdlets by providing searchstrings, with or without wildcards

.PARAMETER $ModuleName
Retreives all Cmdlets of provided modulename(s)

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Get-GenXDevCmdlets {

    [CmdletBinding()]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments
        )]
        [string] $Filter = "*",

        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false
        )]
        [string[]] $ModuleName = @("*")
    )

    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    $ModuleName = $ModuleName.Replace("GenXdev.", "")

    $results = Get-Module "GenXdev.$ModuleName" -All |  ForEach-Object -Process {

        $Module = $PSItem;
        $Module.NestedModules | ForEach-Object {
            $_
        }
        $Module
    } | ForEach-Object {

        $Module = $PSItem;
        $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.CommandType -eq "Function") {

                $aliases = ((Get-Alias -Definition ($PSItem.Name) -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();
            }
            else {

                $aliases = "";
            }

            if ((($PSItem.Name -like $Filter) -or ($aliases -like $Filter)) -and (($PSItem.Module.Name -eq $Module.Name) -or ($PSItem.Module.Name -like "$($Module.Name).*"))) {

                if ($PSItem.CommandType -eq "Function") {

                    $nameAndAliases = ""

                    if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {

                        $nameAndAliases = "$($PSItem.Name) --> $aliases"
                    }
                    else {
                        $nameAndAliases = $PSItem.Name
                    }

                    $desc = "";
                    try {
                        $tmp = (Get-Help ($PSItem.Name) -Detailed -ErrorAction SilentlyContinue);
                        if ($null -ne $tmp) {
                            $tmp = $tmp.Description;
                            if ($null -ne $tmp) {
                                $tmp = $tmp.Text;
                                if ($null -ne $tmp) {
                                    $desc = $tmp;
                                }
                            }
                        }

                        if ([string]::IsNullOrWhiteSpace($desc)) {

                            try {
                                $desc = "$(Select-String "#\s*DESCRIPTION\s+$($PSItem.Name):([^`r`n]*)" -input "$((Get-Command "$($PSItem.Name)").ScriptBlock)".Replace("`u{00A0}", " ") -AllMatches | ForEach-Object {
                                    try {
                                    $PSItem.matches.Groups[1].Value
                                    }
                                    catch {}
                                })".Trim();
                            }
                            catch {
                                # Write-Warning $PSItem.Exception
                                $desc = "";
                            }
                        }
                    }
                    catch {
                        $desc = "";
                    }

                    $result = @{
                        NameAndAliases = $nameAndAliases;
                        Name           = $PSItem.Name;
                        Aliases        = $aliases;
                        Description    = $desc;
                        ModuleName     = $PSItem.Module.Name;
                        Position       = 0
                    }

                    $result
                }
            }
        }
    }

    $results | Sort-Object -Property Position
}
