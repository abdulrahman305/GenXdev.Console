<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Set-MonitorPowerOff.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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