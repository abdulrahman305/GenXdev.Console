################################################################################
<#
.SYNOPSIS
Speaks the current date using text-to-speech.

.DESCRIPTION
This function uses the text-to-speech engine to announce the current date in a
natural language format (e.g., "It is Monday, January 1 2024").

.EXAMPLE
SayDate

.NOTES
Uses the Start-TextToSpeech cmdlet for speech synthesis.
#>
function SayDate {

    [CmdletBinding()]
    param()

    begin {
        # get the current date in natural language format
        $dateText = "It is " + [DateTime]::Now.ToString("dddd, MMMM d yyyy")
        Write-Verbose "Preparing to speak date: $dateText"
    }

    process {
        # speak the date using text-to-speech
        $null = Start-TextToSpeech $dateText
    }

    end {
    }
}
################################################################################
