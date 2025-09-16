<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : UtcNow.ps1
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
Gets the current UTC (Coordinated Universal Time) date and time.

.DESCRIPTION
Returns the current UTC date and time as a System.DateTime object. This function
provides a standardized way to retrieve UTC time across different systems and
time zones. The returned DateTime object can be used for timestamp
synchronization, logging, and cross-timezone operations.

.EXAMPLE
$currentUtc = UtcNow
Returns the current UTC time as a DateTime object.

.EXAMPLE
$timestamp = (UtcNow).ToString("yyyy-MM-dd HH:mm:ss")
Gets the current UTC time and formats it as a string.
#>
function UtcNow {

    [CmdletBinding()]
    [OutputType([System.DateTime])]
    param()

    begin {

        # log function execution for debugging purposes
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting UtcNow function execution'
    }


    process {

        # retrieve the current utc time using .net datetime for precision
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving current UTC datetime'
        [DateTime]::UtcNow
    }

    end {
    }
}