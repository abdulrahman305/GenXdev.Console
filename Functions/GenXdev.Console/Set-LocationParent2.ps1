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
#>
function Set-LocationParent2 {

    [CmdletBinding()]
    [Alias("...")]

    param()

    begin {

        # output verbose information about current location
        Write-Verbose "Current location: $(Get-Location)"
    }

    process {

        # store initial location to revert if needed
        $initialLocation = Get-Location

        # try to navigate up 2 levels
        try {
            for ($i = 1; $i -le 2; $i++) {

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
    }
}
################################################################################
