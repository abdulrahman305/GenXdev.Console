###############################################################################
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

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('..')]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Changing location to parent directory'
    }


    process {

        # check if we can move up before attempting
        $parent = Microsoft.PowerShell.Management\Split-Path(Microsoft.PowerShell.Management\Get-Location) -Parent
        if ($null -ne $parent) {

            # prepare target description for ShouldProcess
            $target = "from '$(Microsoft.PowerShell.Management\Get-Location)' to '$parent'"

            # only navigate if ShouldProcess returns true
            if ($PSCmdlet.ShouldProcess($target, 'Change location')) {
                # navigate up one directory level
                Microsoft.PowerShell.Management\Set-Location ..
            }
        }
        else {
            Microsoft.PowerShell.Utility\Write-Verbose 'Cannot go up further - at root level'
        }

        # show contents of the new current directory
        Microsoft.PowerShell.Management\Get-ChildItem
    }

    end {
    }
}