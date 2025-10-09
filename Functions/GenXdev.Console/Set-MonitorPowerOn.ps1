<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Set-MonitorPowerOn.ps1
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
Turns the monitor power on.

.DESCRIPTION
Uses the Windows API through GenXdev.Helpers.WindowObj to wake up the monitor
from sleep/power off state. This is useful for automation scripts that need to
ensure the monitor is powered on.

.EXAMPLE
Set-MonitorPowerOn

.EXAMPLE
wake-monitor
#>
function Set-MonitorPowerOn {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('wakemonitor', 'monitoroff')]

    param()

    begin {

        # inform user that we're attempting to wake the monitor
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to wake monitor from sleep/power off state'
    }


    process {

        # only proceed if ShouldProcess approves the action
        if ($PSCmdlet.ShouldProcess('Monitor', 'Power On')) {

            # call the windows api through our helper class to wake the monitor
            $null = [GenXdev.Helpers.WindowObj]::WakeMonitor()
        }
    }

    end {
    }
}