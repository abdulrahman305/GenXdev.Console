###############################################################################
<#
.SYNOPSIS
Returns true if the text-to-speech engine is speaking

.DESCRIPTION
Returns true if the text-to-speech engine is speaking
#>
function Get-IsSpeaking {

    [CmdletBinding()]
    [Alias("iss")]

    param()

    try {
        return (
            ([GenXdev.Helpers.Misc]::Speech.State -eq "Speaking") -or
            ([GenXdev.Helpers.Misc]::SpeechCustomized.State -eq "Speaking")
        )
    }
    catch {
        return $false
    }
}
