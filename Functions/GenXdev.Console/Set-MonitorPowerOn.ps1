###############################################################################
<#
.SYNOPSIS
Turns the monitor power on.

.DESCRIPTION
Uses the Windows API through GenXdev.Helpers.WindowObj to wake up the monitor
from sleep/power off state. This is useful for automation scripts that need to
ensure the monitor is powered on.

.EXAMPLE
Set-MonitorPowerOn

.EXAMPLE
wake-monitor
        ###############################################################################>
function Set-MonitorPowerOn {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("wake-monitor")]

    param()

    begin {

        # inform user that we're attempting to wake the monitor
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to wake monitor from sleep/power off state"
    }


process {

        # only proceed if ShouldProcess approves the action
        if ($PSCmdlet.ShouldProcess("Monitor", "Power On")) {

            # call the windows api through our helper class to wake the monitor
            $null = [GenXdev.Helpers.WindowObj]::WakeMonitor()
        }
    }

    end {
    }
}
        ###############################################################################