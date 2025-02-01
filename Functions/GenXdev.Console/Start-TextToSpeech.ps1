function Start-TextToSpeech {

    [CmdletBinding()]
    [Alias("say")]

    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromRemainingArguments, ParameterSetName = "strings")]
        [string[]] $lines,

        [Parameter(Mandatory = $false, HelpMessage = "The language locale id to use, e.g. 'en-US'")]
        [string] $Locale = $null,

        [Parameter(Mandatory = $False)]
        [string] $VoiceName = $null,

        [Parameter(Mandatory = $False)]
        [switch] $PassThru,

        [Parameter(Mandatory = $False)]
        [switch] $wait
    )

    Begin {

    }

    Process {

        @($lines) | ForEach-Object -Process {

            $txt = $PSItem

            if ($txt -isnot [string]) {

                $txt = "$txt"
            }

            try {

                if ($PassThru -eq $true) {

                    $txt
                }

                $txt = $txt.Replace("`r", ' ').Replace('`n', ' ').Replace('`t', ' ');

                if ([string]::IsNullOrWhiteSpace($Locale)) {

                    if ([string]::IsNullOrWhiteSpace($VoiceName)) {

                        if ($wait -eq $true) {

                            [GenXdev.Helpers.Misc]::Speech.Speak($txt) | Out-Null;
                            return;
                        }
                        [GenXdev.Helpers.Misc]::Speech.SpeakAsync($txt) | Out-Null;

                        return;
                    }

                    try {
                        [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice((([GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices()) | Where-Object { if ([string]::IsNullOrWhiteSpace($VoiceName) -or ($PSItem.VoiceInfo.Name -like "* $VoiceName * ")) { $PSItem } } | Where-Object Name | Select-Object -First 1))
                    }
                    catch {
                        Write-Warning "Could not set voice with provided parameters, maybe no installation found of the voice with your selection parameters"
                    }
                    [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($txt) | Out-Null;
                    return;
                }

                try {
                    [GenXdev.Helpers.Misc]::SpeechCustomized.SelectVoice((([GenXdev.Helpers.Misc]::SpeechCustomized.GetInstalledVoices($locale)) | Where-Object { if ([string]::IsNullOrWhiteSpace($VoiceName) -or ($PSItem.VoiceInfo.Name -like "* $VoiceName * ")) { $PSItem } } | Where-Object Name | Select-Object -First 1))
                }
                catch {
                    Write-Warning "Could not set voice with provided parameters, maybe no installation found of the voice with your selection parameters"
                }

                [GenXdev.Helpers.Misc]::SpeechCustomized.Speak($txt) | Out-Null;
                return;
            }
            catch {
                [System.Console]::WriteLine("Error: $($PSItem.Exception.Message)");
                [GenXdev.Helpers.Misc]::Speech.Speak($txt) | Out-Null;
            }
        }
    }
}
