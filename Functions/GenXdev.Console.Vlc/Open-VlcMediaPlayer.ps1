################################################################################
<#
.SYNOPSIS
Launches and controls VLC Media Player with extensive configuration options.

.DESCRIPTION
Provides a comprehensive interface to launch and control VLC Media Player with
support for:
- Window positioning and monitor selection
- Playback settings (speed, aspect ratio, etc)
- Audio/video filters and options
- Subtitle handling
- Multiple language support
- Network proxy settings
- Advanced performance options

.PARAMETER Path
The media file(s) or URL(s) to open in VLC.

.PARAMETER KeysToSend
Keystrokes to send to the VLC window for control.

.PARAMETER Monitor
Monitor to display VLC on (-1=discard, 0=default, >0=specific monitor).

.PARAMETER NoBorders
Removes window borders for a cleaner look.

.PARAMETER Width
Initial window width in pixels.

.PARAMETER Height
Initial window height in pixels.

.PARAMETER X
Initial window X position.

.PARAMETER Y
Initial window Y position.

.PARAMETER Left
Places window on left side of screen.

.PARAMETER Right
Places window on right side of screen.

.PARAMETER Top
Places window on top of screen.

.PARAMETER Bottom
Places window on bottom of screen.

.PARAMETER Centered
Centers the window on screen.

.PARAMETER Fullscreen
Maximizes the window.

.PARAMETER PassThru
Returns the window helper object.

.PARAMETER SideBySide
Places VLC window side by side with PowerShell window.

.PARAMETER VLCPath
Custom path to VLC executable.

.PARAMETER NewWindow
Forces new VLC instance.

.PARAMETER Close
Closes VLC window.

.EXAMPLE
# Open video fullscreen on monitor 0 with audio
Open-VlcMediaPlayer -Path "video.mp4" -Fullscreen -Monitor 0

