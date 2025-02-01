###############################################################################

<#
.SYNOPSIS
Provides the ... alias to go two directory up

.DESCRIPTION
Provides the ... alias to go two directory up
#>
function Set-LocationParent2 {

    [CmdletBinding()]
    [Alias("...")]

    param (

    )

    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
