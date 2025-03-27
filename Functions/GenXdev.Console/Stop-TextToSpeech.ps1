################################################################################

<#
.SYNOPSIS
Immediately stops any ongoing text-to-speech output.

.DESCRIPTION
Halts all active and queued speech synthesis by canceling both standard and
customized speech operations. This provides an immediate silence for any ongoing
text-to-speech activities.

.EXAMPLE
PS C:\> Stop-TextToSpeech
# Immediately stops any ongoing speech

.EXAMPLE
PS C:\> say "Hello world"; sst
# Starts speaking but gets interrupted immediately

.NOTES
This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)
and Skip-TextToSpeech (alias: sstSkip) for speech control.
#>
function Stop-TextToSpeech {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("sst")]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Initiating speech cancellation request"
    }


process {

        try {
            if ($PSCmdlet.ShouldProcess("Text-to-speech output", "Stop")) {
                # cancel all pending standard speech operations
                $null = [GenXdev.Helpers.Misc]::Speech.SpeakAsyncCancelAll()

                # cancel all pending customized speech operations
                $null = [GenXdev.Helpers.Misc]::SpeechCustomized.SpeakAsyncCancelAll()

                Microsoft.PowerShell.Utility\Write-Verbose "Successfully cancelled all speech operations"
            }
        }
        catch {
            # silently handle any speech cancellation errors
            Microsoft.PowerShell.Utility\Write-Verbose "Error occurred while attempting to cancel speech"
        }
    }

    end {
    }
}
################################################################################