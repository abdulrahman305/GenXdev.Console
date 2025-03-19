################################################################################
<#
.SYNOPSIS
Plays media files using VLC player with flexible filtering options.

.DESCRIPTION
This function scans for media files in the specified directory, filters them based
on file type and optional keywords, creates a playlist, and launches VLC player.
It supports videos, audio files and pictures with automatic installation of VLC
if needed.

.PARAMETER DirectoryPath
The directory path to scan for media files. Defaults to current directory.

.PARAMETER Keywords
Keywords to search for in subtitle files (.srt) and media descriptions.

.PARAMETER SearchMask
File pattern to filter media files. Default is "*".

.PARAMETER OnlyVideos
Filter to only include video files in the playlist.

.PARAMETER OnlyAudio
Filter to only include audio files in the playlist.

.PARAMETER OnlyPictures
Filter to only include picture files in the playlist.

.PARAMETER IncludeVideos
Additionally include video files in the playlist.

.PARAMETER IncludeAudio
Additionally include audio files in the playlist.

.PARAMETER IncludePictures
Additionally include picture files in the playlist.

.PARAMETER KeysToSend
Keystrokes to send to the VLC window.

.PARAMETER Process
The VLC process to control.

.PARAMETER Monitor
Monitor to display VLC on (-1=discard, 0=default).

.PARAMETER NoBorders
Removes window borders.

.PARAMETER Width
Initial window width.

.PARAMETER Height
Initial window height.

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
Returns the window helper for each VLC process.

.PARAMETER EnableAudio
Enables audio playback.

.PARAMETER ForceDolbySurroundMode
Sets Dolby surround mode (Auto/On/Off).

.PARAMETER AudioReplayGainMode
Sets audio replay gain mode (None/Track/Album).

.PARAMETER AudioReplayGainPreamp
Sets audio replay gain preamp level.

.PARAMETER AudioReplayGainDefault
Sets default audio replay gain.

.PARAMETER EnableAudioTimeStretch
Enables audio time stretching.

.PARAMETER AudioFilterModules
Specifies audio filter modules to use.

.PARAMETER AudioVisualization
Sets audio visualization mode.

.PARAMETER AlwaysOnTop
Keeps VLC window always on top.

.PARAMETER EnableWallpaperMode
Enables wallpaper mode.

.PARAMETER ShowMediaTitle
Shows media title during playback.

.PARAMETER MediaTitlePosition
Sets position of media title display.

.PARAMETER MouseHideTimeoutMilliseconds
Sets mouse cursor hide timeout.

.PARAMETER SnapshotDirectory
Sets directory for saving snapshots.

.PARAMETER SnapshotFormat
Sets snapshot image format (PNG/JPG/TIFF).

.PARAMETER Random
Enables random playback order or shuffle.

.PARAMETER LoopPlayback
Enables playlist looping.

.PARAMETER RepeatCurrentItem
Enables single item repeat.

.PARAMETER PlaybackSpeed
Sets playback speed multiplier.

.PARAMETER AspectRatio
Sets video aspect ratio.

.PARAMETER DeinterlaceMode
Sets deinterlacing mode.

.PARAMETER SubtitleFile
Specifies external subtitle file.

.PARAMETER SubtitleTextScale
Sets subtitle text scale (10-500).

.PARAMETER PreferredAudioLanguage
Sets preferred audio language.

.PARAMETER PreferredVideoResolution
Sets preferred video quality.

.EXAMPLE
# Play all media in current directory
Open-MediaFile

.EXAMPLE
# Play only pictures from Pictures folder
vlc ~\Pictures -OnlyPictures

