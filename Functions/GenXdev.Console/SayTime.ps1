<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : SayTime.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
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
Announces the current time using text-to-speech.

.DESCRIPTION
This function gets the current time and uses the system's text-to-speech engine
to verbally announce it in hours and minutes format. It's useful for
accessibility purposes or when you need an audible time announcement.

.EXAMPLE
SayTime
Speaks the current time, e.g. "The time is 14 hours and 30 minutes"
#>
function SayTime {

    [CmdletBinding()]
    param()

    begin {

        # get the current system time
        $date = Microsoft.PowerShell.Utility\Get-Date

        # extract hours (0-23) and minutes (0-59) from current time
        $hours = $date.Hour
        $minutes = $date.Minute

        # log the current time for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Processing time announcement for $hours`:$minutes"
    }


    process {

        # construct the speech text in a clear, consistent format
        $speechText = "The time is $($hours.ToString('0')) hours and " +
        "$($minutes.ToString('0')) minutes"

        # log the text that will be spoken
        Microsoft.PowerShell.Utility\Write-Verbose "Speaking: $speechText"

        # convert the text to speech using system TTS engine
        GenXdev.Console\Start-TextToSpeech $speechText
    }

    end {
    }
}