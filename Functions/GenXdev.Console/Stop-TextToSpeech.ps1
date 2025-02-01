###############################################################################

<#
.SYNOPSIS
Will stop the text-to-speech engine from saying anything else

.DESCRIPTION
Will stop the text-to-speech engine from saying anything else

.PARAMETER None
This function does not take any parameters.

.EXAMPLE
PS C:\> say "Good morning"; say "Good evening"; Stop-TextToSpeech; # -> "G.."

.NOTES
See also: Start-TextToSpeech -> say, and Skip-TextToSpeech -> sstSkip
#>
function Stop-TextToSpeech {

    [CmdletBinding()]
    [Alias("sst")]

    param()

    try {
        [GenXdev.Helpers.Misc]::Speech.SpeakAsyncCancelAll() | Out-Null
        [GenXdev.Helpers.Misc]::SpeechCustomized.SpeakAsyncCancelAll() | Out-Null
    }
    catch {

    }
}