.EXAMPLE
# Play videos containing "birthday" in subtitles
media ~\Videos -Keywords "birthday" -OnlyVideos
#>
function Open-MediaFile {

    [CmdletBinding()]
    [Alias("vlcmedia", "media")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "File name or pattern to search for. Default is '*'"
        )]
        [Alias("like", "l", "Path", "Name", "file", "Query", "FullName")]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $SearchMask = "*",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Keywords to search in file metadata"
        )]
        [SupportsWildcards()]
        [string[]]$Keywords = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Search across all available drives"
        )]
        [Alias("all")]
        [switch] $AllDrives,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Do not recurse into subdirectories"
        )]
        [switch] $NoRecurse,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include video files in the playlist"
        )]
        [switch]$OnlyVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include audio files in the playlist"
        )]
        [switch]$OnlyAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include pictures in the playlist"
        )]
        [switch]$OnlyPictures,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include videos in the playlist"
        )]
        [switch]$IncludeVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include audio files in the playlist"
        )]
        [switch]$IncludeAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include pictures in the playlist"
        )]
        [switch]$IncludePictures,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key"
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $KeysToSend = @("f"),

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Escape control characters and modifiers"
        )]
        [switch] $Escape,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use Shift+Enter instead of Enter"
        )]
        [switch] $ShiftEnter,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Delay between different input strings in milliseconds"
        )]
        [ValidateRange(0, [int]::MaxValue)]
        [int] $DelayMilliSeconds = 0,
        ########################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1,
        ###############################################################################

        [Alias("nb")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Removes the borders of the window"
        )]
        [switch] $NoBorders,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the window"
        )]
        [int] $Width = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the window"
        )]
        [int] $Height = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the window"
        )]
        [int] $X = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the window"
        )]
        [int] $Y = -1,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the left side of the screen"
        )]
        [switch] $Left,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the right side of the screen"
        )]
        [switch] $Right,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the top side of the screen"
        )]
        [switch] $Top,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the bottom side of the screen"
        )]
        [switch] $Bottom,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Place window in the center of the screen"
        )]
        [switch] $Centered,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Maximize the window"
        )]
        [switch] $Fullscreen,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Returns the window helper for each process"
        )]
        [switch] $PassThru,
        ###############################################################################
        # Core Options

        [Parameter(HelpMessage = "Always on top")]
        [switch]$AlwaysOnTop,

        [Parameter(HelpMessage = "Play files randomly forever")]
        [switch]$Random,

        [Parameter(HelpMessage = "Repeat all")]
        [switch]$Loop,

        [Parameter(HelpMessage = "Repeat current item")]
        [switch]$Repeat,

        [Parameter(HelpMessage = "Start paused")]
        [switch]$StartPaused,

        [Parameter(HelpMessage = "Play and exit")]
        [switch]$PlayAndExit,

        # Audio Options
        [Parameter(HelpMessage = "Disable audio")]
        [switch]$DisableAudio,

        [Parameter(HelpMessage = "Replay gain mode")]
        [ValidateSet("None", "Track", "Album")]
        [string]$ReplayGainMode,

        [Parameter(HelpMessage = "Replay gain preamp")]
        [ValidateRange(-20.0, 20.0)]
        [float]$ReplayGainPreamp,

        [Parameter(HelpMessage = "Force detection of Dolby Surround")]
        [ValidateSet("Auto", "On", "Off")]
        [string]$ForceDolbySurround,

        [Parameter(HelpMessage = "Audio filters")]
        [string[]]$AudioFilters,

        [Parameter(HelpMessage = "Audio visualizations")]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string]$Visualization,

        # Video Options
        [Parameter(HelpMessage = "Deinterlace")]
        [ValidateSet("Off", "Automatic", "On")]
        [string]$Deinterlace,

        [Parameter(HelpMessage = "Deinterlace mode")]
        [ValidateSet("Auto", "Discard", "Blend", "Mean", "Bob", "Linear", "X", "Yadif", "Yadif2x", "Phosphor", "IVTC")]
        [string]$DeinterlaceMode,

        [Parameter(HelpMessage = "Source aspect ratio")]
        [string]$AspectRatio,

        [Parameter(HelpMessage = "Video cropping")]
        [string]$Crop,

        [Parameter(HelpMessage = "Video Auto Scaling")]
        [switch]$AutoScale,

        [Parameter(HelpMessage = "Video filter module")]
        [string[]]$VideoFilters,

        # Subtitle Options
        [Parameter(HelpMessage = "Use subtitle file")]
        [string]$SubtitleFile,

        [Parameter(HelpMessage = "Disable subtitles")]
        [switch]$DisableSubtitles,

        [Parameter(HelpMessage = "Subtitles text scaling factor")]
        [ValidateRange(10, 500)]
        [int]$SubtitleScale,

        [Parameter(HelpMessage = "Subtitle language")]
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

        [Parameter(HelpMessage = "Audio language")]
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

        [Parameter(HelpMessage = "Preferred audio language")]
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

        # Network Options
        [Parameter(HelpMessage = "HTTP proxy")]
        [string]$HttpProxy,

        [Parameter(HelpMessage = "HTTP proxy password")]
        [string]$HttpProxyPassword,

        # Advanced Options
        [Parameter(HelpMessage = "Verbosity level")]
        [ValidateRange(0, 2)]
        [int]$VerbosityLevel,

        [Parameter(HelpMessage = "Subdirectory behavior")]
        [ValidateSet("None", "Collapse", "Expand")]
        [string]$SubdirectoryBehavior,

        [Parameter(HelpMessage = "Ignored extensions")]
        [string]$IgnoredExtensions,

        # Performance Options
        [Parameter(HelpMessage = "Increase the priority of the process")]
        [switch]$HighPriority,

        [Parameter(HelpMessage = "Enable time stretching audio")]
        [switch]$EnableTimeStretch,

        [Parameter(HelpMessage = "Path to VLC executable")]
        [string]$VLCPath = "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe",

        [Parameter(HelpMessage = "Open new VLC mediaplayer instance")]
        [switch] $NewWindow,

        [Parameter(HelpMessage = "Enable video wallpaper mode")]
        [switch]$EnableWallpaperMode,

        [Parameter(HelpMessage = "Video filter modules")]
        [string[]]$VideoFilterModules,

        [Parameter(HelpMessage = "Modules")]
        [string[]]$Modules,

        [Parameter(HelpMessage = "Audio filter modules")]
        [string[]]$AudioFilterModules,

        [Parameter(HelpMessage = "Audio visualization mode")]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string]$AudioVisualization,

        [Parameter(HelpMessage = "Preferred subtitle language")]
        [string]$PreferredSubtitleLanguage,

        [Parameter(HelpMessage = "Ignored file extensions")]
        [string]$IgnoredFileExtensions,

        [Parameter(HelpMessage = "Enable audio time stretching")]
        [switch]$EnableAudioTimeStretch,

        [Parameter(HelpMessage = "Additional arguments for VLC media player")]
        [string]$Arguments,
        #############################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Will either set the window fullscreen on a different monitor than Powershell, or " +
            "side by side with Powershell on the same monitor"
        )]
        [switch] $SideBySide
        ###############################################################################
    )

    begin {

        # define supported file extensions for each media type
        $videoFiles = @(".mp4", ".avi", ".mkv", ".mov", ".wmv")
        $audioFiles = @(".mp3", ".flac", ".wav", ".midi", ".mid", ".au",
            ".aiff", ".aac", ".m4a", ".ogg", ".wma", ".ra", ".ram", ".rm",
            ".rmm")
        $pictureFiles = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff",
            ".tif")
    }

    process {

        # get sorted list of all matching files
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.FileSystem\Find-Item" `
            -BoundParameters $PSBoundParameters

        $invocationParams.PassThru = $true

        $files = GenXdev.FileSystem\Find-Item @invocationParams | Microsoft.PowerShell.Utility\Sort-Object -Property FullName

        # determine which file types to include based on parameters
        $validExtensions = $OnlyVideos ? $videoFiles : (
            $OnlyAudio ? $audioFiles : (
                $OnlyPictures ? $pictureFiles : (
                    $videoFiles + $audioFiles + $pictureFiles
                )
            )
        )

        # add additional file types if specified
        if ($IncludeVideos) {
            $validExtensions += $videoFiles
        }
        if ($IncludeAudio) {
            $validExtensions += $audioFiles
        }
        if ($IncludePictures) {
            $validExtensions += $pictureFiles
        }

        # filter files by extension and keywords
        $files = $files | Microsoft.PowerShell.Core\Where-Object {
            try {
                if (-not ($validExtensions -contains $PSItem.Extension.ToLower())) {
                    return $false;
                }

                if ($Keywords.Length -gt 0) {
                    $srtSearchMask = [io.Path]::Combine([IO.Path]::GetDirectoryName($PSItem.FullName), [IO.Path]::GetFileNameWithoutExtension($PSItem.FullName) + "*.srt");

                    Microsoft.PowerShell.Management\Get-ChildItem $srtSearchMask -File -ErrorAction SilentlyContinue | Microsoft.PowerShell.Core\ForEach-Object {
                        $srt = [IO.File]::ReadAllText($PSItem.FullName);

                        foreach ($keyword in $Keywords) {
                            if ($srt -like "*$keyword*") {
                                return $true;
                            }
                        }
                    }

                    if ([IO.File]::Exists("$($PSItem.FullName):description.json")) {
                        $description = [IO.File]::ReadAllText("$($PSItem.FullName):description.json");

                        foreach ($keyword in $Keywords) {
                            if ($description -like "*$keyword*") {
                                return $true;
                            }
                        }
                    }

                    return $false;
                }

                return $true;
            }
            catch {
                return $false;
            }
        }

        if ($files.Length -eq 0) {
            Microsoft.PowerShell.Utility\Write-Host "No media files found in the specified directory."
            return
        }

        # create temporary playlist file
        $playlistPath = [System.IO.Path]::ChangeExtension(
            [System.IO.Path]::GetTempFileName(),
            ".m3u"
        )

        Microsoft.PowerShell.Utility\Write-Verbose "Creating playlist at: $playlistPath"

        # generate m3u playlist content
        $m3uContent = "#EXTM3U`r`n"
        foreach ($file in $files) {
            $m3uContent += "#EXTINF:-1, $($file.Name.Replace("_", " ").Replace(".", " ").Replace("  ", " "))`r`n$(($file.FullName))`r`n";
        }

        # save playlist file
        $m3uContent | Microsoft.PowerShell.Utility\Out-File -FilePath $playlistPath -Encoding utf8 -Force

        # launch VLC with playlist
        Microsoft.PowerShell.Utility\Write-Verbose "Starting VLC player"
        Microsoft.PowerShell.Management\Get-Process vlc -ErrorAction SilentlyContinue | Microsoft.PowerShell.Management\Stop-Process -Force

        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Console\Open-VlcMediaPlayer" `
            -BoundParameters $PSBoundParameters

        $invocationParams.Path = $playlistPath
        $invocationParams.PassThru = $true
        $invocationParams.KeysToSend = $KeysToSend

        $vlcWindowHelper = GenXdev.Console\Open-VlcMediaPlayer @invocationParams
    }

    end {
        if ($PassThru) {

            Microsoft.PowerShell.Utility\Write-Output $vlcWindowHelper
        }
    }
}
################################################################################