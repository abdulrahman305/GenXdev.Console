<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Enable-Screensaver.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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
Starts the configured Windows screensaver.

.DESCRIPTION
Activates the Windows system screensaver by executing the default screensaver
executable (scrnsave.scr) with the /s switch to start it immediately.

.EXAMPLE
Enable-Screensaver

.NOTES
This function requires the Windows screensaver to be properly configured in the
system settings. The screensaver executable must exist at the default Windows
System32 location.
#>
function Enable-Screensaver {

    [CmdletBinding()]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Windows screensaver activation'
    }


    process {

        # execute the windows screensaver executable with the start switch
        & "$ENV:SystemRoot\system32\scrnsave.scr" /s
    }

    end {
    }
}