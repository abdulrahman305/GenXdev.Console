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

    [CmdletBinding()]
    [Alias("....")]

    param (
        ########################################################################
    )

    begin {

        # output verbose information about starting directory movement
        Write-Verbose "Moving up three directory levels from: $($PWD.Path)"
    }

    process {

        # store initial location to revert if needed
        $initialLocation = Get-Location

        # try to navigate up 3 levels
        try {
            for ($i = 1; $i -le 3; $i++) {

                # check if we can move up before attempting
                $parent = Split-Path -Path (Get-Location) -Parent
                if ($null -eq $parent) {
                    Write-Verbose "Cannot go up further - at root level"
                    break
                }

                # attempt to change directory
                Set-Location -Path $parent -ErrorAction Stop
            }

            # display contents only if in filesystem
            if ((Get-Location).Provider.Name -eq 'FileSystem') {
                Get-ChildItem
            }
        }
        catch {
            # revert to initial location on error
            Set-Location -Path $initialLocation
            Write-Warning "Unable to navigate up: $($_.Exception.Message)"
        }
    }

    end {

        # output verbose information about final directory location
        Write-Verbose "Arrived at new location: $($PWD.Path)"
    }
}
################################################################################
