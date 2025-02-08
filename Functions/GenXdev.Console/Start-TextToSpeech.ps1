################################################################################
<#
.SYNOPSIS
Converts text to speech using the Windows Speech API.

.DESCRIPTION
Uses the Windows Speech API to convert text to speech. Supports different voices
and locales, with options for synchronous or asynchronous playback.

.PARAMETER Lines
The text to be spoken. Can be a single string or array of strings.

.PARAMETER Locale
The language locale ID to use (e.g., 'en-US', 'es-ES').

.PARAMETER VoiceName
The specific voice name to use for speech synthesis.

.PARAMETER PassThru
When specified, outputs the text being spoken to the pipeline.

.PARAMETER Wait
When specified, waits for speech to complete before continuing.

.EXAMPLE
Start-TextToSpeech "Hello World" -Locale "en-US"

.EXAMPLE
"Hello World" | say -Wait
#>
function Start-TextToSpeech {

    [CmdletBinding()]
    [Alias("say")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromRemainingArguments = $true,
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
        Write-Verbose "Initializing text-to-speech with Locale: $Locale, Voice: $VoiceName"
    }

    process {
        # process each line of text
        @($Lines) | ForEach-Object {

            $text = $PSItem

            # convert non-string objects to string
            if ($text -isnot [string]) {
                $text = "$text"
            }

            try {
                # output text if passthru is enabled
                if ($PassThru) {
                    $text
                }

                # clean up text by removing special characters
                $text = $text.Replace("`r", ' ').Replace("`n", ' ').Replace("`t", ' ')
                Write-Verbose "Processing text: $text"

                # handle default voice scenario
                if ([string]::IsNullOrWhiteSpace($Locale)) {
                    if ([string]::IsNullOrWhiteSpace($VoiceName)) {
                        # use default voice with optional wait
                        if ($Wait) {
                            Write-Verbose "Speaking synchronously with default voice"
                            $null = [GenXdev.Helpers.Misc]::Speech.Speak($text)
                            return
                        }
                        Write-Verbose "Speaking asynchronously with default voice"
                        $null = [GenXdev.Helpers.Misc]::Speech.SpeakAsync($text)
                        return
                    }

                    # use specified voice name without locale
                    try {
                        $voice = [GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices() |
                            Where-Object {
                                if ([string]::IsNullOrWhiteSpace($VoiceName) -or
                                    ($PSItem.VoiceInfo.Name -like "* $VoiceName *")) {
                                    $PSItem
                                }
                            } |
                            Where-Object Name |
                            Select-Object -First 1

                        [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice($voice)
                    }
                    catch {
                        Write-Warning "Could not set voice: $VoiceName"
                    }

                    $null = [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($text)
                    return
                }

                # use specified locale and optional voice name
                try {
                    $voice = [GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices($Locale) |
                        Where-Object {
                            if ([string]::IsNullOrWhiteSpace($VoiceName) -or
                                ($PSItem.VoiceInfo.Name -like "* $VoiceName *")) {
                                $PSItem
                            }
                        } |
                        Where-Object Name |
                        Select-Object -First 1

                    [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice($voice)
                }
                catch {
                    Write-Warning "Could not set voice for locale: $Locale"
                }

                $null = [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($text)
            }
            catch {
                Write-Error "Speech synthesis failed: $($PSItem.Exception.Message)"
                $null = [GenXdev.Helpers.Misc]::Speech.Speak($text)
            }
        }
    }

    end {
    }
}
################################################################################
