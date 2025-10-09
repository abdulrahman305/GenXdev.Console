<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Set-MonitorPowerOff.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
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
    [Alias('poweroff')]

    param()

    begin {

        # inform user that monitor power-off sequence is starting
        Microsoft.PowerShell.Utility\Write-Verbose 'Preparing to turn off monitor(s)...'
    }


    process {

        # wait briefly to allow any pending screen operations to complete
        Microsoft.PowerShell.Utility\Start-Sleep 2

        # check if we should proceed with turning off the monitors
        if ($PSCmdlet.ShouldProcess('All Monitors', 'Turn Off')) {

            # invoke windows power management api to trigger monitor power-off
            $null = [GenXdev.Helpers.WindowObj]::SleepMonitor();
        }
    }

    end {
    }
}