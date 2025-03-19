################################################################################
<#
.SYNOPSIS
Returns true if the text-to-speech engine is speaking.

.DESCRIPTION
Checks the state of both the default and customized speech synthesizers to
determine if either is currently speaking. Returns true if speech is in progress,
false otherwise.

.EXAMPLE
Get-IsSpeaking

.EXAMPLE
iss
#>
function Get-IsSpeaking {

    [CmdletBinding()]
    [Alias("iss")]
    [OutputType([System.Boolean])]

    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Checking speech synthesizer states..."
    }

    process {

        try {
            # check both default and customized speech synthesizer states
            return (
                ([GenXdev.Helpers.Misc]::Speech.State -eq "Speaking") -or
                ([GenXdev.Helpers.Misc]::SpeechCustomized.State -eq "Speaking")
            )
        }
        catch {
            # return false if unable to check speech state
            Microsoft.PowerShell.Utility\Write-Verbose "Failed to check speech state: $_"
            return $false
        }
    }

    end {
    }
}
################################################################################