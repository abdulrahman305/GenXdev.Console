<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Set-MonitorPowerOn.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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