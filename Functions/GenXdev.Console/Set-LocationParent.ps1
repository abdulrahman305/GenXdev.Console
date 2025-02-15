################################################################################
<#
.SYNOPSIS
Changes the current location to the parent directory and lists its contents.

.DESCRIPTION
This function navigates up one directory level in the file system hierarchy and
displays the contents of the new current directory. It provides a convenient '..'
alias for quick directory navigation.

.EXAMPLE
Set-LocationParent

.EXAMPLE
..
#>
function Set-LocationParent {

    [CmdletBinding()]
    [Alias("..")]
    param()

    begin {

        Write-Verbose "Changing location to parent directory"
    }

    process {

        # check if we can move up before attempting
        $parent = Split-Path -Path (Get-Location) -Parent
        if ($null -ne $parent) {

            # navigate up one directory level
            Set-Location ..
        }
        else {
            Write-Verbose "Cannot go up further - at root level"
        }

        # show contents of the new current directory
        Get-ChildItem
    }

    end {
    }
}
################################################################################
