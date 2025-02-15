################################################################################
<#
.SYNOPSIS
Navigates up five directory levels in the file system hierarchy.

.DESCRIPTION
Changes the current working directory by moving up five parent directory levels
and displays the contents of the resulting directory. This function provides a
convenient shorthand alias '......' for quick navigation.

.EXAMPLE
Set-LocationParent5

.EXAMPLE
......
#>
function Set-LocationParent5 {

    [CmdletBinding()]
    [Alias("......")]

    param (
        ########################################################################
    )

    begin {

        Write-Verbose "Starting directory navigation up 5 levels from: $PWD"
    }

    process {

        # store initial location to revert if needed
        $initialLocation = Get-Location

        # try to navigate up 5 levels
        try {
            for ($i = 1; $i -le 5; $i++) {

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

        Write-Verbose "Completed navigation. New location: $PWD"
    }
}
################################################################################
