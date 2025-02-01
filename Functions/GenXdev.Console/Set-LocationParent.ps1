###############################################################################

<#
.SYNOPSIS
Provides the .. alias to go one directory up

.DESCRIPTION
Provides the .. alias to go one directory up
#>
function Set-LocationParent {

    [CmdletBinding()]
    [Alias("..")]

    param (

    )

    Set-Location ..
    Get-ChildItem
}
