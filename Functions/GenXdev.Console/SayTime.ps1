################################################################################
<#
.SYNOPSIS
Announces the current time using text-to-speech.

.DESCRIPTION
This function gets the current time and uses the system's text-to-speech engine
to verbally announce it in hours and minutes format. It's useful for
accessibility purposes or when you need an audible time announcement.

.EXAMPLE
SayTime
# Speaks the current time, e.g. "The time is 14 hours and 30 minutes"
#>
function SayTime {

    [CmdletBinding()]
    param()

    begin {

        # get the current system time
        $date = Get-Date

        # extract hours (0-23) and minutes (0-59) from current time
        $hours = $date.Hour
        $minutes = $date.Minute

        # log the current time for troubleshooting
        Write-Verbose "Processing time announcement for $hours`:$minutes"
    }

    process {

        # construct the speech text in a clear, consistent format
        $speechText = "The time is $($hours.ToString('0')) hours and " +
        "$($minutes.ToString('0')) minutes"

        # log the text that will be spoken
        Write-Verbose "Speaking: $speechText"

        # convert the text to speech using system TTS engine
        Start-TextToSpeech $speechText
    }

    end {
    }
}
################################################################################
