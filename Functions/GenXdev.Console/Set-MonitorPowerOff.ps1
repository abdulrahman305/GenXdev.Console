################################################################################
<#
.SYNOPSIS
Turns off power to all connected monitors.

.DESCRIPTION
Uses Windows API calls to send a power-off signal to all connected monitors. This
is equivalent to pressing the physical power button on your monitors. The monitors
will enter power saving mode but can be awakened by moving the mouse or pressing
a key.

.EXAMPLE
Set-MonitorPowerOff

.EXAMPLE
poweroff
#>
function Set-MonitorPowerOff {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("poweroff")]

    param()

    begin {

        # inform user that monitor power-off sequence is starting
        Microsoft.PowerShell.Utility\Write-Verbose "Preparing to turn off monitor(s)..."
    }


process {

        # wait briefly to allow any pending screen operations to complete
        Microsoft.PowerShell.Utility\Start-Sleep 2

        # check if we should proceed with turning off the monitors
        if ($PSCmdlet.ShouldProcess("All Monitors", "Turn Off")) {

            # invoke windows power management api to trigger monitor power-off
            $null = [GenXdev.Helpers.WindowObj]::SleepMonitor();
        }
    }

    end {
    }
}
################################################################################