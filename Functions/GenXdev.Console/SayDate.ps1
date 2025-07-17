###############################################################################
<#
.SYNOPSIS
Speaks the current date using text-to-speech synthesis.

.DESCRIPTION
Converts the current date into a natural language format and announces it using
the system's text-to-speech engine. The date is spoken in the format:
"It is [day of week], [month] [day] [year]"

.EXAMPLE
SayDate
Announces today's date using text-to-speech
#>
function SayDate {

    [CmdletBinding()]
    param()

    begin {

        # format current date into natural speech pattern
        # e.g. "It is Monday, January 1 2024"
        $dateText = 'It is ' + [DateTime]::Now.ToString('dddd, MMMM d yyyy')

        # log the text that will be spoken
        Microsoft.PowerShell.Utility\Write-Verbose "Preparing to speak: $dateText"
    }


    process {

        # use text-to-speech engine to announce the date
        # suppress output by assigning to $null
        $null = GenXdev.Console\Start-TextToSpeech $dateText
    }

    end {
    }
}