.EXAMPLE
# Short form using aliases
vlc "video.mp4" -fs -m 0
#>
function Open-VlcMediaPlayer {

    [CmdletBinding()]
    [Alias("vlc")]
    param(
        ###########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The media file(s) or URL(s) to open in VLC"
        )]
        [string[]]$Path,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Keystrokes to send to the VLC Player Window, " +
                "see documentation for cmdlet GenXdev.Windows\Send-Key")
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $KeysToSend,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters and modifiers"
        )]
        [switch] $Escape,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use Shift+Enter instead of Enter"
        )]
        [switch] $ShiftEnter,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Delay between different input strings in milliseconds"
        )]
        [ValidateRange(0, [int]::MaxValue)]
        [int] $DelayMilliSeconds = 0,
        ###########################################################################
        [Alias("m", "mon")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -2,
        ###########################################################################
        [Alias("nb")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Removes the borders of the window"
        )]
        [switch] $NoBorders,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the window"
        )]
        [int] $Width = -1,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the window"
        )]
        [int] $Height = -1,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the window"
        )]
        [int] $X = -1,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the window"
        )]
        [int] $Y = -1,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the left side of the screen"
        )]
        [switch] $Left,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the right side of the screen"
        )]
        [switch] $Right,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the top side of the screen"
        )]
        [switch] $Top,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the bottom side of the screen"
        )]
        [switch] $Bottom,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window in the center of the screen"
        )]
        [switch] $Centered,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Maximize the window"
        )]
        [switch] $Fullscreen,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Returns the window helper for each process"
        )]
        [switch] $PassThru,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Always on top"
        )]
        [switch]$AlwaysOnTop,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Play files randomly forever"
        )]
        [Alias("Shuffle")]
        [switch]$Random,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Repeat all"
        )]
        [switch]$Loop,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Repeat current item"
        )]
        [switch]$Repeat,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Start paused"
        )]
        [switch]$StartPaused,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Play and exit"
        )]
        [switch]$PlayAndExit,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Disable audio"
        )]
        [switch]$DisableAudio,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Replay gain mode"
        )]
        [ValidateSet("None", "Track", "Album")]
        [string]$ReplayGainMode,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Replay gain preamp"
        )]
        [ValidateRange(-20.0, 20.0)]
        [float]$ReplayGainPreamp,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force detection of Dolby Surround"
        )]
        [ValidateSet("Auto", "On", "Off")]
        [string]$ForceDolbySurround,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio filters"
        )]
        [string[]]$AudioFilters,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio visualizations"
        )]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string]$Visualization,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Deinterlace"
        )]
        [ValidateSet("Off", "Automatic", "On")]
        [string]$Deinterlace,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Deinterlace mode"
        )]
        [ValidateSet("Auto", "Discard", "Blend", "Mean", "Bob", "Linear", "X", "Yadif", "Yadif2x", "Phosphor", "IVTC")]
        [string]$DeinterlaceMode,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Source aspect ratio"
        )]
        [string]$AspectRatio,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video cropping"
        )]
        [string]$Crop,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video Auto Scaling"
        )]
        [switch]$AutoScale,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video filter module"
        )]
        [string[]]$VideoFilters,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use subtitle file"
        )]
        [string]$SubtitleFile,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Disable subtitles"
        )]
        [switch]$DisableSubtitles,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subtitles text scaling factor"
        )]
        [ValidateRange(10, 500)]
        [int]$SubtitleScale,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subtitle language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian", "Azerbaijani", "Basque", "Belarusian",
            "Bemba", "Bengali", "Bihari", "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)", "Chinese (Traditional)", "Corsican",
            "Croatian", "Czech", "Danish", "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga", "Galician", "Georgian", "German", "Greek",
            "Guarani", "Gujarati", "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi", "Hungarian",
            "Icelandic", "Igbo", "Indonesian", "Interlingua", "Irish", "Italian", "Japanese", "Javanese", "Kannada",
            "Kazakh", "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean", "Krio (Sierra Leone)", "Kurdish",
            "Kurdish (Soranî)", "Kyrgyz", "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi", "Luganda",
            "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam", "Maltese", "Maori", "Marathi", "Mauritian Creole",
            "Moldavian", "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin", "Northern Sotho", "Norwegian",
            "Norwegian (Nynorsk)", "Occitan", "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi", "Quechua", "Romanian", "Romansh", "Runyakitara",
            "Russian", "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana", "Seychellois Creole",
            "Shona", "Sindhi", "Sinhalese", "Slovak", "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar", "Telugu", "Thai", "Tigrinya", "Tonga",
            "Tshiluba", "Tumbuka", "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu", "Uzbek", "Vietnamese",
            "Welsh", "Wolof", "Xhosa", "Yiddish", "Yoruba", "Zulu")]
        [string]$SubtitleLanguage,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian", "Azerbaijani", "Basque", "Belarusian",
            "Bemba", "Bengali", "Bihari", "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)", "Chinese (Traditional)", "Corsican",
            "Croatian", "Czech", "Danish", "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga", "Galician", "Georgian", "German", "Greek",
            "Guarani", "Gujarati", "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi", "Hungarian",
            "Icelandic", "Igbo", "Indonesian", "Interlingua", "Irish", "Italian", "Japanese", "Javanese", "Kannada",
            "Kazakh", "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean", "Krio (Sierra Leone)", "Kurdish",
            "Kurdish (Soranî)", "Kyrgyz", "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi", "Luganda",
            "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam", "Maltese", "Maori", "Marathi", "Mauritian Creole",
            "Moldavian", "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin", "Northern Sotho", "Norwegian",
            "Norwegian (Nynorsk)", "Occitan", "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi", "Quechua", "Romanian", "Romansh", "Runyakitara",
            "Russian", "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana", "Seychellois Creole",
            "Shona", "Sindhi", "Sinhalese", "Slovak", "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar", "Telugu", "Thai", "Tigrinya", "Tonga",
            "Tshiluba", "Tumbuka", "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu", "Uzbek", "Vietnamese",
            "Welsh", "Wolof", "Xhosa", "Yiddish", "Yoruba", "Zulu")]
        [string]$AudioLanguage,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Preferred audio language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian", "Azerbaijani", "Basque", "Belarusian",
            "Bemba", "Bengali", "Bihari", "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)", "Chinese (Traditional)", "Corsican",
            "Croatian", "Czech", "Danish", "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga", "Galician", "Georgian", "German", "Greek",
            "Guarani", "Gujarati", "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi", "Hungarian",
            "Icelandic", "Igbo", "Indonesian", "Interlingua", "Irish", "Italian", "Japanese", "Javanese", "Kannada",
            "Kazakh", "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean", "Krio (Sierra Leone)", "Kurdish",
            "Kurdish (Soranî)", "Kyrgyz", "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi", "Luganda",
            "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam", "Maltese", "Maori", "Marathi", "Mauritian Creole",
            "Moldavian", "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin", "Northern Sotho", "Norwegian",
            "Norwegian (Nynorsk)", "Occitan", "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi", "Quechua", "Romanian", "Romansh", "Runyakitara",
            "Russian", "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana", "Seychellois Creole",
            "Shona", "Sindhi", "Sinhalese", "Slovak", "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar", "Telugu", "Thai", "Tigrinya", "Tonga",
            "Tshiluba", "Tumbuka", "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu", "Uzbek", "Vietnamese",
            "Welsh", "Wolof", "Xhosa", "Yiddish", "Yoruba", "Zulu")]
        [string]$PreferredAudioLanguage,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "HTTP proxy"
        )]
        [string]$HttpProxy,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "HTTP proxy password"
        )]
        [string]$HttpProxyPassword,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Verbosity level"
        )]
        [ValidateRange(0, 2)]
        [int]$VerbosityLevel,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subdirectory behavior"
        )]
        [ValidateSet("None", "Collapse", "Expand")]
        [string]$SubdirectoryBehavior,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Ignored extensions"
        )]
        [string]$IgnoredExtensions,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Increase the priority of the process"
        )]
        [switch]$HighPriority,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable time stretching audio"
        )]
        [switch]$EnableTimeStretch,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Path to VLC executable"
        )]
        [string]$VLCPath = "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe",
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open new VLC mediaplayer instance"
        )]
        [switch] $NewWindow,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable video wallpaper mode"
        )]
        [switch]$EnableWallpaperMode,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video filter modules"
        )]
        [string[]]$VideoFilterModules,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Modules"
        )]
        [string[]]$Modules,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio filter modules"
        )]
        [string[]]$AudioFilterModules,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio visualization mode"
        )]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string]$AudioVisualization,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Preferred subtitle language"
        )]
        [string]$PreferredSubtitleLanguage,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Ignored file extensions"
        )]
        [string]$IgnoredFileExtensions,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable audio time stretching"
        )]
        [switch]$EnableAudioTimeStretch,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additional arguments"
        )]
        [string]$Arguments,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Close the VLC media player window"
        )]
        [switch] $Close,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Will either set the window fullscreen on a different monitor than Powershell, or " +
            "side by side with Powershell on the same monitor"
        )]
        [switch] $SideBySide
        ###########################################################################
    )

    begin {

        # bail early if closing
        if ($Close) { return }

        # ensure VLC is installed and install if needed
        if (-not (Test-Path "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe")) {

            Write-Verbose "VLC not found, installing via WinGet..."

            # check/install winget module
            if (-not (Get-Module -ListAvailable -Name 'Microsoft.WinGet.Client')) {

                Write-Verbose "Installing WinGet client module"
                $null = Install-Module -Name 'Microsoft.WinGet.Client' `
                    -Force -Scope CurrentUser -AllowClobber -SkipPublisherCheck

                Write-Verbose "Importing WinGet client module"
                Import-Module -Name 'Microsoft.WinGet.Client'
            }

            # install VLC
            Write-Verbose "Installing VLC media player"
            Install-WinGetPackage -Name 'VideoLAN.VLC' -Scope System -Force
        }

        function ConvertTo-VLCParameter {
            param (
                [string]$Name,
                $Value
            )

            # Parameter mapping logic here
            switch ($Name) {
                # 'Fullscreen' { if ($Value) { return '--fullscreen' } }
                'AlwaysOnTop' { if ($Value) { return '--video-on-top' } }
                'DisableAudio' { if ($Value) { return '--no-audio' } }
                'ReplayGainMode' { return "--audio-replay-gain-mode=$($Value.ToLower())" }
                'ReplayGainPreamp' { return "--audio-replay-gain-preamp=$Value" }
                'ForceDolbySurround' { return "--force-dolby-surround=$($Value.ToLower())" }
                'AudioFilters' { return "--audio-filter=$($Value -join ',')" }
                'Visualization' { return "--audio-visual=$($Value.ToLower())" }
                'Deinterlace' { return "--deinterlace=$($Value.ToLower())" }
                'DeinterlaceMode' { return "--deinterlace-mode=$($Value.ToLower())" }
                'AspectRatio' { return "--aspect-ratio=$Value" }
                'Crop' { return "--crop=$Value" }
                'AutoScale' { if ($Value) { return '--autoscale' } }
                'VideoFilters' { return "--video-filter=$($Value -join ',')" }
                'SubtitleFile' { return "--sub-file=$Value" }
                'DisableSubtitles' { if ($Value) { return '--no-spu' } }
                'SubtitleScale' { return "--sub-text-scale=$Value" }
                'SubtitleLanguage' { return "--sub-language=$((Get-WebLanguageDictionary)[$Value])" }
                'AudioLanguage' { return "--audio-language=$((Get-WebLanguageDictionary)[$Value])" }
                'HttpProxy' { return "--http-proxy=$Value" }
                'HttpProxyPassword' { return "--http-proxy-pwd=$Value" }
                'VerbosityLevel' { return "--verbose=$Value" }
                'SubdirectoryBehavior' { return "--recursive=$($Value.ToLower())" }
                'IgnoredExtensions' { return "--ignore-filetypes=$Value" }
                'HighPriority' { if ($Value) { return '--high-priority' } }
                'EnableTimeStretch' { if ($Value) { return '--audio-time-stretch' } }
                'EnableWallpaperMode' { if ($Value) { return '--video-wallpaper' } }
                'VideoFilterModules' { return "--video-filter=$($Value -join ',')" }
                'Modules' { return "--modules=$($Value -join ',')" }
                'AudioFilterModules' { return "--audio-filter=$($Value -join ',')" }
                'AudioVisualization' { return "--audio-visual=$($Value.ToLower())" }
                'PreferredSubtitleLanguage' { return "--sub-language=$Value" }
                'PreferredAudioLanguage' { return "--audio-language=$((Get-WebLanguageDictionary)[$Value])" }
                'AudioLanguage' { return "--audio-language=$((Get-WebLanguageDictionary)[$Value])" }
                'IgnoredFileExtensions' { return "--ignore-filetypes=$Value" }
                'EnableAudioTimeStretch' { if ($Value) { return '--audio-time-stretch' } }
                # Add more mappings as needed
            }
        }

        # check if vlc is already running
        $vlcProcess = $null
        $vlcWindow = GenXdev.Windows\Get-Window -ProcessName vlc `
            -ErrorAction SilentlyContinue

        [System.Collections.Generic.List[string]]$vlcArgs = @()

        if ($NewWindow) {

            $null = $vlcArgs.Add('--no-one-instance')
        }
        else {

            $null = $vlcArgs.Add('--one-instance')
        }

        # Process each parameter and convert to VLC arguments
        $null = $PSBoundParameters.GetEnumerator() | ForEach-Object {
            if ($_.Key -notin @('VLCPath', 'Path', 'Arguments')) {
                $vlcArg = ConvertTo-VLCParameter -Name $_.Key -Value $_.Value
                if ($vlcArg) {
                    $null = $vlcArgs.Add($vlcArg)
                }
            }
        }

        # Add custom arguments if specified
        if ($Arguments) {

            $Arguments | ForEach-Object {

                $null = $vlcArgs.Add($_)
            }
        }

        # Add media paths
        @($Path) | ForEach-Object {

            if ($null -eq $_) { return }
            $null = $vlcArgs.Add('"' + (GenXdev.FileSystem\Expand-Path $_) + '"')
        }

        # Build the final command
        $processArgs = @{
            FilePath     = $VLCPath
            ArgumentList = $vlcArgs
            PassThru     = $true
            ErrorAction  = 'SilentlyContinue'
        }

        if ($null -eq $vlcWindow) {

            # ensure vlc is installed
            if (-not (Test-Path $processArgs.FilePath -ErrorAction SilentlyContinue)) {

                # install winget if needed
                if (-not (Get-Module -ListAvailable -Name 'Microsoft.WinGet.Client')) {

                    Write-Verbose "Installing WinGet client module"
                    $null = Install-Module -Name 'Microsoft.WinGet.Client' `
                        -Force -Scope CurrentUser -AllowClobber -SkipPublisherCheck

                    Write-Verbose "Importing WinGet client module"
                    Import-Module -Name 'Microsoft.WinGet.Client'
                }

                Write-Verbose "Installing VLC media player"
                Install-WinGetPackage -Name 'VideoLAN.VLC' -Scope System -Force
            }

            Get-Process vlc -ErrorAction SilentlyContinue |
            Stop-Process -Force
        }
        else {

            $vlcProcess = Get-Process -Name vlc -ErrorAction SilentlyContinue |
            Where-Object -Property MainWindowHandle -NE 0
        }

        if (($null -eq $vlcWindow) -or ($processArgs.Keys.Count -gt 1)) {

            # Start VLC
            try {
                Write-Verbose "Starting VLC with arguments: $($vlcArgs -join ' ')"
                $vlcProcess = Start-Process @processArgs
                Write-Verbose "VLC started with PID: $($vlcProcess.Id)"
            }
            catch {
                Write-Error "Failed to start VLC: $_"
            }
        }

        Start-Sleep 2

        $vlcWindow = GenXdev.Windows\Get-Window -ProcessName vlc `
            -ErrorAction SilentlyContinue

        if ($null -eq $vlcWindow) {

            Write-Warning "Failed to find VLC window"
            return
        }

        # copy window positioning parameters
        if ($PSBoundParameters.ContainsKey("Process")) {

            $null = $PSBoundParameters.Remove("Process")
        }

        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName "GenXdev.Windows\Set-WindowPosition"

        $invocationParams.WindowHelper = $vlcWindow
        $invocationParams.Monitor = $Monitor

        # apply window position if parameters specified
        $null = GenXdev.Windows\Set-WindowPosition @invocationParams
    }

    process {

        # handle close request
        if ($Close) {

            Write-Verbose "Closing VLC windows"
            if ($vlcProcess) {
                $null = $vlcProcess.CloseMainWindow()
                $null = $vlc.Process.WaitForExit(2000)
            }

            $null = Get-Process vlc -ErrorAction SilentlyContinue |
            Stop-Process -Force

            return
        }

        if ($null -eq $KeysToSend -or ($KeysToSend.Count -eq 0)) {

            return
        }

        # send keys if specified
        if ($null -ne $KeysToSend -and ($KeysToSend.Count -gt 0)) {

            Write-Verbose "Sending keystrokes to VLC window"

            # copy key sending parameters
            $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName "GenXdev.Windows\Send-Key"

            $invocationParams.WindowHandle = $vlcWindow.Handle

            if ($invocationParams.Keys.Count -gt 1) {
                $null = GenXdev.Windows\Send-Key @invocationParams
            }
        }
    }

    end {

        # get powershell window reference
        $pwsh = Get-PowershellMainWindow

        # restore powershell window focus
        if ($null -ne $pwsh) {

            $null = $pwsh.SetForeground()
        }

        if ($PassThru) {

            return $vlcWindow
        }
    }
}
################################################################################