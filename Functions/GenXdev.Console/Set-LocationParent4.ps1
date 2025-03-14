################################################################################
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
    [Alias(".....")]
    param()

    begin {

        Write-Verbose "Starting navigation up four directory levels from $(Get-Location)"
    }

    process {

        # navigate up four levels
        for ($i = 1; $i -le 4; $i++) {

            # check if we can move up before attempting
            $parent = Split-Path -Path (Get-Location) -Parent
            if ($null -eq $parent) {
                Write-Verbose "Cannot go up further - at root level"
                break
            }

            # prepare target description for ShouldProcess
            $target = "from '$(Get-Location)' to '$parent' (level $i of 4)"

            # only navigate if ShouldProcess returns true
            if ($PSCmdlet.ShouldProcess($target, "Change location")) {
                Set-Location -Path $parent
            }
            else {
                # exit the loop if user declined
                break
            }
        }

        # show contents of the new current directory if not in WhatIf mode
        if (-not $WhatIfPreference -and (Get-Location).Provider.Name -eq 'FileSystem') {
            Get-ChildItem
        }
    }

    end {

        Write-Verbose "Completed navigation. New location: $PWD"
    }
}
################################################################################