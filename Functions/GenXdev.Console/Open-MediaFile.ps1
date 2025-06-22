################################################################################
<#
.SYNOPSIS
Opens and plays media files using VLC media player with advanced filtering and
configuration options.

.DESCRIPTION
This function scans for media files based on search patterns and optional
keywords, creates a playlist, and launches VLC media player with comprehensive
configuration options. It supports videos, audio files, and pictures with
automatic VLC installation if needed. The function provides extensive control
over playback behavior, window positioning, audio/video settings, and subtitle
handling.

.PARAMETER SearchMask
File name or pattern to search for. Supports wildcards. Default is '*' to find
all media files.

.PARAMETER Keywords
Keywords to search for in subtitle files (.srt) and media descriptions stored
in alternate data streams.

.PARAMETER AllDrives
Search across all available drives instead of just the current directory.

.PARAMETER NoRecurse
Do not recurse into subdirectories during the file search.

.PARAMETER OnlyVideos
Filter to only include video files in the playlist (.mp4, .avi, .mkv, .mov,
.wmv).

.PARAMETER OnlyAudio
Filter to only include audio files in the playlist (.mp3, .flac, .wav, .midi,
.mid, .au, .aiff, .aac, .m4a, .ogg, .wma, .ra, .ram, .rm, .rmm).

.PARAMETER OnlyPictures
Filter to only include picture files in the playlist (.jpg, .jpeg, .png, .gif,
.bmp, .tiff, .tif).

.PARAMETER IncludeVideos
Additionally include video files in the playlist when other filters are applied.

.PARAMETER IncludeAudio
Additionally include audio files in the playlist when other filters are applied.

.PARAMETER IncludePictures
Additionally include picture files in the playlist when other filters are
applied.

.PARAMETER KeysToSend
Keystrokes to send to the VLC player window after launch. See documentation for
GenXdev.Windows\Send-Key cmdlet for available key combinations.

.PARAMETER Escape
Escape control characters and modifiers in the KeysToSend parameter.

.PARAMETER ShiftEnter
Use Shift+Enter instead of Enter when processing KeysToSend.

.PARAMETER DelayMilliSeconds
Delay between different input strings in milliseconds when sending keys.

.PARAMETER Monitor
The monitor to display VLC on. 0 = default monitor, -1 = discard positioning.

.PARAMETER NoBorders
Removes the window borders from the VLC player window.

.PARAMETER Width
The initial width of the VLC player window in pixels.

.PARAMETER Height
The initial height of the VLC player window in pixels.

.PARAMETER X
The initial X position of the VLC player window on screen.

.PARAMETER Y
The initial Y position of the VLC player window on screen.

.PARAMETER Left
Place the VLC window on the left side of the screen.

.PARAMETER Right
Place the VLC window on the right side of the screen.

.PARAMETER Top
Place the VLC window on the top side of the screen.

.PARAMETER Bottom
Place the VLC window on the bottom side of the screen.

.PARAMETER Centered
Place the VLC window in the center of the screen.

.PARAMETER Fullscreen
Maximize the VLC window to fullscreen mode.

.PARAMETER PassThru
Returns the window helper object for each VLC process launched.

.PARAMETER AlwaysOnTop
Keeps the VLC window always on top of other windows.

.PARAMETER Random
Enables random playback order (shuffle mode) for the playlist.

.PARAMETER Loop
Enables playlist looping - repeats the entire playlist when finished.

.PARAMETER Repeat
Enables single item repeat - repeats the current media file indefinitely.

.PARAMETER StartPaused
Starts VLC in paused state instead of immediately playing.

.PARAMETER PlayAndExit
Automatically exits VLC when playback is completed.

.PARAMETER DisableAudio
Completely disables audio output during playback.

.PARAMETER ReplayGainMode
Sets the audio replay gain mode to normalize volume levels across tracks.

.PARAMETER ReplayGainPreamp
Sets the replay gain preamp level in decibels (-20.0 to 20.0).

.PARAMETER ForceDolbySurround
Forces detection of Dolby Surround audio encoding.

