################################################################################
<#
.SYNOPSIS
Speaks the current time using text-to-speech.

.DESCRIPTION
This function retrieves the current time and uses text-to-speech to announce it
in hours and minutes format.

.EXAMPLE
SayTime
#>
function SayTime {

    [CmdletBinding()]
    param()

    begin {

        # get current date and time
        $date = Get-Date

        # extract hours and minutes
        $hours = $date.Hour
        $minutes = $date.Minute

        Write-Verbose "Current time: $hours hours and $minutes minutes"
    }

    process {

        # construct speech text
        $speechText = "The time is $($hours.ToString('0')) hours and " +
            "$($minutes.ToString('0')) minutes"

        # speak the time
        Start-TextToSpeech $speechText
    }

    end {
    }
}
################################################################################
