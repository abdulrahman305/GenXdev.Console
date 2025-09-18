<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Open-MediaFile.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
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

.PARAMETER Width
The initial width of the VLC player window in pixels.

.PARAMETER Height
The initial height of the VLC player window in pixels.

.PARAMETER X
The initial X position of the VLC player window on screen.

.PARAMETER Y
The initial Y position of the VLC player window on screen.

.PARAMETER KeysToSend
Keystrokes to send to the VLC player window after launch. See documentation for
GenXdev.Windows\Send-Key cmdlet for available key combinations.

.PARAMETER Keywords
Keywords to search for in subtitle files (.srt) and media descriptions stored
in alternate data streams.

.PARAMETER SendKeyEscape
Escape control characters and modifiers in the KeysToSend parameter.

.PARAMETER SendKeyUseShiftEnter
Use Shift+Enter instead of Enter when processing KeysToSend.

.PARAMETER SendKeyDelayMilliSeconds
Delay between different input strings in milliseconds when sending keys.

.PARAMETER SendKeyHoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keys.

.PARAMETER Monitor
The monitor to display VLC on. 0 = default monitor, -1 = discard positioning.

.PARAMETER AspectRatio
Forces a specific aspect ratio for video content.

.PARAMETER Crop
Applies video cropping with specified dimensions.

.PARAMETER SubtitleFile
Path to an external subtitle file to use with video content.

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

.PARAMETER VLCPath
Full path to the VLC executable. Defaults to standard installation location.

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

.PARAMETER VideoFilters
Specifies video filter modules to apply during playback.

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

.PARAMETER Arguments
Additional command-line arguments to pass directly to VLC.

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

.PARAMETER NoBorders
Removes the window borders from the VLC player window.

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

.PARAMETER DisableSubtitles
Completely disables subtitle display during playback.

.PARAMETER AutoScale
Enables automatic video scaling to fit the window.

.PARAMETER HighPriority
Increases the process priority of the VLC player for better performance.

.PARAMETER EnableTimeStretch
Enables audio time stretching to maintain pitch during speed changes.

.PARAMETER NewWindow
Forces opening a new VLC instance instead of using existing one.

.PARAMETER EnableWallpaperMode
Enables video wallpaper mode where video plays as desktop background.

.PARAMETER EnableAudioTimeStretch
Enables advanced audio time stretching capabilities.

.PARAMETER Close
Closes the VLC media player window.

.PARAMETER SideBySide
Places the VLC window side by side with PowerShell or on a different monitor
for fullscreen mode.

.PARAMETER FocusWindow
Focuses the VLC window after opening.

.PARAMETER SetForeground
Sets the VLC window to foreground after opening.

.PARAMETER Maximize
Maximizes the VLC window.

.PARAMETER RestoreFocus
Restores PowerShell window focus after opening VLC.

.PARAMETER SessionOnly
Uses alternative settings stored in session for AI preferences.

.PARAMETER ClearSession
Clears alternative settings stored in session for AI preferences.

.PARAMETER SkipSession
Stores settings only in persistent preferences without affecting session.

.PARAMETER PassThru
Returns the files found by the search.

.PARAMETER PassThruNoOpen
Returns the files found by the search without opening VLC.

.EXAMPLE
Open-MediaFile

Opens all media files in the current directory using default VLC settings.

.EXAMPLE
vlcmedia ~\Pictures -OnlyPictures -Fullscreen

Opens only picture files from the Pictures folder in fullscreen mode using the
alias 'vlcmedia'.

.EXAMPLE
media ~\Videos -Keywords "*birthday*" -OnlyVideos -Loop