.PARAMETER AudioFilters
Specifies audio filter modules to apply during playback.

.PARAMETER Visualization
Sets the audio visualization mode for audio-only content.

.PARAMETER Deinterlace
Controls video deinterlacing for improved quality on interlaced content.

.PARAMETER DeinterlaceMode
Specifies the deinterlacing algorithm to use.

.PARAMETER AspectRatio
Forces a specific aspect ratio for video content.

.PARAMETER Crop
Applies video cropping with specified dimensions.

.PARAMETER AutoScale
Enables automatic video scaling to fit the window.

.PARAMETER VideoFilters
Specifies video filter modules to apply during playback.

.PARAMETER SubtitleFile
Path to an external subtitle file to use with video content.

.PARAMETER DisableSubtitles
Completely disables subtitle display during playback.

.PARAMETER SubtitleScale
Sets the subtitle text scaling factor (10-500 percent).

.PARAMETER SubtitleLanguage
Specifies the preferred subtitle language from available tracks.

.PARAMETER AudioLanguage
Specifies the preferred audio language from available tracks.

.PARAMETER PreferredAudioLanguage
Sets the default preferred audio language for future playback.

.PARAMETER HttpProxy
HTTP proxy server address for network streaming content.

.PARAMETER HttpProxyPassword
Password for HTTP proxy authentication.

.PARAMETER VerbosityLevel
Sets VLC's log verbosity level (0=quiet, 1=errors, 2=verbose).

.PARAMETER SubdirectoryBehavior
Controls how subdirectories are handled in the playlist.

.PARAMETER IgnoredExtensions
File extensions to ignore during media file scanning.

.PARAMETER HighPriority
Increases the process priority of the VLC player for better performance.

.PARAMETER EnableTimeStretch
Enables audio time stretching to maintain pitch during speed changes.

.PARAMETER VLCPath
Full path to the VLC executable. Defaults to standard installation location.

.PARAMETER NewWindow
Forces opening a new VLC instance instead of using existing one.

.PARAMETER EnableWallpaperMode
Enables video wallpaper mode where video plays as desktop background.

.PARAMETER VideoFilterModules
Additional video filter modules to load and apply.

.PARAMETER Modules
General VLC modules to load during startup.

.PARAMETER AudioFilterModules
Additional audio filter modules to load and apply.

.PARAMETER AudioVisualization
Sets the audio visualization mode for enhanced audio-only experience.

.PARAMETER PreferredSubtitleLanguage
Sets the default preferred subtitle language for future playback.

.PARAMETER IgnoredFileExtensions
File extensions to completely ignore during scanning.

.PARAMETER EnableAudioTimeStretch
Enables advanced audio time stretching capabilities.

.PARAMETER Arguments
Additional command-line arguments to pass directly to VLC.

.PARAMETER SideBySide
Places the VLC window side by side with PowerShell or on a different monitor
for fullscreen mode.

.EXAMPLE
Open-MediaFile

Opens all media files in the current directory using default VLC settings.

.EXAMPLE
vlc ~\Pictures -OnlyPictures -Fullscreen

Opens only picture files from the Pictures folder in fullscreen mode using the
alias 'vlc'.

.EXAMPLE
media ~\Videos -Keywords "*birthday*" -OnlyVideos -Loop

