################################################################################
<#
.SYNOPSIS
Converts text to speech using the Windows Speech API.

.DESCRIPTION
Uses the Windows Speech API to convert text to speech. This function provides
flexible text-to-speech capabilities with support for different voices, locales,
and synchronous/asynchronous playback options. It can handle both single strings
and arrays of text, with error handling for speech synthesis failures.

.PARAMETER Lines
The text to be spoken. Accepts single string or array of strings. Each line will
be processed sequentially for speech synthesis.

.PARAMETER Locale
The language locale ID to use (e.g., 'en-US', 'es-ES'). When specified, the
function will attempt to use a voice matching this locale.

.PARAMETER VoiceName
The specific voice name to use for speech synthesis. If specified, the function
will attempt to find and use a matching voice from installed voices.

.PARAMETER PassThru
When specified, outputs the text being spoken to the pipeline, allowing for
text processing while speaking.

.PARAMETER Wait
When specified, waits for speech to complete before continuing execution.
Useful for synchronous operations.

.EXAMPLE
Start-TextToSpeech -Lines "Hello World" -Locale "en-US" -Wait

.EXAMPLE
"Hello World" | say
#>
function Start-TextToSpeech {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("say")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromRemainingArguments = $false,
            ParameterSetName = "strings",
            HelpMessage = "Text to be spoken"
        )]
        [string[]] $Lines,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The language locale id to use, e.g. 'en-US'"
        )]
        [string] $Locale = $null,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Name of the voice to use for speech"
        )]
        [string] $VoiceName = $null,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Output the text being spoken to the pipeline"
        )]
        [switch] $PassThru,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Wait for speech to complete before continuing"
        )]
        [switch] $Wait
        ########################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Initializing text-to-speech with Locale: $Locale, Voice: $VoiceName"
    }

    process {

        # iterate through each line of text for processing
        @($Lines) | Microsoft.PowerShell.Core\ForEach-Object {

            $text = $PSItem

            # ensure non-string objects are converted to strings
            if ($text -isnot [string]) {

                $text = "$text"
            }

            try {
                # output text to pipeline if passthru is enabled
                if ($PassThru) {

                    $text
                }

                # normalize text by removing newlines and tabs
                $text = $text.Replace("`r", ' ').Replace("`n", ' ').Replace("`t", ' ')
                Microsoft.PowerShell.Utility\Write-Verbose "Processing text: $text"

                # handle case when no locale is specified
                if ([string]::IsNullOrWhiteSpace($Locale)) {

                    if ([string]::IsNullOrWhiteSpace($VoiceName)) {

                        # use default voice with wait option
                        if ($Wait) {

                            Microsoft.PowerShell.Utility\Write-Verbose "Speaking synchronously with default voice"

                            if ($PSCmdlet.ShouldProcess($text, "Speak")) {

                                $null = [GenXdev.Helpers.Misc]::Speech.Speak($text)
                            }
                            return
                        }

                        Microsoft.PowerShell.Utility\Write-Verbose "Speaking asynchronously with default voice"

                        if ($PSCmdlet.ShouldProcess($text, "Speak asynchronously")) {

                            $null = [GenXdev.Helpers.Misc]::Speech.SpeakAsync($text)
                        }
                        return
                    }

                    # attempt to use specified voice without locale
                    try {

                        $voice = [GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices() |
                        Microsoft.PowerShell.Core\Where-Object {
                            if ([string]::IsNullOrWhiteSpace($VoiceName) -or
                                    ($PSItem.VoiceInfo.Name -like "* $VoiceName *")) {

                                $PSItem
                            }
                        } |
                        Microsoft.PowerShell.Core\Where-Object Name |
                        Microsoft.PowerShell.Utility\Select-Object -First 1

                        if ($PSCmdlet.ShouldProcess("Voice: $($voice.Name)", "Select voice")) {

                            $null = [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice($voice)
                        }
                    }
                    catch {

                        Microsoft.PowerShell.Utility\Write-Warning "Could not set voice: $VoiceName"
                    }

                    if ($PSCmdlet.ShouldProcess($text, "Speak with selected voice")) {

                        $null = [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($text)
                    }
                    return
                }

                # attempt to use voice with specified locale
                try {

                    $voice = [GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices($Locale) |
                    Microsoft.PowerShell.Core\Where-Object {
                        if ([string]::IsNullOrWhiteSpace($VoiceName) -or
                                ($PSItem.VoiceInfo.Name -like "* $VoiceName *")) {

                            $PSItem
                        }
                    } |
                    Microsoft.PowerShell.Core\Where-Object Name |
                    Microsoft.PowerShell.Utility\Select-Object -First 1

                    if ($PSCmdlet.ShouldProcess("Voice: $($voice.Name)", "Select voice")) {

                        $null = [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice($voice)
                    }
                }
                catch {

                    Microsoft.PowerShell.Utility\Write-Warning "Could not set voice for locale: $Locale"
                }

                if ($PSCmdlet.ShouldProcess($text, "Speak with locale-specific voice")) {

                    $null = [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($text)
                }
            }
            catch {

                Microsoft.PowerShell.Utility\Write-Error "Speech synthesis failed: $($PSItem.Exception.Message)"

                if ($PSCmdlet.ShouldProcess($text, "Speak with default voice (fallback)")) {

                    $null = [GenXdev.Helpers.Misc]::Speech.Speak($text)
                }
            }
        }
    }

    end {
    }
}
################################################################################