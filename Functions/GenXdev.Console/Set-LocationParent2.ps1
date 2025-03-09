################################################################################
<#
.SYNOPSIS
Navigates up two directory levels in the file system hierarchy.

.DESCRIPTION
Changes the current working directory to the grandparent directory (two levels up)
and displays the contents of the resulting directory.

.EXAMPLE
Set-LocationParent2

.EXAMPLE
...

.NOTES
This function supports -WhatIf and -Confirm parameters through ShouldProcess.
#>
function Set-LocationParent2 {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("...")]

    param()

    begin {

        # output verbose information about current location
        Write-Verbose "Current location: $(Get-Location)"
    }

    process {

        # navigate up two levels
        for ($i = 1; $i -le 2; $i++) {

            # check if we can move up before attempting
            $parent = Split-Path -Path (Get-Location) -Parent
            if ($null -eq $parent) {
                Write-Verbose "Cannot go up further - at root level"
                break
            }

            # prepare target description for ShouldProcess
            $target = "from '$(Get-Location)' to '$parent' (level $i of 2)"

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

        Write-Verbose "Navigation completed to: $($PWD.Path)"
    }
}
################################################################################