Opens video files containing "birthday" in subtitles with looping enabled using
the alias 'media'.
#>
function Open-MediaFile {

    [CmdletBinding()]
    [Alias('vlcmedia', 'media', 'findmedia')]

    param(
        ########################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "File name or pattern to search for. Default is '*'"
        )]
        [Alias('like', 'l', 'Path', 'Name', 'file', 'Query', 'FullName')]
        [ValidateNotNullOrEmpty()]
        [SupportsWildcards()]
        [string[]] $SearchMask = '*',
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Playlist path to save the media files to. If not specified, ' +
            'the playlist will be saved in a temperary directory.'
        )]
        [ValidateNotNullOrEmpty()]
        [string] $PlaylistPath = [System.IO.Path]::GetTempFileName() + '.m3u',
        ########################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'The initial width of the window'
        )]
        [int] $Width,
        ########################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'The initial height of the window'
        )]
        [int] $Height,
        ########################################################################
        [Parameter(
            Position = 3,
            Mandatory = $false,
            HelpMessage = 'The initial X position of the window'
        )]
        [int] $X,
        ########################################################################
        [Parameter(
            Position = 4,
            Mandatory = $false,
            HelpMessage = 'The initial Y position of the window'
        )]
        [int] $Y,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = ('Keystrokes to send to the VLC Player Window, see ' +
                'documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Keywords to search in file metadata'
        )]
        [SupportsWildcards()]
        [string[]] $Keywords = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters and modifiers when sending keys to VLC'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use Shift+Enter instead of Enter when sending keys to VLC'
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Delay between different input strings in milliseconds when sending keys to VLC'
        )]
        [ValidateRange(0, [int]::MaxValue)]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hold keyboard focus on the VLC window after sending keys'
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The monitor to use, 0 = default, -1 is discard'
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -2,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Source aspect ratio'
        )]
        [string] $AspectRatio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Video cropping'
        )]
        [string] $Crop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use subtitle file'
        )]
        [string] $SubtitleFile,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Subtitles text scaling factor'
        )]
        [ValidateRange(10, 500)]
        [int] $SubtitleScale,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Subtitle language'
        )]
        [ValidateSet(
            'Afrikaans', 'Akan', 'Albanian', 'Amharic', 'Arabic', 'Armenian',
            'Azerbaijani', 'Basque', 'Belarusian', 'Bemba', 'Bengali', 'Bihari',
            'Bork, bork, bork!', 'Bosnian', 'Breton', 'Bulgarian', 'Cambodian',
            'Catalan', 'Cherokee', 'Chichewa', 'Chinese (Simplified)',
            'Chinese (Traditional)', 'Corsican', 'Croatian', 'Czech', 'Danish',
            'Dutch', 'Elmer Fudd', 'English', 'Esperanto', 'Estonian', 'Ewe',
            'Faroese', 'Filipino', 'Finnish', 'French', 'Frisian', 'Ga',
            'Galician', 'Georgian', 'German', 'Greek', 'Guarani', 'Gujarati',
            'Hacker', 'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi',
            'Hungarian', 'Icelandic', 'Igbo', 'Indonesian', 'Interlingua',
            'Irish', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Kazakh',
            'Kinyarwanda', 'Kirundi', 'Klingon', 'Kongo', 'Korean',
            'Krio (Sierra Leone)', 'Kurdish', 'Kurdish (Soranî)', 'Kyrgyz',
            'Laothian', 'Latin', 'Latvian', 'Lingala', 'Lithuanian', 'Lozi',
            'Luganda', 'Luo', 'Macedonian', 'Malagasy', 'Malay', 'Malayalam',
            'Maltese', 'Maori', 'Marathi', 'Mauritian Creole', 'Moldavian',
            'Mongolian', 'Montenegrin', 'Nepali', 'Nigerian Pidgin',
            'Northern Sotho', 'Norwegian', 'Norwegian (Nynorsk)', 'Occitan',
            'Oriya', 'Oromo', 'Pashto', 'Persian', 'Pirate', 'Polish',
            'Portuguese (Brazil)', 'Portuguese (Portugal)', 'Punjabi',
            'Quechua', 'Romanian', 'Romansh', 'Runyakitara', 'Russian',
            'Scots Gaelic', 'Serbian', 'Serbo-Croatian', 'Sesotho', 'Setswana',
            'Seychellois Creole', 'Shona', 'Sindhi', 'Sinhalese', 'Slovak',
            'Slovenian', 'Somali', 'Spanish', 'Spanish (Latin American)',
            'Sundanese', 'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Tatar',
            'Telugu', 'Thai', 'Tigrinya', 'Tonga', 'Tshiluba', 'Tumbuka',
            'Turkish', 'Turkmen', 'Twi', 'Uighur', 'Ukrainian', 'Urdu',
            'Uzbek', 'Vietnamese', 'Welsh', 'Wolof', 'Xhosa', 'Yiddish',
            'Yoruba', 'Zulu')]
        [string] $SubtitleLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Audio language'
        )]
        [ValidateSet(
            'Afrikaans', 'Akan', 'Albanian', 'Amharic', 'Arabic', 'Armenian',
            'Azerbaijani', 'Basque', 'Belarusian', 'Bemba', 'Bengali', 'Bihari',
            'Bork, bork, bork!', 'Bosnian', 'Breton', 'Bulgarian', 'Cambodian',
            'Catalan', 'Cherokee', 'Chichewa', 'Chinese (Simplified)',
            'Chinese (Traditional)', 'Corsican', 'Croatian', 'Czech', 'Danish',
            'Dutch', 'Elmer Fudd', 'English', 'Esperanto', 'Estonian', 'Ewe',
            'Faroese', 'Filipino', 'Finnish', 'French', 'Frisian', 'Ga',
            'Galician', 'Georgian', 'German', 'Greek', 'Guarani', 'Gujarati',
            'Hacker', 'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi',
            'Hungarian', 'Icelandic', 'Igbo', 'Indonesian', 'Interlingua',
            'Irish', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Kazakh',
            'Kinyarwanda', 'Kirundi', 'Klingon', 'Kongo', 'Korean',
            'Krio (Sierra Leone)', 'Kurdish', 'Kurdish (Soranî)', 'Kyrgyz',
            'Laothian', 'Latin', 'Latvian', 'Lingala', 'Lithuanian', 'Lozi',
            'Luganda', 'Luo', 'Macedonian', 'Malagasy', 'Malay', 'Malayalam',
            'Maltese', 'Maori', 'Marathi', 'Mauritian Creole', 'Moldavian',
            'Mongolian', 'Montenegrin', 'Nepali', 'Nigerian Pidgin',
            'Northern Sotho', 'Norwegian', 'Norwegian (Nynorsk)', 'Occitan',
            'Oriya', 'Oromo', 'Pashto', 'Persian', 'Pirate', 'Polish',
            'Portuguese (Brazil)', 'Portuguese (Portugal)', 'Punjabi',
            'Quechua', 'Romanian', 'Romansh', 'Runyakitara', 'Russian',
            'Scots Gaelic', 'Serbian', 'Serbo-Croatian', 'Sesotho', 'Setswana',
            'Seychellois Creole', 'Shona', 'Sindhi', 'Sinhalese', 'Slovak',
            'Slovenian', 'Somali', 'Spanish', 'Spanish (Latin American)',
            'Sundanese', 'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Tatar',
            'Telugu', 'Thai', 'Tigrinya', 'Tonga', 'Tshiluba', 'Tumbuka',
            'Turkish', 'Turkmen', 'Twi', 'Uighur', 'Ukrainian', 'Urdu',
            'Uzbek', 'Vietnamese', 'Welsh', 'Wolof', 'Xhosa', 'Yiddish',
            'Yoruba', 'Zulu')]
        [string] $AudioLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Preferred audio language'
        )]
        [ValidateSet(
            'Afrikaans', 'Akan', 'Albanian', 'Amharic', 'Arabic', 'Armenian',
            'Azerbaijani', 'Basque', 'Belarusian', 'Bemba', 'Bengali', 'Bihari',
            'Bork, bork, bork!', 'Bosnian', 'Breton', 'Bulgarian', 'Cambodian',
            'Catalan', 'Cherokee', 'Chichewa', 'Chinese (Simplified)',
            'Chinese (Traditional)', 'Corsican', 'Croatian', 'Czech', 'Danish',
            'Dutch', 'Elmer Fudd', 'English', 'Esperanto', 'Estonian', 'Ewe',
            'Faroese', 'Filipino', 'Finnish', 'French', 'Frisian', 'Ga',
            'Galician', 'Georgian', 'German', 'Greek', 'Guarani', 'Gujarati',
            'Hacker', 'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi',
            'Hungarian', 'Icelandic', 'Igbo', 'Indonesian', 'Interlingua',
            'Irish', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Kazakh',
            'Kinyarwanda', 'Kirundi', 'Klingon', 'Kongo', 'Korean',
            'Krio (Sierra Leone)', 'Kurdish', 'Kurdish (Soranî)', 'Kyrgyz',
            'Laothian', 'Latin', 'Latvian', 'Lingala', 'Lithuanian', 'Lozi',
            'Luganda', 'Luo', 'Macedonian', 'Malagasy', 'Malay', 'Malayalam',
            'Maltese', 'Maori', 'Marathi', 'Mauritian Creole', 'Moldavian',
            'Mongolian', 'Montenegrin', 'Nepali', 'Nigerian Pidgin',
            'Northern Sotho', 'Norwegian', 'Norwegian (Nynorsk)', 'Occitan',
            'Oriya', 'Oromo', 'Pashto', 'Persian', 'Pirate', 'Polish',
            'Portuguese (Brazil)', 'Portuguese (Portugal)', 'Punjabi',
            'Quechua', 'Romanian', 'Romansh', 'Runyakitara', 'Russian',
            'Scots Gaelic', 'Serbian', 'Serbo-Croatian', 'Sesotho', 'Setswana',
            'Seychellois Creole', 'Shona', 'Sindhi', 'Sinhalese', 'Slovak',
            'Slovenian', 'Somali', 'Spanish', 'Spanish (Latin American)',
            'Sundanese', 'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Tatar',
            'Telugu', 'Thai', 'Tigrinya', 'Tonga', 'Tshiluba', 'Tumbuka',
            'Turkish', 'Turkmen', 'Twi', 'Uighur', 'Ukrainian', 'Urdu',
            'Uzbek', 'Vietnamese', 'Welsh', 'Wolof', 'Xhosa', 'Yiddish',
            'Yoruba', 'Zulu')]
        [string] $PreferredAudioLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'HTTP proxy'
        )]
        [string] $HttpProxy,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'HTTP proxy password'
        )]
        [string] $HttpProxyPassword,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Verbosity level'
        )]
        [ValidateRange(0, 2)]
        [int] $VerbosityLevel,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Subdirectory behavior'
        )]
        [ValidateSet('None', 'Collapse', 'Expand')]
        [string] $SubdirectoryBehavior,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Ignored extensions'
        )]
        [string] $IgnoredExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Path to VLC executable'
        )]
        [string] $VLCPath = "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Replay gain mode'
        )]
        [ValidateSet('None', 'Track', 'Album')]
        [string] $ReplayGainMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Replay gain preamp'
        )]
        [ValidateRange(-20.0, 20.0)]
        [float] $ReplayGainPreamp,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force detection of Dolby Surround'
        )]
        [ValidateSet('Auto', 'On', 'Off')]
        [string] $ForceDolbySurround,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Audio filters'
        )]
        [string[]] $AudioFilters,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Audio visualizations'
        )]
        [ValidateSet('None', 'Goom', 'ProjectM', 'Visual', 'GLSpectrum')]
        [string] $Visualization,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Deinterlace'
        )]
        [ValidateSet('Off', 'Automatic', 'On')]
        [string] $Deinterlace,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Deinterlace mode'
        )]
        [ValidateSet('Auto', 'Discard', 'Blend', 'Mean', 'Bob', 'Linear', 'X',
            'Yadif', 'Yadif2x', 'Phosphor', 'IVTC')]
        [string] $DeinterlaceMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Video filter module'
        )]
        [string[]] $VideoFilters,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Video filter modules'
        )]
        [string[]] $VideoFilterModules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Modules'
        )]
        [string[]] $Modules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Audio filter modules'
        )]
        [string[]] $AudioFilterModules,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Audio visualization mode'
        )]
        [ValidateSet('None', 'Goom', 'ProjectM', 'Visual', 'GLSpectrum')]
        [string] $AudioVisualization,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Preferred subtitle language'
        )]
        [string] $PreferredSubtitleLanguage,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Ignored file extensions'
        )]
        [string] $IgnoredFileExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Additional arguments'
        )]
        [string] $Arguments,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Search across all available drives'
        )]

        [switch] $AllDrives,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do not recurse into subdirectories'
        )]
        [switch] $NoRecurse,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only include video files in the playlist'
        )]
        [switch] $OnlyVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only include audio files in the playlist'
        )]
        [switch] $OnlyAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only include pictures in the playlist'
        )]
        [switch] $OnlyPictures,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Additionally include videos in the playlist'
        )]
        [switch] $IncludeVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Additionally include audio files in the playlist'
        )]
        [switch] $IncludeAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Additionally include pictures in the playlist'
        )]
        [switch] $IncludePictures,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the window'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the left side of the screen'
        )]
        [switch] $Left,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the right side of the screen'
        )]
        [switch] $Right,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the top side of the screen'
        )]
        [switch] $Top,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place window on the bottom side of the screen'
        )]
        [switch] $Bottom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place window in the center of the screen'
        )]
        [switch] $Centered,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Sends F11 to the window'
        )]
        [Alias('fs')]
        [switch]$FullScreen,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Always on top'
        )]
        [switch] $AlwaysOnTop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Play files randomly forever'
        )]
        [Alias('Shuffle')]
        [switch] $Random,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Repeat all'
        )]
        [switch] $Loop,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Repeat current item'
        )]
        [switch] $Repeat,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Start paused'
        )]
        [switch] $StartPaused,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Play and exit'
        )]
        [switch] $PlayAndExit,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable audio'
        )]
        [switch] $DisableAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable subtitles'
        )]
        [switch] $DisableSubtitles,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Video Auto Scaling'
        )]
        [switch] $AutoScale,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Increase the priority of the process'
        )]
        [switch] $HighPriority,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Enable time stretching audio'
        )]
        [switch] $EnableTimeStretch,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open new VLC mediaplayer instance'
        )]
        [switch] $NewWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Enable video wallpaper mode'
        )]
        [switch] $EnableWallpaperMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Enable audio time stretching'
        )]
        [switch] $EnableAudioTimeStretch,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Close the VLC media player window'
        )]
        [switch] $Close,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Will either set the window fullscreen on a ' +
                'different monitor than Powershell, or side by side ' +
                'with Powershell on the same monitor')
        )]
        [Alias('sbs')]
        [switch]$SideBySide,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the VLC window after opening'
        )]
        [Alias('fw','focus')]
        [switch] $FocusWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the VLC window to foreground after opening'
        )]
        [Alias('fg')]
        [switch] $SetForeground,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window'
        )]
        [switch] $Maximize,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restores PowerShell window focus after opening VLC.'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for AI preferences'
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear alternative settings stored in session for AI preferences'
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Store settings only in persistent preferences without affecting session'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns the files found by the search'
        )]
        [Alias('pt')]
        [switch]$PassThru,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns the files found by the search without opening VLC'
        )]
        [switch] $PassThruNoOpen,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns the window helper for each process'
        )]
        [switch] $PassThruWindow
    )

    begin {
        $PlaylistPath = GenXdev.FileSystem\Expand-Path $PlaylistPath -CreateDirectory -DeleteExistingFile

        # define supported file extensions for each media type category
        $videoFiles = @('.mp4', '.avi', '.mkv', '.mov', '.wmv')

        $audioFiles = @('.mp3', '.flac', '.wav', '.midi', '.mid', '.au',
            '.aiff', '.aac', '.m4a', '.ogg', '.wma', '.ra', '.ram', '.rm',
            '.rmm')

        $pictureFiles = @('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff',
            '.tif')

        # output verbose information about supported file types for debugging
        Microsoft.PowerShell.Utility\Write-Verbose ('Supported video files: ' +
            ($videoFiles -join ', '))

        Microsoft.PowerShell.Utility\Write-Verbose ('Supported audio files: ' +
            ($audioFiles -join ', '))

        Microsoft.PowerShell.Utility\Write-Verbose ('Supported picture files: ' +
            ($pictureFiles -join ', '))
    }

    process {

        # copy parameters from current function to find-item function parameters
        # this maintains consistency in parameter handling across functions
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.FileSystem\Find-Item' `
            -BoundParameters $PSBoundParameters

        # ensure we get file objects back instead of just paths for processing
        $invocationParams.PassThru = $true

        # log the search parameters for troubleshooting purposes
        Microsoft.PowerShell.Utility\Write-Verbose ('Searching for files with ' +
            'parameters: ' + ($invocationParams.Keys -join ', '))

        # find all matching files and sort them alphabetically by full path
        $files = GenXdev.FileSystem\Find-Item @invocationParams |
            Microsoft.PowerShell.Utility\Sort-Object -Property FullName

        # determine which file types to include based on filter parameters
        # use ternary operators to select appropriate extensions efficiently
        $validExtensions = $OnlyVideos ? $videoFiles : (
            $OnlyAudio ? $audioFiles : (
                $OnlyPictures ? $pictureFiles : (
                    $videoFiles + $audioFiles + $pictureFiles
                )
            )
        )

        # add video files if specifically requested regardless of other filters
        if ($IncludeVideos) {

            $validExtensions += $videoFiles

            Microsoft.PowerShell.Utility\Write-Verbose 'Including video files'
        }

        # add audio files if specifically requested regardless of other filters
        if ($IncludeAudio) {

            $validExtensions += $audioFiles

            Microsoft.PowerShell.Utility\Write-Verbose 'Including audio files'
        }

        # add picture files if specifically requested regardless of other filters
        if ($IncludePictures) {

            $validExtensions += $pictureFiles

            Microsoft.PowerShell.Utility\Write-Verbose 'Including picture files'
        }

        # remove duplicate extensions that might have been added by multiple filters
        $validExtensions = $validExtensions |
            Microsoft.PowerShell.Utility\Select-Object -Unique

        # log final set of file extensions being searched for debugging
        Microsoft.PowerShell.Utility\Write-Verbose ('Valid extensions: ' +
            ($validExtensions -join ', '))

        # filter files by extension and keywords to build final media playlist
        $files = $files |
            Microsoft.PowerShell.Core\Where-Object {
                try {

                    # first check if file has a valid media extension for inclusion
                    if (-not ($validExtensions -contains $PSItem.Extension.ToLower())) {
                        return $false;
                    }

                    # if keywords specified, perform content-based filtering search
                    if ($Keywords.Length -gt 0) {

                        # check all subtitle files for any keyword matches using wildcards
                        Microsoft.PowerShell.Management\Get-ChildItem -LiteralPath [IO.Path]::GetDirectoryName($PSItem.FullName) -Filter ([IO.Path]::GetFileNameWithoutExtension($PSItem.FullName) +"*.srt") `
                            -File `
                            -ErrorAction SilentlyContinue |
                            Microsoft.PowerShell.Core\ForEach-Object {

                                # load entire subtitle content for comprehensive searching
                                $srt = [IO.File]::ReadAllText($PSItem.FullName);

                                # check each keyword against subtitle text with wildcards
                                foreach ($keyword in $Keywords) {
                                    if ($srt -like "*$keyword*") {
                                        return $true;
                                    }
                                }
                            }

                            # also check for metadata in alternate data streams if available
                            # this handles description.json streams attached to media files
                            if ([IO.File]::Exists("$($PSItem.FullName):description.json")) {

                                # read metadata from alternate data stream for searching
                                $description = [IO.File]::ReadAllText(
                                    "$($PSItem.FullName):description.json"
                                );

                                # check each keyword against description metadata content
                                foreach ($keyword in $Keywords) {
                                    if ($description -like "*$keyword*") {
                                        return $true;
                                    }
                                }
                            }

                            # exclude if no keywords matched in subtitles or descriptions
                            return $false;
                        }

                        # include file if it has valid extension and no keywords specified
                        return $true;
                    }
                    catch {
                        # safely handle any errors during file processing without crashing
                        return $false;
                    }
                }

        # verify that we found at least one media file matching our criteria
        if ($files.Length -eq 0) {

            # inform user that no matching files were found and exit function
            Microsoft.PowerShell.Utility\Write-Host ('No media files found in ' +
                'the specified directory.')

            return
        }

        # log the number of files found for troubleshooting purposes
        Microsoft.PowerShell.Utility\Write-Verbose ("Found $($files.Length) " +
            'media files')

        # log the playlist location for debugging and troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose ('Creating playlist at: ' +
            $playlistPath)

        # initialize the playlist with the m3u header required for proper format
        $m3uContent = "#EXTM3U`r`n"

        # process each file and add it to the playlist with proper m3u formatting
        foreach ($file in $files) {

            # create more readable display names by cleaning up file names
            $displayName = $file.Name.Replace('_', ' ').Replace('.', ' ').Replace('  ', ' ')

            # build m3u format entry with duration (-1 = unknown) and file path
            # extinf format: #extinf:duration,title followed by path on next line
            $m3uContent += "#EXTINF:-1, $displayName`r`n$(($file.FullName))`r`n";

            if ($PassThru) {

                Microsoft.PowerShell.Utility\Write-Output $file
            }
        }

        if ($PassThruNoOpen) {

            return
        }

        # write the complete playlist to disk with utf-8 encoding for compatibility
        $null = $m3uContent |
            Microsoft.PowerShell.Utility\Out-File `
                -FilePath $playlistPath `
                -Encoding utf8 `
                -Force

        # confirm playlist creation was successful for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose ('Playlist created ' +
            'successfully')

        # ensure no existing vlc instances are running to avoid conflicts
        Microsoft.PowerShell.Utility\Write-Verbose 'Stopping existing VLC processes'

        # forcibly terminate any running vlc processes to ensure clean launch
        $null = Microsoft.PowerShell.Management\Get-Process vlc `
            -ErrorAction SilentlyContinue |
            Microsoft.PowerShell.Management\Stop-Process -Force

        # copy all relevant parameters from current function to vlc media player
        # this ensures consistent parameter handling and reduces code duplication
        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Console\Open-VlcMediaPlayer' `
            -BoundParameters $PSBoundParameters

        # configure specific parameters for vlc media player invocation
        $invocationParams.Path = $playlistPath        # use our generated playlist
        $invocationParams.PassThru = $true            # return window helper object

        # log that we're about to launch vlc media player with playlist
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting VLC player'

        # launch vlc with all configured parameters and capture the window helper
        # for potential manipulation in the end{} block if passthru is requested
        $vlcWindowHelper = GenXdev.Console\Open-VlcMediaPlayer @invocationParams
    }

    end {
        # return the window helper object only if explicitly requested via passthru
        # this allows further manipulation of the vlc window programmatically
        if ($PassThruWindow) {

            Microsoft.PowerShell.Utility\Write-Output $vlcWindowHelper
        }
    }
}
################################################################################