Opens video files containing "birthday" in subtitles with looping enabled using
the alias 'media'.
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
        [string[]] $Keywords = @(),
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
        [switch] $OnlyVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include audio files in the playlist"
        )]
        [switch] $OnlyAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include pictures in the playlist"
        )]
        [switch] $OnlyPictures,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include videos in the playlist"
        )]
        [switch] $IncludeVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include audio files in the playlist"
        )]
        [switch] $IncludeAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include pictures in the playlist"
        )]
        [switch] $IncludePictures,
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = ("Keystrokes to send to the VLC Player Window, see " +
                          "documentation for cmdlet GenXdev.Windows\Send-Key")
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [Alias("m", "mon")]
        [int] $Monitor = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Removes the borders of the window"
        )]
        [Alias("nb")]
        [switch] $NoBorders,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the window"
        )]
        [int] $Width = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the window"
        )]
        [int] $Height = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the window"
        )]
        [int] $X = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the window"
        )]
        [int] $Y = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the left side of the screen"
        )]
        [switch] $Left,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the right side of the screen"
        )]
        [switch] $Right,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the top side of the screen"
        )]
        [switch] $Top,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window on the bottom side of the screen"
        )]
        [switch] $Bottom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place window in the center of the screen"
        )]
        [switch] $Centered,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Maximize the window"
        )]
        [switch] $Fullscreen,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Returns the window helper for each process"
        )]
        [switch] $PassThru,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Always on top"
        )]
        [switch] $AlwaysOnTop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Play files randomly forever"
        )]
        [switch] $Random,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Repeat all"
        )]
        [switch] $Loop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Repeat current item"
        )]
        [switch] $Repeat,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Start paused"
        )]
        [switch] $StartPaused,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Play and exit"
        )]
        [switch] $PlayAndExit,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Disable audio"
        )]
        [switch] $DisableAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Replay gain mode"
        )]
        [ValidateSet("None", "Track", "Album")]
        [string] $ReplayGainMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Replay gain preamp"
        )]
        [ValidateRange(-20.0, 20.0)]
        [float] $ReplayGainPreamp,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force detection of Dolby Surround"
        )]
        [ValidateSet("Auto", "On", "Off")]
        [string] $ForceDolbySurround,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio filters"
        )]
        [string[]] $AudioFilters,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio visualizations"
        )]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string] $Visualization,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Deinterlace"
        )]
        [ValidateSet("Off", "Automatic", "On")]
        [string] $Deinterlace,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Deinterlace mode"
        )]
        [ValidateSet("Auto", "Discard", "Blend", "Mean", "Bob", "Linear", "X",
                     "Yadif", "Yadif2x", "Phosphor", "IVTC")]
        [string] $DeinterlaceMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Source aspect ratio"
        )]
        [string] $AspectRatio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video cropping"
        )]
        [string] $Crop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video Auto Scaling"
        )]
        [switch] $AutoScale,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video filter module"
        )]
        [string[]] $VideoFilters,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Use subtitle file"
        )]
        [string] $SubtitleFile,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Disable subtitles"
        )]
        [switch] $DisableSubtitles,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subtitles text scaling factor"
        )]
        [ValidateRange(10, 500)]
        [int] $SubtitleScale,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subtitle language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian",
            "Azerbaijani", "Basque", "Belarusian", "Bemba", "Bengali", "Bihari",
            "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)",
            "Chinese (Traditional)", "Corsican", "Croatian", "Czech", "Danish",
            "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga",
            "Galician", "Georgian", "German", "Greek", "Guarani", "Gujarati",
            "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi",
            "Hungarian", "Icelandic", "Igbo", "Indonesian", "Interlingua",
            "Irish", "Italian", "Japanese", "Javanese", "Kannada", "Kazakh",
            "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean",
            "Krio (Sierra Leone)", "Kurdish", "Kurdish (Soranî)", "Kyrgyz",
            "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi",
            "Luganda", "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam",
            "Maltese", "Maori", "Marathi", "Mauritian Creole", "Moldavian",
            "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin",
            "Northern Sotho", "Norwegian", "Norwegian (Nynorsk)", "Occitan",
            "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi",
            "Quechua", "Romanian", "Romansh", "Runyakitara", "Russian",
            "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana",
            "Seychellois Creole", "Shona", "Sindhi", "Sinhalese", "Slovak",
            "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar",
            "Telugu", "Thai", "Tigrinya", "Tonga", "Tshiluba", "Tumbuka",
            "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu",
            "Uzbek", "Vietnamese", "Welsh", "Wolof", "Xhosa", "Yiddish",
            "Yoruba", "Zulu")]
        [string] $SubtitleLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian",
            "Azerbaijani", "Basque", "Belarusian", "Bemba", "Bengali", "Bihari",
            "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)",
            "Chinese (Traditional)", "Corsican", "Croatian", "Czech", "Danish",
            "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga",
            "Galician", "Georgian", "German", "Greek", "Guarani", "Gujarati",
            "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi",
            "Hungarian", "Icelandic", "Igbo", "Indonesian", "Interlingua",
            "Irish", "Italian", "Japanese", "Javanese", "Kannada", "Kazakh",
            "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean",
            "Krio (Sierra Leone)", "Kurdish", "Kurdish (Soranî)", "Kyrgyz",
            "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi",
            "Luganda", "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam",
            "Maltese", "Maori", "Marathi", "Mauritian Creole", "Moldavian",
            "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin",
            "Northern Sotho", "Norwegian", "Norwegian (Nynorsk)", "Occitan",
            "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi",
            "Quechua", "Romanian", "Romansh", "Runyakitara", "Russian",
            "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana",
            "Seychellois Creole", "Shona", "Sindhi", "Sinhalese", "Slovak",
            "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar",
            "Telugu", "Thai", "Tigrinya", "Tonga", "Tshiluba", "Tumbuka",
            "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu",
            "Uzbek", "Vietnamese", "Welsh", "Wolof", "Xhosa", "Yiddish",
            "Yoruba", "Zulu")]
        [string] $AudioLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Preferred audio language"
        )]
        [ValidateSet(
            "Afrikaans", "Akan", "Albanian", "Amharic", "Arabic", "Armenian",
            "Azerbaijani", "Basque", "Belarusian", "Bemba", "Bengali", "Bihari",
            "Bork, bork, bork!", "Bosnian", "Breton", "Bulgarian", "Cambodian",
            "Catalan", "Cherokee", "Chichewa", "Chinese (Simplified)",
            "Chinese (Traditional)", "Corsican", "Croatian", "Czech", "Danish",
            "Dutch", "Elmer Fudd", "English", "Esperanto", "Estonian", "Ewe",
            "Faroese", "Filipino", "Finnish", "French", "Frisian", "Ga",
            "Galician", "Georgian", "German", "Greek", "Guarani", "Gujarati",
            "Hacker", "Haitian Creole", "Hausa", "Hawaiian", "Hebrew", "Hindi",
            "Hungarian", "Icelandic", "Igbo", "Indonesian", "Interlingua",
            "Irish", "Italian", "Japanese", "Javanese", "Kannada", "Kazakh",
            "Kinyarwanda", "Kirundi", "Klingon", "Kongo", "Korean",
            "Krio (Sierra Leone)", "Kurdish", "Kurdish (Soranî)", "Kyrgyz",
            "Laothian", "Latin", "Latvian", "Lingala", "Lithuanian", "Lozi",
            "Luganda", "Luo", "Macedonian", "Malagasy", "Malay", "Malayalam",
            "Maltese", "Maori", "Marathi", "Mauritian Creole", "Moldavian",
            "Mongolian", "Montenegrin", "Nepali", "Nigerian Pidgin",
            "Northern Sotho", "Norwegian", "Norwegian (Nynorsk)", "Occitan",
            "Oriya", "Oromo", "Pashto", "Persian", "Pirate", "Polish",
            "Portuguese (Brazil)", "Portuguese (Portugal)", "Punjabi",
            "Quechua", "Romanian", "Romansh", "Runyakitara", "Russian",
            "Scots Gaelic", "Serbian", "Serbo-Croatian", "Sesotho", "Setswana",
            "Seychellois Creole", "Shona", "Sindhi", "Sinhalese", "Slovak",
            "Slovenian", "Somali", "Spanish", "Spanish (Latin American)",
            "Sundanese", "Swahili", "Swedish", "Tajik", "Tamil", "Tatar",
            "Telugu", "Thai", "Tigrinya", "Tonga", "Tshiluba", "Tumbuka",
            "Turkish", "Turkmen", "Twi", "Uighur", "Ukrainian", "Urdu",
            "Uzbek", "Vietnamese", "Welsh", "Wolof", "Xhosa", "Yiddish",
            "Yoruba", "Zulu")]
        [string] $PreferredAudioLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "HTTP proxy"
        )]
        [string] $HttpProxy,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "HTTP proxy password"
        )]
        [string] $HttpProxyPassword,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Verbosity level"
        )]
        [ValidateRange(0, 2)]
        [int] $VerbosityLevel,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Subdirectory behavior"
        )]
        [ValidateSet("None", "Collapse", "Expand")]
        [string] $SubdirectoryBehavior,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Ignored extensions"
        )]
        [string] $IgnoredExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Increase the priority of the process"
        )]
        [switch] $HighPriority,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable time stretching audio"
        )]
        [switch] $EnableTimeStretch,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Path to VLC executable"
        )]
        [string] $VLCPath = "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Open new VLC mediaplayer instance"
        )]
        [switch] $NewWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable video wallpaper mode"
        )]
        [switch] $EnableWallpaperMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Video filter modules"
        )]
        [string[]] $VideoFilterModules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Modules"
        )]
        [string[]] $Modules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio filter modules"
        )]
        [string[]] $AudioFilterModules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Audio visualization mode"
        )]
        [ValidateSet("None", "Goom", "ProjectM", "Visual", "GLSpectrum")]
        [string] $AudioVisualization,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Preferred subtitle language"
        )]
        [string] $PreferredSubtitleLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Ignored file extensions"
        )]
        [string] $IgnoredFileExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Enable audio time stretching"
        )]
        [switch] $EnableAudioTimeStretch,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additional arguments for VLC media player"
        )]
        [string] $Arguments,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Will either set the window fullscreen on a " +
                          "different monitor than Powershell, or side by side " +
                          "with Powershell on the same monitor")
        )]
        [switch] $SideBySide
        ########################################################################
    )    begin {

        # define supported file extensions for each media type
        $videoFiles = @(".mp4", ".avi", ".mkv", ".mov", ".wmv")
        $audioFiles = @(".mp3", ".flac", ".wav", ".midi", ".mid", ".au",
            ".aiff", ".aac", ".m4a", ".ogg", ".wma", ".ra", ".ram", ".rm",
            ".rmm")
        $pictureFiles = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff",
            ".tif")

        # output verbose information about supported file types
        Microsoft.PowerShell.Utility\Write-Verbose ("Supported video files: " +
                                                     ($videoFiles -join ", "))

        Microsoft.PowerShell.Utility\Write-Verbose ("Supported audio files: " +
                                                     ($audioFiles -join ", "))

        Microsoft.PowerShell.Utility\Write-Verbose ("Supported picture files: " +
                                                     ($pictureFiles -join ", "))
    }

    process {

        # get sorted list of all matching files using helper function
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.FileSystem\Find-Item" `
            -BoundParameters $PSBoundParameters

        $invocationParams.PassThru = $true

        Microsoft.PowerShell.Utility\Write-Verbose ("Searching for files with " +
                                                     "parameters: " +
                                                     ($invocationParams.Keys -join ", "))

        # find all files matching the search criteria
        $files = GenXdev.FileSystem\Find-Item @invocationParams |
            Microsoft.PowerShell.Utility\Sort-Object -Property FullName

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

            Microsoft.PowerShell.Utility\Write-Verbose "Including video files"
        }

        if ($IncludeAudio) {

            $validExtensions += $audioFiles

            Microsoft.PowerShell.Utility\Write-Verbose "Including audio files"
        }

        if ($IncludePictures) {

            $validExtensions += $pictureFiles

            Microsoft.PowerShell.Utility\Write-Verbose "Including picture files"
        }

        # remove duplicate extensions from the array
        $validExtensions = $validExtensions | Microsoft.PowerShell.Utility\Select-Object -Unique

        Microsoft.PowerShell.Utility\Write-Verbose ("Valid extensions: " +
                                                     ($validExtensions -join ", "))

        # filter files by extension and keywords
        $files = $files |
            Microsoft.PowerShell.Core\Where-Object {
                try {

                    # check if file extension is in the valid extensions list
                    if (-not ($validExtensions -contains $PSItem.Extension.ToLower())) {

                        return $false;
                    }

                    # if keywords are specified, search in subtitle and description files
                    if ($Keywords.Length -gt 0) {

                        # construct search mask for subtitle files
                        $srtSearchMask = [IO.Path]::Combine(
                            [IO.Path]::GetDirectoryName($PSItem.FullName),
                            [IO.Path]::GetFileNameWithoutExtension($PSItem.FullName) +
                            "*.srt"
                        );

                        # search for keywords in subtitle files
                        Microsoft.PowerShell.Management\Get-ChildItem $srtSearchMask `
                            -File `
                            -ErrorAction SilentlyContinue |
                            Microsoft.PowerShell.Core\ForEach-Object {

                                # read subtitle file content
                                $srt = [IO.File]::ReadAllText($PSItem.FullName);

                                # check each keyword against subtitle content
                                foreach ($keyword in $Keywords) {

                                    if ($srt -like "*$keyword*") {

                                        return $true;
                                    }
                                }
                            }

                        # check for description in alternate data stream
                        if ([IO.File]::Exists("$($PSItem.FullName):description.json")) {

                            # read description file content
                            $description = [IO.File]::ReadAllText(
                                "$($PSItem.FullName):description.json"
                            );

                            # check each keyword against description content
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

                    # if any error occurs during filtering, exclude the file
                    return $false;
                }
            }

        # check if any media files were found
        if ($files.Length -eq 0) {

            Microsoft.PowerShell.Utility\Write-Host ("No media files found in " +
                                                      "the specified directory.")

            return
        }

        Microsoft.PowerShell.Utility\Write-Verbose ("Found $($files.Length) " +
                                                     "media files")

        # create temporary playlist file with m3u extension
        $playlistPath = [System.IO.Path]::ChangeExtension(
            [System.IO.Path]::GetTempFileName(),
            ".m3u"
        )

        Microsoft.PowerShell.Utility\Write-Verbose ("Creating playlist at: " +
                                                     $playlistPath)

        # generate m3u playlist content with header
        $m3uContent = "#EXTM3U`r`n"

        # add each file to the playlist with proper formatting
        foreach ($file in $files) {

            # create friendly display name by cleaning up filename
            $displayName = $file.Name.Replace("_", " ").Replace(".", " ").Replace("  ", " ")

            # add entry with duration placeholder and file path
            $m3uContent += "#EXTINF:-1, $displayName`r`n$(($file.FullName))`r`n";
        }

        # save playlist file to disk with utf8 encoding
        $null = $m3uContent |
            Microsoft.PowerShell.Utility\Out-File `
                -FilePath $playlistPath `
                -Encoding utf8 `
                -Force

        Microsoft.PowerShell.Utility\Write-Verbose ("Playlist created " +
                                                     "successfully")

        # terminate any existing vlc processes to avoid conflicts
        Microsoft.PowerShell.Utility\Write-Verbose "Stopping existing VLC processes"

        $null = Microsoft.PowerShell.Management\Get-Process vlc `
            -ErrorAction SilentlyContinue |
            Microsoft.PowerShell.Management\Stop-Process -Force

        # prepare parameters for vlc media player launch
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName "GenXdev.Console\Open-VlcMediaPlayer" `
            -BoundParameters $PSBoundParameters

        $invocationParams.Path = $playlistPath
        $invocationParams.PassThru = $true
        $invocationParams.KeysToSend = $KeysToSend

        Microsoft.PowerShell.Utility\Write-Verbose "Starting VLC player"

        # launch vlc media player with the generated playlist
        $vlcWindowHelper = GenXdev.Console\Open-VlcMediaPlayer @invocationParams
    }

    end {

        # return window helper object if passthru was requested
        if ($PassThru) {

            Microsoft.PowerShell.Utility\Write-Output $vlcWindowHelper
        }
    }
}
################################################################################