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

    [CmdletBinding()]
    [Alias(".....")]
    param()

    begin {

        Write-Verbose "Starting navigation up four directory levels from $(Get-Location)"
    }

    process {

        # store initial location to revert if needed
        $initialLocation = Get-Location

        # try to navigate up 4 levels
        try {
            for ($i = 1; $i -le 4; $i++) {

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
