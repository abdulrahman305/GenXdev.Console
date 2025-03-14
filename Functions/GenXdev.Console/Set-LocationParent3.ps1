################################################################################
<#
.SYNOPSIS
Navigates up three directory levels in the file system hierarchy.

.DESCRIPTION
Changes the current working directory by moving up three parent directories in
the filesystem hierarchy and displays the contents of the resulting directory.

.EXAMPLE
Set-LocationParent3

.EXAMPLE
....
#>
function Set-LocationParent3 {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("....")]

    param (
        ########################################################################
    )

    begin {

        # output verbose information about starting directory movement
        Write-Verbose "Moving up three directory levels from: $($PWD.Path)"
    }

    process {

        # navigate up three levels
        for ($i = 1; $i -le 3; $i++) {

            # check if we can move up before attempting
            $parent = Split-Path -Path (Get-Location) -Parent
            if ($null -eq $parent) {
                Write-Verbose "Cannot go up further - at root level"
                break
            }

            # prepare target description for ShouldProcess
            $target = "from '$(Get-Location)' to '$parent' (level $i of 3)"

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

        # output verbose information about final directory location
        Write-Verbose "Arrived at new location: $($PWD.Path)"
    }
}
################################################################################