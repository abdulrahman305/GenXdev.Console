###############################################################################
<#
.SYNOPSIS
Navigates up four directory levels in the filesystem hierarchy.

.DESCRIPTION
Provides a convenient way to move up four directory levels from the current
location in the filesystem. After navigation, displays the contents of the
resulting directory.

.EXAMPLE
Set-LocationParent4

.EXAMPLE
.....

.NOTES
The alias '.....'' represents moving up four parent directories, where each dot
represents one level up.
#>
function Set-LocationParent4 {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('.....')]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting navigation up four directory levels from $(Microsoft.PowerShell.Management\Get-Location)"
    }


    process {

        # navigate up four levels
        for ($i = 1; $i -le 4; $i++) {

            # check if we can move up before attempting
            $parent = Microsoft.PowerShell.Management\Split-Path -Path (Microsoft.PowerShell.Management\Get-Location) -Parent
            if ($null -eq $parent) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Cannot go up further - at root level'
                break
            }

            # prepare target description for ShouldProcess
            $target = "from '$(Microsoft.PowerShell.Management\Get-Location)' to '$parent' (level $i of 4)"

            # only navigate if ShouldProcess returns true
            if ($PSCmdlet.ShouldProcess($target, 'Change location')) {
                Microsoft.PowerShell.Management\Set-Location -Path $parent
            }
            else {
                # exit the loop if user declined
                break
            }
        }

        # show contents of the new current directory if not in WhatIf mode
        if (-not $WhatIfPreference -and (Microsoft.PowerShell.Management\Get-Location).Provider.Name -eq 'FileSystem') {
            Microsoft.PowerShell.Management\Get-ChildItem
        }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose "Completed navigation. New location: $PWD"
    }
}