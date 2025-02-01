###############################################################################

<#
.SYNOPSIS
Turns the monitor power off

.DESCRIPTION
Turns the monitor power off
#>
function Set-MonitorPowerOff {

    [CmdletBinding()]

    param()

    Start-Sleep 2

    [GenXdev.Helpers.WindowObj]::SleepMonitor();
}
