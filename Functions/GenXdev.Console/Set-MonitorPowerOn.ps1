###############################################################################

<#
.SYNOPSIS
Turns the monitor power on

.DESCRIPTION
Turns the monitor power on
#>
function Set-MonitorPowerOn {

    [CmdletBinding()]

    param()

    [GenXdev.Helpers.WindowObj]::WakeMonitor();
}
