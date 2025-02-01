###############################################################################

<#
.SYNOPSIS
Starts the configured Windows screensaver

.DESCRIPTION
Starts the configured Windows screensaver

#>
function Enable-Screensaver {

    [CmdletBinding()]

    param()

    & "$ENV:SystemRoot\system32\scrnsave.scr" / s
}
