<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Console
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Console?style=flat-square)](./LICENSE)

## MIT License

````text
MIT License

Copyright (c) 2025 GenXdev

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
````

### FEATURES

    * ✅ text-to-speech
    * ✅ spotify control
    * ✅ microsoft Shell helpers
    * ✅ after installation, use 'cmds' to see full list of installed GenXdev cmdslets

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
### INSTALLATION
```PowerShell
Install-Module "GenXdev.Console"
Import-Module "GenXdev.Console"
```
### UPDATE
```PowerShell
Update-Module
```

<br/><hr/><br/>

# Cmdlet Index
### GenXdev.Console
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Enable-Screensaver](#enable-screensaver) | &nbsp; | Starts the configured Windows screensaver. |
| [Get-IsSpeaking](#get-isspeaking) | iss | Returns true if the text-to-speech engine is speaking. |
| [New-MicrosoftShellTab](#new-microsoftshelltab) | x | Creates a new Windows Terminal tab running PowerShell. |
| [Now](#now) | &nbsp; | Returns the current system date and time as a DateTime object. |
| [Open-MediaFile](#open-mediafile) | findmedia, media, vlcmedia | &nbsp; |
| [SayDate](#saydate) | &nbsp; | Speaks the current date using text-to-speech synthesis. |
| [SayTime](#saytime) | &nbsp; | Announces the current time using text-to-speech. |
| [Set-LocationParent](#set-locationparent) | .. | Changes the current location to the parent directory and lists its contents. |
| [Set-LocationParent2](#set-locationparent2) | ... | Navigates up two directory levels in the file system hierarchy. |
| [Set-LocationParent3](#set-locationparent3) | .... | Navigates up three directory levels in the file system hierarchy. |
| [Set-LocationParent4](#set-locationparent4) | ..... | Navigates up four directory levels in the filesystem hierarchy. |
| [Set-LocationParent5](#set-locationparent5) | ...... | Navigates up five directory levels in the file system hierarchy. |
| [Set-MonitorPowerOff](#set-monitorpoweroff) | poweroff | Turns off power to all connected monitors. |
| [Set-MonitorPowerOn](#set-monitorpoweron) | monitoroff, wakemonitor | Turns the monitor power on. |
| [Set-VLCPlayerFocused](#set-vlcplayerfocused) | fvlc, showvlc, vlcf | Sets focus to the VLC media player window. |
| [Start-TextToSpeech](#start-texttospeech) | say | Converts text to speech using the Windows Speech API. |
| [Stop-TextToSpeech](#stop-texttospeech) | sst | Immediately stops any ongoing text-to-speech output. |
| [UtcNow](#utcnow) | &nbsp; | Gets the current UTC (Coordinated Universal Time) date and time. |

### GenXdev.Console.Spotify
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Add-SpotifyNewPlaylist](#add-spotifynewplaylist) | newplaylist | Creates a new Spotify playlist with customizable settings. |
| [Add-SpotifyTracksToLiked](#add-spotifytrackstoliked) | like | Adds tracks to the user's Spotify liked songs library. |
| [Add-SpotifyTracksToPlaylist](#add-spotifytrackstoplaylist) | addtoplaylist | Adds tracks to a Spotify playlist. |
| [Connect-SpotifyApiToken](#connect-spotifyapitoken) | &nbsp; | Authenticates with Spotify API using OAuth flow to obtain an access token. |
| [Get-SpotifyActiveDevice](#get-spotifyactivedevice) | &nbsp; | Returns all currently active Spotify devices for the current user. |
| [Get-SpotifyApiToken](#get-spotifyapitoken) | &nbsp; | Retrieves or generates a valid Spotify API authentication token. |
| [Get-SpotifyCurrentlyPlaying](#get-spotifycurrentlyplaying) | gcp | Returns information about the currently playing track on Spotify. |
| [Get-SpotifyDevice](#get-spotifydevice) | &nbsp; | Returns all currently available Spotify devices for current user. |
| [Get-SpotifyLikedTrack](#get-spotifylikedtrack) | liked | Retrieves all tracks saved in the user's Spotify Library. |
| [Get-SpotifyLyrics](#get-spotifylyrics) | lyrics | Retrieves lyrics for Spotify tracks from Musixmatch.com |
| [Get-SpotifyPlaylistIdsByName](#get-spotifyplaylistidsbyname) | &nbsp; | Retrieves Spotify playlist IDs by their names. |
| [Get-SpotifyPlaylistTrack](#get-spotifyplaylisttrack) | getplaylist | Returns all tracks from a Spotify playlist. |
| [Get-SpotifyTrackAudioFeatures](#get-spotifytrackaudiofeatures) | audiofeatures | Retrieves audio feature information for one or more Spotify tracks. |
| [Get-SpotifyTrackById](#get-spotifytrackbyid) | gettrack | Retrieves detailed track information from Spotify using a track ID. |
| [Get-SpotifyUserPlaylists](#get-spotifyuserplaylists) | gupl | Returns a collection of Spotify playlists owned by the current user. |
| [Move-SpotifyLikedTracksToPlaylist](#move-spotifylikedtrackstoplaylist) | moveliked | Moves all liked tracks from your Spotify library to specified playlist(s) |
| [Remove-SpotifyTracksFromLiked](#remove-spotifytracksfromliked) | dislike | Removes tracks from the user's Spotify Library (Liked Songs). |
| [Remove-SpotifyTracksFromPlaylist](#remove-spotifytracksfromplaylist) | removefromplaylist | Removes tracks from a Spotify playlist. |
| [Search-Spotify](#search-spotify) | fm, sm | Performs a Spotify search and returns matching items. |
| [Search-SpotifyAndEnqueue](#search-spotifyandenqueue) | fmq, smq | Searches Spotify and adds the first matching item to the playback queue. |
| [Search-SpotifyAndPlay](#search-spotifyandplay) | fmp, smp | Performs a Spotify search and plays the first found item. |
| [Set-SpotifyActiveDevice](#set-spotifyactivedevice) | &nbsp; | Sets the active Spotify playback device. |
| [Set-SpotifyApiToken](#set-spotifyapitoken) | &nbsp; | Caches a Spotify API token for later use in the local configuration. |
| [Set-SpotifyNext](#set-spotifynext) | next, skip | Skips to next track on Spotify. |
| [Set-SpotifyPause](#set-spotifypause) | pausemusic, togglepausemusic | Pauses Spotify playback |
| [Set-SpotifyPlaylistDetails](#set-spotifyplaylistdetails) | spld | Sets the main properties of a Spotify playlist. |
| [Set-SpotifyPlaylistOrder](#set-spotifyplaylistorder) | &nbsp; | &nbsp; |
| [Set-SpotifyPrevious](#set-spotifyprevious) | prev, previous | Skips to the previous track in Spotify playback. |
| [Set-SpotifyRepeatContext](#set-spotifyrepeatcontext) | repeat | Enables playlist repeat mode for Spotify playback. |
| [Set-SpotifyRepeatOff](#set-spotifyrepeatoff) | norepeat, repeatoff | Disables Spotify repeat mode for the currently active device. |
| [Set-SpotifyRepeatSong](#set-spotifyrepeatsong) | repeatsong | Enables song repeat mode in Spotify. |
| [Set-SpotifyShuffleOff](#set-spotifyshuffleoff) | noshuffle, shuffleoff | Disables Spotify song-shuffle mode on the active device. |
| [Set-SpotifyShuffleOn](#set-spotifyshuffleon) | shuffle, shuffleon | Enables Spotify song-shuffle mode. |
| [Set-SpotifyStart](#set-spotifystart) | play, startmusic | Starts Spotify playback on the currently active device. |
| [Set-SpotifyStop](#set-spotifystop) | stop | Stops Spotify playback on the active device. |

### GenXdev.Console.Vlc
| Command | Aliases | Description |
| :--- | :--- | :--- |
| [Open-VlcMediaPlayer](#open-vlcmediaplayer) | vlc | Launches and controls VLC Media Player with extensive configuration options. |
| [Open-VlcMediaPlayerLyrics](#open-vlcmediaplayerlyrics) | vlclyrics | Opens a web browser to search for lyrics of currently playing VLC media. |
| [Start-VlcMediaPlayerNextInPlaylist](#start-vlcmediaplayernextinplaylist) | vlcnext | Advances VLC Media Player to the next item in the current playlist. |
| [Start-VlcMediaPlayerPreviousInPlaylist](#start-vlcmediaplayerpreviousinplaylist) | vlcback, vlcprev | Moves to the previous item in the VLC Media Player playlist. |
| [Switch-VlcMediaPlayerMute](#switch-vlcmediaplayermute) | vlcmute, vlcunmute | Toggles the mute state of the VLC Media Player. |
| [Switch-VLCMediaPlayerPaused](#switch-vlcmediaplayerpaused) | vlcpause, vlcplay | Toggles the pause/play state of the VLC Media Player. |
| [Switch-VlcMediaPlayerRepeat](#switch-vlcmediaplayerrepeat) | vlcrepeat | Toggles the repeat mode in VLC Media Player. |

<br/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Console<hr/> 

##	Enable-Screensaver 
```PowerShell 

   Enable-Screensaver  
```` 

### SYNTAX 
```PowerShell 
Enable-Screensaver [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-IsSpeaking 
```PowerShell 

   Get-IsSpeaking                       --> iss  
```` 

### SYNTAX 
```PowerShell 
Get-IsSpeaking [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-MicrosoftShellTab 
```PowerShell 

   New-MicrosoftShellTab                --> x  
```` 

### SYNTAX 
```PowerShell 
New-MicrosoftShellTab [-DontCloseThisTab] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DontCloseThisTab  
        Keep current tab open after creating new tab  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Now 
```PowerShell 

   Now  
```` 

### SYNTAX 
```PowerShell 
Now [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-MediaFile 
```PowerShell 

   Open-MediaFile                       --> findmedia, media, vlcmedia  
```` 

### SYNTAX 
```PowerShell 
Open-MediaFile [[-Name] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>]
    [-InputObject <Object>] [-PlaylistPath <string>]
    [-KeysToSend <string[]>] [-MaxDegreeOfParallelism <int>]
    [-TimeoutSeconds <int>] [-SendKeyEscape]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-AllDrives] [-IncludeAlternateFileStreams] [-NoRecurse]
    [-FollowSymlinkAndJunctions] [-IncludeOpticalDiskDrives]
    [-SearchDrives <string[]>] [-DriveLetter <char[]>]
    [-Root <string[]>] [-OnlyVideos] [-OnlyAudio]
    [-OnlyPictures] [-IncludeVideos] [-IncludeAudio]
    [-IncludePictures] [-NoBorders] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-FullScreen] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-CaseNameMatching {PlatformDefault |
    CaseSensitive | CaseInsensitive}] [-MaxRecursionDepth
    <int>] [-MaxFileSize <long>] [-MinFileSize <long>]
    [-ModifiedAfter <datetime>] [-ModifiedBefore <datetime>]
    [-AttributesToSkip {None | ReadOnly | Hidden | System |
    Directory | Archive | Device | Normal | Temporary |
    SparseFile | ReparsePoint | Compressed | Offline |
    NotContentIndexed | Encrypted | IntegrityStream |
    NoScrubData}] [-Exclude <string[]>] [-PassThru]
    [-PassThruNoOpen] [-PassThruWindow] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllDrives  
        Search across all available drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AttributesToSkip <FileAttributes>  
        File attributes to skip (e.g., System, Hidden or None).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skipattr  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CaseNameMatching <MatchCasing>  
        Gets or sets the case-sensitivity for files and directories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      casing, CaseSearchMaskMatching  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DriveLetter <char[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Exclude <string[]>  
        Exclude files or directories matching these wildcard patterns (e.g., *.tmp, *\\bin\\*).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skiplike  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FollowSymlinkAndJunctions  
        Follow symlinks and junctions during directory traversal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      symlinks, sl  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAlternateFileStreams  
        Include alternate data streams in search results  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAudio  
        Additionally include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeOpticalDiskDrives  
        Include optical disk drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludePictures  
        Additionally include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeVideos  
        Additionally include videos in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <Object>  
        File name or pattern to search for from pipeline input. Default is "*"  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxDegreeOfParallelism <int>  
        Maximum degree of parallelism for directory tasks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      threads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxFileSize <long>  
        Maximum file size in bytes to include in results. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxlength, maxsize  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxRecursionDepth <int>  
        Maximum recursion depth for directory traversal. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      md, depth, maxdepth  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MinFileSize <long>  
        Minimum file size in bytes to include in results. 0 means no minimum.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      minsize, minlength  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedAfter <datetime>  
        Only include files modified after this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ma, after  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedBefore <datetime>  
        Only include files modified before this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      before, mb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        File name or pattern to search for. Default is '*'  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      like, Path, LiteralPath, Query, SearchMask, Include  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRecurse  
        Do not recurse into subdirectories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyAudio  
        Only include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPictures  
        Only include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyVideos  
        Only include video files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the files found by the search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruNoOpen  
        Returns the files found by the search without opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruWindow  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistPath <string>  
        Playlist path to save the media files to. If not specified, the playlist will be saved in a temporary directory.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restores PowerShell window focus after opening VLC.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Root <string[]>  
        Optional: search specific base folders combined with provided Names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchDrives <string[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      drives  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        Optional: cancellation timeout in seconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxseconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayDate 
```PowerShell 

   SayDate  
```` 

### SYNTAX 
```PowerShell 
SayDate [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayTime 
```PowerShell 

   SayTime  
```` 

### SYNTAX 
```PowerShell 
SayTime [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent 
```PowerShell 

   Set-LocationParent                   --> ..  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent2 
```PowerShell 

   Set-LocationParent2                  --> ...  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent2 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent3 
```PowerShell 

   Set-LocationParent3                  --> ....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent3 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent4 
```PowerShell 

   Set-LocationParent4                  --> .....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent4 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent5 
```PowerShell 

   Set-LocationParent5                  --> ......  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent5 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOff 
```PowerShell 

   Set-MonitorPowerOff                  --> poweroff  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOn 
```PowerShell 

   Set-MonitorPowerOn                   --> monitoroff, wakemonitor  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOn [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-VLCPlayerFocused 
```PowerShell 

   Set-VLCPlayerFocused                 --> fvlc, showvlc, vlcf  
```` 

### SYNTAX 
```PowerShell 
Set-VLCPlayerFocused [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-TextToSpeech 
```PowerShell 

   Start-TextToSpeech                   --> say  
```` 

### SYNTAX 
```PowerShell 
Start-TextToSpeech [-Lines] <string[]> [-Locale <string>]
    [-VoiceName <string>] [-PassThru] [-Wait] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Lines <string[]>  
        Text to be spoken  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           strings  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Locale <string>  
        The language locale id to use, e.g. 'en-US'  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Output the text being spoken to the pipeline  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VoiceName <string>  
        Name of the voice to use for speech  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Wait  
        Wait for speech to complete before continuing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Stop-TextToSpeech 
```PowerShell 

   Stop-TextToSpeech                    --> sst  
```` 

### SYNOPSIS 
    Immediately stops any ongoing text-to-speech output.  

### SYNTAX 
```PowerShell 
Stop-TextToSpeech [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Halts all active and queued speech synthesis by canceling both standard and  
    customized speech operations. This provides an immediate silence for any ongoing  
    text-to-speech activities.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)  
       and Skip-TextToSpeech (alias: sstSkip) for speech control.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Stop-TextToSpeech  
   Immediately stops any ongoing speech  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> say "Hello world"; sst  
   Starts speaking but gets interrupted immediately  
```` 

<br/><hr/><br/>
 

##	UtcNow 
```PowerShell 

   UtcNow  
```` 

### SYNTAX 
```PowerShell 
UtcNow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/> 

##	Add-SpotifyNewPlaylist 
```PowerShell 

   Add-SpotifyNewPlaylist               --> newplaylist  
```` 

### SYNOPSIS 
    Creates a new Spotify playlist with customizable settings.  

### SYNTAX 
```PowerShell 
Add-SpotifyNewPlaylist [-Name] <String> [[-Description]
    <String>] [-Public] [-Collabrative] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new Spotify playlist with the specified name, description, and privacy  
    settings. The function authenticates with Spotify, creates the playlist, and  
    updates the local playlist cache.  

### PARAMETERS 
    -Name <String>  
        The name for the new playlist. This will be visible to users who can access the  
        playlist.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        An optional description for the playlist that provides additional context about  
        its contents or purpose.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Public [<SwitchParameter>]  
        When specified, makes the playlist publicly visible to other Spotify users.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Collabrative [<SwitchParameter>]  
        When specified, allows other users to modify the playlist contents.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToLiked 
```PowerShell 

   Add-SpotifyTracksToLiked             --> like  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToLiked [[-TrackId] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track IDs to add to liked songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToPlaylist 
```PowerShell 

   Add-SpotifyTracksToPlaylist          --> addtoplaylist  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [<CommonParameters>]
Add-SpotifyTracksToPlaylist [-PlaylistId] <string[]> [[-Uri]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be added to the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Connect-SpotifyApiToken 
```PowerShell 

   Connect-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Connect-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyActiveDevice 
```PowerShell 

   Get-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyActiveDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyApiToken 
```PowerShell 

   Get-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyCurrentlyPlaying 
```PowerShell 

   Get-SpotifyCurrentlyPlaying          --> gcp  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyCurrentlyPlaying [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyDevice 
```PowerShell 

   Get-SpotifyDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLikedTrack 
```PowerShell 

   Get-SpotifyLikedTrack                --> liked  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLikedTrack [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLyrics 
```PowerShell 

   Get-SpotifyLyrics                    --> lyrics  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLyrics [[-TrackId] <string>] [[-Monitor] <int>]
    [[-Width] <int>] [[-Height] <int>] [[-Left] <int>]
    [[-Right] <int>] [[-Top] <int>] [[-Bottom] <int>]
    [[-AcceptLang] <string>] [[-SendKeyDelayMilliSeconds]
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-FullScreen] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-RestoreFocus] [-NewWindow] [-ReturnURL]
    [-ReturnOnlyURL] [-NoBorders] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-SideBySide]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set Accept-Language HTTP header  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Open browser in application mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom <int>  
        Bottom position of browser window  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center browser window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Use Google Chrome browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Use Chromium browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session before opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable popup blocker in browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Use Microsoft Edge browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Use Mozilla Firefox browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus browser window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force browser launch or override restrictions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Open browser in full screen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs, f  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Height of browser window in pixels  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Left position of browser window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Target monitor for browser window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open link in a new browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Open browser window without borders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Disable browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Open browser in private/incognito mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to previous window after closing browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        Return only the URL, do not open browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Return the URL after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Right position of browser window  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key after page load  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session-only mode for browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set browser window to foreground  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Top position of browser window  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string>  
        Spotify track ID to lookup lyrics for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Width of browser window in pixels  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistIdsByName 
```PowerShell 

   Get-SpotifyPlaylistIdsByName  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistIdsByName [-PlaylistName] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistName <string[]>  
        One or more Spotify playlist names to search for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistTrack 
```PowerShell 

   Get-SpotifyPlaylistTrack             --> getplaylist  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistTrack [-PlaylistName] <string>
    [<CommonParameters>]
Get-SpotifyPlaylistTrack [-PlaylistId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackAudioFeatures 
```PowerShell 

   Get-SpotifyTrackAudioFeatures        --> audiofeatures  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackAudioFeatures [-TrackId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track to return audio features for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackById 
```PowerShell 

   Get-SpotifyTrackById                 --> gettrack  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackById [-TrackId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string>  
        The Spotify track ID to lookup track information for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyUserPlaylists 
```PowerShell 

   Get-SpotifyUserPlaylists             --> gupl  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyUserPlaylists [[-Filter] <string[]>] [-Force]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Filter <string[]>  
        Wildcard pattern to filter playlists by name  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Uri, Id, Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force fresh data retrieval instead of using cache  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Move-SpotifyLikedTracksToPlaylist 
```PowerShell 

   Move-SpotifyLikedTracksToPlaylist    --> moveliked  
```` 

### SYNTAX 
```PowerShell 
Move-SpotifyLikedTracksToPlaylist [-PlaylistName] <string[]>
    [<CommonParameters>]
Move-SpotifyLikedTracksToPlaylist [-PlaylistId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist ID where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromLiked 
```PowerShell 

   Remove-SpotifyTracksFromLiked        --> dislike  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromLiked [[-TrackId] <string[]>]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string[]>  
        The Spotify track IDs to remove from Liked Songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromPlaylist 
```PowerShell 

   Remove-SpotifyTracksFromPlaylist     --> removefromplaylist  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>]
Remove-SpotifyTracksFromPlaylist [-PlaylistId] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be removed from the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-Spotify 
```PowerShell 

   Search-Spotify                       --> fm, sm  
```` 

### SYNTAX 
```PowerShell 
Search-Spotify [-Queries] <string[]> [[-SearchType] {Album |
    Artist | Playlist | Track | Show | Episode | All}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        The query to perform  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        Type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndEnqueue 
```PowerShell 

   Search-SpotifyAndEnqueue             --> fmq, smq  
```` 

### SYNOPSIS 
    Searches Spotify and adds the first matching item to the playback queue.  

### SYNTAX 
```PowerShell 
Search-SpotifyAndEnqueue [-Queries] <String[]>
    [[-SearchType] {Album | Artist | Playlist | Track | Show
    | Episode | All}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Performs a search on Spotify using specified criteria and automatically adds the  
    first matching result to the current playback queue. Supports searching for  
    tracks, albums, artists, playlists, shows, and episodes.  

### PARAMETERS 
    -Queries <String[]>  
        One or more search phrases to find content on Spotify. Each query is processed  
        sequentially and the first match for each is added to the queue.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SearchType  
        Specifies the type(s) of content to search for. Valid options are:  
        - Track (default)  
        - Album  
        - Artist  
        - Playlist  
        - Show  
        - Episode  
        - All  
        Required?                    false  
        Position?                    2  
        Default value                Track  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndPlay 
```PowerShell 

   Search-SpotifyAndPlay                --> fmp, smp  
```` 

### SYNTAX 
```PowerShell 
Search-SpotifyAndPlay [-Queries] <string[]> [[-SearchType]
    {Album | Artist | Playlist | Track | Show | Episode |
    All}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        One or more search phrases to look for on Spotify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        The type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyActiveDevice 
```PowerShell 

   Set-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyActiveDevice [-DeviceId] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeviceId <string>  
        The Spotify deviceId to transfer playback to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyApiToken 
```PowerShell 

   Set-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyApiToken [-ApiToken] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ApiToken <string>  
        The Spotify API token to cache locally  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyNext 
```PowerShell 

   Set-SpotifyNext                      --> next, skip  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyNext [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPause 
```PowerShell 

   Set-SpotifyPause                     --> pausemusic, togglepausemusic  
```` 

### SYNOPSIS 
    Pauses Spotify playback  

### SYNTAX 
```PowerShell 
Set-SpotifyPause [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Controls Spotify playback by pausing the currently playing track on the active  
    device. If playback is already paused, this command will resume playback.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistDetails 
```PowerShell 

   Set-SpotifyPlaylistDetails           --> spld  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistDetails [-PlaylistId] <string> [-Name]
    <string> [[-Description] <string>] [-Public]
    [-Collabrative] [-Private] [-NoCollabrations] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Collabrative  
        Allow others to make changes to this playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        The description for the new playlist  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name for the new playlist  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoCollabrations  
        Disallow others to make changes  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist to make changes to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Make the playlist private  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Public  
        Make this a public playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistOrder 
```PowerShell 

   Set-SpotifyPlaylistOrder  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistOrder [-PlaylistId] <string>
    [-RangeStart] <int> [-InsertBefore] <int>
    [[-RangeLength] <int>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InsertBefore <int>  
        The position where tracks should be inserted  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist identifier to modify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeLength <int>  
        Number of consecutive tracks to move (defaults to 1)  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeStart <int>  
        The position of the first track to move  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPrevious 
```PowerShell 

   Set-SpotifyPrevious                  --> prev, previous  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPrevious [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatContext 
```PowerShell 

   Set-SpotifyRepeatContext             --> repeat  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatContext [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatOff 
```PowerShell 

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatSong 
```PowerShell 

   Set-SpotifyRepeatSong                --> repeatsong  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatSong [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOff 
```PowerShell 

   Set-SpotifyShuffleOff                --> noshuffle, shuffleoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOn 
```PowerShell 

   Set-SpotifyShuffleOn                 --> shuffle, shuffleon  
```` 

### SYNOPSIS 
    Enables Spotify song-shuffle mode.  

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOn [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### DESCRIPTION 
    Enables shuffle mode on the currently active Spotify playback device. This  
    function requires a valid Spotify API token and an active playback session.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStart 
```PowerShell 

   Set-SpotifyStart                     --> play, startmusic  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStart [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStop 
```PowerShell 

   Set-SpotifyStop                      --> stop  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStop [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Vlc<hr/> 

##	Open-VlcMediaPlayer 
```PowerShell 

   Open-VlcMediaPlayer                  --> vlc  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayer [[-Path] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>]
    [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-NoBorders] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-FullScreen] [-PassThru] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string[]>  
        The media file(s) or URL(s) to open in VLC  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus after opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-VlcMediaPlayerLyrics 
```PowerShell 

   Open-VlcMediaPlayerLyrics            --> vlclyrics  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayerLyrics [[-Queries] <string[]>]
    [[-EndPoint] {Bing | Github | Google | Youtube}]
    [[-Language] {Afrikaans | Akan | Albanian | Amharic |
    Arabic | Armenian | Azerbaijani | Basque | Belarusian |
    Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian |
    Breton | Bulgarian | Cambodian | Catalan | Cherokee |
    Chichewa | Chinese (Simplified) | Chinese (Traditional)
    | Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-Monitor <int>] [-Width <int>] [-Height
    <int>] [-X <int>] [-Y <int>] [-AcceptLang <string>]
    [-KeysToSend <string[]>] [-SendKeyDelayMilliSeconds
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-All] [-ShowWindow] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-SetRestored] [-RestoreFocus] [-NewWindow]
    [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [-SideBySide] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set the browser accept-lang http header  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -All  
        Opens in all registered modern browsers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Hide the browser controls  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place browser window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place browser window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Opens in Google Chrome  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session data before opening the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable the popup blocker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Opens in Microsoft Edge  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EndPoint <string>  
        The endpoint to invoke the query on  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Opens in Firefox  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the browser window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force enable debugging port, stopping existing browsers if needed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Language <string>  
        The language of the returned search results  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place browser window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Do not re-use existing browser window, instead, create a new one  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders from the browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Prevent loading of browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns a [System.Diagnostics.Process] object of the browserprocess  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Opens in incognito/private browsing mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        Search terms to find a track  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        After opening webbrowser, return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Do not open webbrowser, just return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place browser window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between sending different key sequences in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Prevent returning keyboard focus to PowerShell after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Send Shift+Enter instead of regular Enter for line breaks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use a session that is not persisted after closing the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the browser window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Opens in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser windows side by side  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using any existing browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place browser window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerNextInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerNextInPlaylist   --> vlcnext  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerNextInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerPreviousInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerPreviousInPlaylist --> vlcback, vlcprev  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerPreviousInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerMute 
```PowerShell 

   Switch-VlcMediaPlayerMute            --> vlcmute, vlcunmute  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerMute [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VLCMediaPlayerPaused 
```PowerShell 

   Switch-VLCMediaPlayerPaused          --> vlcpause, vlcplay  
```` 

### SYNTAX 
```PowerShell 
Switch-VLCMediaPlayerPaused [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerRepeat 
```PowerShell 

   Switch-VlcMediaPlayerRepeat          --> vlcrepeat  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerRepeat [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console<hr/> 

##	Enable-Screensaver 
```PowerShell 

   Enable-Screensaver  
```` 

### SYNTAX 
```PowerShell 
Enable-Screensaver [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-IsSpeaking 
```PowerShell 

   Get-IsSpeaking                       --> iss  
```` 

### SYNTAX 
```PowerShell 
Get-IsSpeaking [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-MicrosoftShellTab 
```PowerShell 

   New-MicrosoftShellTab                --> x  
```` 

### SYNTAX 
```PowerShell 
New-MicrosoftShellTab [-DontCloseThisTab] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DontCloseThisTab  
        Keep current tab open after creating new tab  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Now 
```PowerShell 

   Now  
```` 

### SYNTAX 
```PowerShell 
Now [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-MediaFile 
```PowerShell 

   Open-MediaFile                       --> findmedia, media, vlcmedia  
```` 

### SYNTAX 
```PowerShell 
Open-MediaFile [[-Name] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>]
    [-InputObject <Object>] [-PlaylistPath <string>]
    [-KeysToSend <string[]>] [-MaxDegreeOfParallelism <int>]
    [-TimeoutSeconds <int>] [-SendKeyEscape]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-AllDrives] [-IncludeAlternateFileStreams] [-NoRecurse]
    [-FollowSymlinkAndJunctions] [-IncludeOpticalDiskDrives]
    [-SearchDrives <string[]>] [-DriveLetter <char[]>]
    [-Root <string[]>] [-OnlyVideos] [-OnlyAudio]
    [-OnlyPictures] [-IncludeVideos] [-IncludeAudio]
    [-IncludePictures] [-NoBorders] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-FullScreen] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-CaseNameMatching {PlatformDefault |
    CaseSensitive | CaseInsensitive}] [-MaxRecursionDepth
    <int>] [-MaxFileSize <long>] [-MinFileSize <long>]
    [-ModifiedAfter <datetime>] [-ModifiedBefore <datetime>]
    [-AttributesToSkip {None | ReadOnly | Hidden | System |
    Directory | Archive | Device | Normal | Temporary |
    SparseFile | ReparsePoint | Compressed | Offline |
    NotContentIndexed | Encrypted | IntegrityStream |
    NoScrubData}] [-Exclude <string[]>] [-PassThru]
    [-PassThruNoOpen] [-PassThruWindow] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllDrives  
        Search across all available drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AttributesToSkip <FileAttributes>  
        File attributes to skip (e.g., System, Hidden or None).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skipattr  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CaseNameMatching <MatchCasing>  
        Gets or sets the case-sensitivity for files and directories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      casing, CaseSearchMaskMatching  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DriveLetter <char[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Exclude <string[]>  
        Exclude files or directories matching these wildcard patterns (e.g., *.tmp, *\\bin\\*).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skiplike  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FollowSymlinkAndJunctions  
        Follow symlinks and junctions during directory traversal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      symlinks, sl  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAlternateFileStreams  
        Include alternate data streams in search results  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAudio  
        Additionally include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeOpticalDiskDrives  
        Include optical disk drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludePictures  
        Additionally include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeVideos  
        Additionally include videos in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <Object>  
        File name or pattern to search for from pipeline input. Default is "*"  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxDegreeOfParallelism <int>  
        Maximum degree of parallelism for directory tasks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      threads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxFileSize <long>  
        Maximum file size in bytes to include in results. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxlength, maxsize  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxRecursionDepth <int>  
        Maximum recursion depth for directory traversal. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      md, depth, maxdepth  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MinFileSize <long>  
        Minimum file size in bytes to include in results. 0 means no minimum.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      minsize, minlength  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedAfter <datetime>  
        Only include files modified after this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ma, after  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedBefore <datetime>  
        Only include files modified before this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      before, mb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        File name or pattern to search for. Default is '*'  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      like, Path, LiteralPath, Query, SearchMask, Include  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRecurse  
        Do not recurse into subdirectories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyAudio  
        Only include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPictures  
        Only include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyVideos  
        Only include video files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the files found by the search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruNoOpen  
        Returns the files found by the search without opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruWindow  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistPath <string>  
        Playlist path to save the media files to. If not specified, the playlist will be saved in a temporary directory.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restores PowerShell window focus after opening VLC.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Root <string[]>  
        Optional: search specific base folders combined with provided Names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchDrives <string[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      drives  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        Optional: cancellation timeout in seconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxseconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayDate 
```PowerShell 

   SayDate  
```` 

### SYNTAX 
```PowerShell 
SayDate [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayTime 
```PowerShell 

   SayTime  
```` 

### SYNTAX 
```PowerShell 
SayTime [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent 
```PowerShell 

   Set-LocationParent                   --> ..  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent2 
```PowerShell 

   Set-LocationParent2                  --> ...  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent2 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent3 
```PowerShell 

   Set-LocationParent3                  --> ....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent3 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent4 
```PowerShell 

   Set-LocationParent4                  --> .....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent4 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent5 
```PowerShell 

   Set-LocationParent5                  --> ......  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent5 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOff 
```PowerShell 

   Set-MonitorPowerOff                  --> poweroff  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOn 
```PowerShell 

   Set-MonitorPowerOn                   --> monitoroff, wakemonitor  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOn [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-VLCPlayerFocused 
```PowerShell 

   Set-VLCPlayerFocused                 --> fvlc, showvlc, vlcf  
```` 

### SYNTAX 
```PowerShell 
Set-VLCPlayerFocused [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-TextToSpeech 
```PowerShell 

   Start-TextToSpeech                   --> say  
```` 

### SYNTAX 
```PowerShell 
Start-TextToSpeech [-Lines] <string[]> [-Locale <string>]
    [-VoiceName <string>] [-PassThru] [-Wait] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Lines <string[]>  
        Text to be spoken  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           strings  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Locale <string>  
        The language locale id to use, e.g. 'en-US'  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Output the text being spoken to the pipeline  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VoiceName <string>  
        Name of the voice to use for speech  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Wait  
        Wait for speech to complete before continuing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Stop-TextToSpeech 
```PowerShell 

   Stop-TextToSpeech                    --> sst  
```` 

### SYNOPSIS 
    Immediately stops any ongoing text-to-speech output.  

### SYNTAX 
```PowerShell 
Stop-TextToSpeech [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Halts all active and queued speech synthesis by canceling both standard and  
    customized speech operations. This provides an immediate silence for any ongoing  
    text-to-speech activities.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)  
       and Skip-TextToSpeech (alias: sstSkip) for speech control.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Stop-TextToSpeech  
   Immediately stops any ongoing speech  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> say "Hello world"; sst  
   Starts speaking but gets interrupted immediately  
```` 

<br/><hr/><br/>
 

##	UtcNow 
```PowerShell 

   UtcNow  
```` 

### SYNTAX 
```PowerShell 
UtcNow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/> 

##	Add-SpotifyNewPlaylist 
```PowerShell 

   Add-SpotifyNewPlaylist               --> newplaylist  
```` 

### SYNOPSIS 
    Creates a new Spotify playlist with customizable settings.  

### SYNTAX 
```PowerShell 
Add-SpotifyNewPlaylist [-Name] <String> [[-Description]
    <String>] [-Public] [-Collabrative] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new Spotify playlist with the specified name, description, and privacy  
    settings. The function authenticates with Spotify, creates the playlist, and  
    updates the local playlist cache.  

### PARAMETERS 
    -Name <String>  
        The name for the new playlist. This will be visible to users who can access the  
        playlist.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        An optional description for the playlist that provides additional context about  
        its contents or purpose.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Public [<SwitchParameter>]  
        When specified, makes the playlist publicly visible to other Spotify users.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Collabrative [<SwitchParameter>]  
        When specified, allows other users to modify the playlist contents.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToLiked 
```PowerShell 

   Add-SpotifyTracksToLiked             --> like  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToLiked [[-TrackId] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track IDs to add to liked songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToPlaylist 
```PowerShell 

   Add-SpotifyTracksToPlaylist          --> addtoplaylist  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [<CommonParameters>]
Add-SpotifyTracksToPlaylist [-PlaylistId] <string[]> [[-Uri]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be added to the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Connect-SpotifyApiToken 
```PowerShell 

   Connect-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Connect-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyActiveDevice 
```PowerShell 

   Get-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyActiveDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyApiToken 
```PowerShell 

   Get-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyCurrentlyPlaying 
```PowerShell 

   Get-SpotifyCurrentlyPlaying          --> gcp  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyCurrentlyPlaying [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyDevice 
```PowerShell 

   Get-SpotifyDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLikedTrack 
```PowerShell 

   Get-SpotifyLikedTrack                --> liked  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLikedTrack [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLyrics 
```PowerShell 

   Get-SpotifyLyrics                    --> lyrics  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLyrics [[-TrackId] <string>] [[-Monitor] <int>]
    [[-Width] <int>] [[-Height] <int>] [[-Left] <int>]
    [[-Right] <int>] [[-Top] <int>] [[-Bottom] <int>]
    [[-AcceptLang] <string>] [[-SendKeyDelayMilliSeconds]
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-FullScreen] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-RestoreFocus] [-NewWindow] [-ReturnURL]
    [-ReturnOnlyURL] [-NoBorders] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-SideBySide]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set Accept-Language HTTP header  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Open browser in application mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom <int>  
        Bottom position of browser window  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center browser window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Use Google Chrome browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Use Chromium browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session before opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable popup blocker in browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Use Microsoft Edge browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Use Mozilla Firefox browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus browser window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force browser launch or override restrictions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Open browser in full screen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs, f  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Height of browser window in pixels  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Left position of browser window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Target monitor for browser window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open link in a new browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Open browser window without borders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Disable browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Open browser in private/incognito mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to previous window after closing browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        Return only the URL, do not open browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Return the URL after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Right position of browser window  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key after page load  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session-only mode for browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set browser window to foreground  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Top position of browser window  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string>  
        Spotify track ID to lookup lyrics for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Width of browser window in pixels  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistIdsByName 
```PowerShell 

   Get-SpotifyPlaylistIdsByName  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistIdsByName [-PlaylistName] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistName <string[]>  
        One or more Spotify playlist names to search for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistTrack 
```PowerShell 

   Get-SpotifyPlaylistTrack             --> getplaylist  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistTrack [-PlaylistName] <string>
    [<CommonParameters>]
Get-SpotifyPlaylistTrack [-PlaylistId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackAudioFeatures 
```PowerShell 

   Get-SpotifyTrackAudioFeatures        --> audiofeatures  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackAudioFeatures [-TrackId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track to return audio features for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackById 
```PowerShell 

   Get-SpotifyTrackById                 --> gettrack  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackById [-TrackId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string>  
        The Spotify track ID to lookup track information for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyUserPlaylists 
```PowerShell 

   Get-SpotifyUserPlaylists             --> gupl  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyUserPlaylists [[-Filter] <string[]>] [-Force]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Filter <string[]>  
        Wildcard pattern to filter playlists by name  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Uri, Id, Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force fresh data retrieval instead of using cache  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Move-SpotifyLikedTracksToPlaylist 
```PowerShell 

   Move-SpotifyLikedTracksToPlaylist    --> moveliked  
```` 

### SYNTAX 
```PowerShell 
Move-SpotifyLikedTracksToPlaylist [-PlaylistName] <string[]>
    [<CommonParameters>]
Move-SpotifyLikedTracksToPlaylist [-PlaylistId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist ID where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromLiked 
```PowerShell 

   Remove-SpotifyTracksFromLiked        --> dislike  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromLiked [[-TrackId] <string[]>]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string[]>  
        The Spotify track IDs to remove from Liked Songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromPlaylist 
```PowerShell 

   Remove-SpotifyTracksFromPlaylist     --> removefromplaylist  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>]
Remove-SpotifyTracksFromPlaylist [-PlaylistId] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be removed from the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-Spotify 
```PowerShell 

   Search-Spotify                       --> fm, sm  
```` 

### SYNTAX 
```PowerShell 
Search-Spotify [-Queries] <string[]> [[-SearchType] {Album |
    Artist | Playlist | Track | Show | Episode | All}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        The query to perform  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        Type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndEnqueue 
```PowerShell 

   Search-SpotifyAndEnqueue             --> fmq, smq  
```` 

### SYNOPSIS 
    Searches Spotify and adds the first matching item to the playback queue.  

### SYNTAX 
```PowerShell 
Search-SpotifyAndEnqueue [-Queries] <String[]>
    [[-SearchType] {Album | Artist | Playlist | Track | Show
    | Episode | All}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Performs a search on Spotify using specified criteria and automatically adds the  
    first matching result to the current playback queue. Supports searching for  
    tracks, albums, artists, playlists, shows, and episodes.  

### PARAMETERS 
    -Queries <String[]>  
        One or more search phrases to find content on Spotify. Each query is processed  
        sequentially and the first match for each is added to the queue.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SearchType  
        Specifies the type(s) of content to search for. Valid options are:  
        - Track (default)  
        - Album  
        - Artist  
        - Playlist  
        - Show  
        - Episode  
        - All  
        Required?                    false  
        Position?                    2  
        Default value                Track  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndPlay 
```PowerShell 

   Search-SpotifyAndPlay                --> fmp, smp  
```` 

### SYNTAX 
```PowerShell 
Search-SpotifyAndPlay [-Queries] <string[]> [[-SearchType]
    {Album | Artist | Playlist | Track | Show | Episode |
    All}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        One or more search phrases to look for on Spotify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        The type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyActiveDevice 
```PowerShell 

   Set-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyActiveDevice [-DeviceId] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeviceId <string>  
        The Spotify deviceId to transfer playback to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyApiToken 
```PowerShell 

   Set-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyApiToken [-ApiToken] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ApiToken <string>  
        The Spotify API token to cache locally  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyNext 
```PowerShell 

   Set-SpotifyNext                      --> next, skip  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyNext [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPause 
```PowerShell 

   Set-SpotifyPause                     --> pausemusic, togglepausemusic  
```` 

### SYNOPSIS 
    Pauses Spotify playback  

### SYNTAX 
```PowerShell 
Set-SpotifyPause [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Controls Spotify playback by pausing the currently playing track on the active  
    device. If playback is already paused, this command will resume playback.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistDetails 
```PowerShell 

   Set-SpotifyPlaylistDetails           --> spld  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistDetails [-PlaylistId] <string> [-Name]
    <string> [[-Description] <string>] [-Public]
    [-Collabrative] [-Private] [-NoCollabrations] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Collabrative  
        Allow others to make changes to this playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        The description for the new playlist  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name for the new playlist  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoCollabrations  
        Disallow others to make changes  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist to make changes to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Make the playlist private  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Public  
        Make this a public playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistOrder 
```PowerShell 

   Set-SpotifyPlaylistOrder  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistOrder [-PlaylistId] <string>
    [-RangeStart] <int> [-InsertBefore] <int>
    [[-RangeLength] <int>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InsertBefore <int>  
        The position where tracks should be inserted  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist identifier to modify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeLength <int>  
        Number of consecutive tracks to move (defaults to 1)  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeStart <int>  
        The position of the first track to move  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPrevious 
```PowerShell 

   Set-SpotifyPrevious                  --> prev, previous  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPrevious [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatContext 
```PowerShell 

   Set-SpotifyRepeatContext             --> repeat  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatContext [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatOff 
```PowerShell 

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatSong 
```PowerShell 

   Set-SpotifyRepeatSong                --> repeatsong  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatSong [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOff 
```PowerShell 

   Set-SpotifyShuffleOff                --> noshuffle, shuffleoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOn 
```PowerShell 

   Set-SpotifyShuffleOn                 --> shuffle, shuffleon  
```` 

### SYNOPSIS 
    Enables Spotify song-shuffle mode.  

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOn [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### DESCRIPTION 
    Enables shuffle mode on the currently active Spotify playback device. This  
    function requires a valid Spotify API token and an active playback session.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStart 
```PowerShell 

   Set-SpotifyStart                     --> play, startmusic  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStart [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStop 
```PowerShell 

   Set-SpotifyStop                      --> stop  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStop [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Vlc<hr/> 

##	Open-VlcMediaPlayer 
```PowerShell 

   Open-VlcMediaPlayer                  --> vlc  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayer [[-Path] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>]
    [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-NoBorders] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-FullScreen] [-PassThru] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string[]>  
        The media file(s) or URL(s) to open in VLC  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus after opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-VlcMediaPlayerLyrics 
```PowerShell 

   Open-VlcMediaPlayerLyrics            --> vlclyrics  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayerLyrics [[-Queries] <string[]>]
    [[-EndPoint] {Bing | Github | Google | Youtube}]
    [[-Language] {Afrikaans | Akan | Albanian | Amharic |
    Arabic | Armenian | Azerbaijani | Basque | Belarusian |
    Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian |
    Breton | Bulgarian | Cambodian | Catalan | Cherokee |
    Chichewa | Chinese (Simplified) | Chinese (Traditional)
    | Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-Monitor <int>] [-Width <int>] [-Height
    <int>] [-X <int>] [-Y <int>] [-AcceptLang <string>]
    [-KeysToSend <string[]>] [-SendKeyDelayMilliSeconds
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-All] [-ShowWindow] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-SetRestored] [-RestoreFocus] [-NewWindow]
    [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [-SideBySide] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set the browser accept-lang http header  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -All  
        Opens in all registered modern browsers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Hide the browser controls  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place browser window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place browser window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Opens in Google Chrome  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session data before opening the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable the popup blocker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Opens in Microsoft Edge  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EndPoint <string>  
        The endpoint to invoke the query on  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Opens in Firefox  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the browser window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force enable debugging port, stopping existing browsers if needed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Language <string>  
        The language of the returned search results  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place browser window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Do not re-use existing browser window, instead, create a new one  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders from the browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Prevent loading of browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns a [System.Diagnostics.Process] object of the browserprocess  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Opens in incognito/private browsing mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        Search terms to find a track  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        After opening webbrowser, return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Do not open webbrowser, just return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place browser window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between sending different key sequences in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Prevent returning keyboard focus to PowerShell after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Send Shift+Enter instead of regular Enter for line breaks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use a session that is not persisted after closing the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the browser window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Opens in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser windows side by side  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using any existing browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place browser window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerNextInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerNextInPlaylist   --> vlcnext  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerNextInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerPreviousInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerPreviousInPlaylist --> vlcback, vlcprev  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerPreviousInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerMute 
```PowerShell 

   Switch-VlcMediaPlayerMute            --> vlcmute, vlcunmute  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerMute [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VLCMediaPlayerPaused 
```PowerShell 

   Switch-VLCMediaPlayerPaused          --> vlcpause, vlcplay  
```` 

### SYNTAX 
```PowerShell 
Switch-VLCMediaPlayerPaused [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerRepeat 
```PowerShell 

   Switch-VlcMediaPlayerRepeat          --> vlcrepeat  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerRepeat [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console<hr/> 

##	Enable-Screensaver 
```PowerShell 

   Enable-Screensaver  
```` 

### SYNTAX 
```PowerShell 
Enable-Screensaver [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-IsSpeaking 
```PowerShell 

   Get-IsSpeaking                       --> iss  
```` 

### SYNTAX 
```PowerShell 
Get-IsSpeaking [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	New-MicrosoftShellTab 
```PowerShell 

   New-MicrosoftShellTab                --> x  
```` 

### SYNTAX 
```PowerShell 
New-MicrosoftShellTab [-DontCloseThisTab] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DontCloseThisTab  
        Keep current tab open after creating new tab  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Now 
```PowerShell 

   Now  
```` 

### SYNTAX 
```PowerShell 
Now [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-MediaFile 
```PowerShell 

   Open-MediaFile                       --> findmedia, media, vlcmedia  
```` 

### SYNTAX 
```PowerShell 
Open-MediaFile [[-Name] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>]
    [-InputObject <Object>] [-PlaylistPath <string>]
    [-KeysToSend <string[]>] [-MaxDegreeOfParallelism <int>]
    [-TimeoutSeconds <int>] [-SendKeyEscape]
    [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds
    <int>] [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-AllDrives] [-IncludeAlternateFileStreams] [-NoRecurse]
    [-FollowSymlinkAndJunctions] [-IncludeOpticalDiskDrives]
    [-SearchDrives <string[]>] [-DriveLetter <char[]>]
    [-Root <string[]>] [-OnlyVideos] [-OnlyAudio]
    [-OnlyPictures] [-IncludeVideos] [-IncludeAudio]
    [-IncludePictures] [-NoBorders] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-FullScreen] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [-CaseNameMatching {PlatformDefault |
    CaseSensitive | CaseInsensitive}] [-MaxRecursionDepth
    <int>] [-MaxFileSize <long>] [-MinFileSize <long>]
    [-ModifiedAfter <datetime>] [-ModifiedBefore <datetime>]
    [-AttributesToSkip {None | ReadOnly | Hidden | System |
    Directory | Archive | Device | Normal | Temporary |
    SparseFile | ReparsePoint | Compressed | Offline |
    NotContentIndexed | Encrypted | IntegrityStream |
    NoScrubData}] [-Exclude <string[]>] [-PassThru]
    [-PassThruNoOpen] [-PassThruWindow] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AllDrives  
        Search across all available drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AttributesToSkip <FileAttributes>  
        File attributes to skip (e.g., System, Hidden or None).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skipattr  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -CaseNameMatching <MatchCasing>  
        Gets or sets the case-sensitivity for files and directories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      casing, CaseSearchMaskMatching  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DriveLetter <char[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Exclude <string[]>  
        Exclude files or directories matching these wildcard patterns (e.g., *.tmp, *\\bin\\*).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      skiplike  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FollowSymlinkAndJunctions  
        Follow symlinks and junctions during directory traversal  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      symlinks, sl  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAlternateFileStreams  
        Include alternate data streams in search results  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeAudio  
        Additionally include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeOpticalDiskDrives  
        Include optical disk drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludePictures  
        Additionally include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IncludeVideos  
        Additionally include videos in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InputObject <Object>  
        File name or pattern to search for from pipeline input. Default is "*"  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      FullName  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxDegreeOfParallelism <int>  
        Maximum degree of parallelism for directory tasks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      threads  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxFileSize <long>  
        Maximum file size in bytes to include in results. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxlength, maxsize  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MaxRecursionDepth <int>  
        Maximum recursion depth for directory traversal. 0 means unlimited.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      md, depth, maxdepth  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -MinFileSize <long>  
        Minimum file size in bytes to include in results. 0 means no minimum.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      minsize, minlength  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedAfter <datetime>  
        Only include files modified after this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ma, after  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ModifiedBefore <datetime>  
        Only include files modified before this date/time (UTC).  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      before, mb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string[]>  
        File name or pattern to search for. Default is '*'  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      like, Path, LiteralPath, Query, SearchMask, Include  
        Dynamic?                     false  
        Accept wildcard characters?  true  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoRecurse  
        Do not recurse into subdirectories  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyAudio  
        Only include audio files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyPictures  
        Only include pictures in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -OnlyVideos  
        Only include video files in the playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the files found by the search  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruNoOpen  
        Returns the files found by the search without opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThruWindow  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistPath <string>  
        Playlist path to save the media files to. If not specified, the playlist will be saved in a temporary directory.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restores PowerShell window focus after opening VLC.  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Root <string[]>  
        Optional: search specific base folders combined with provided Names  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchDrives <string[]>  
        Optional: search specific drives  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      drives  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TimeoutSeconds <int>  
        Optional: cancellation timeout in seconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      maxseconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayDate 
```PowerShell 

   SayDate  
```` 

### SYNTAX 
```PowerShell 
SayDate [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	SayTime 
```PowerShell 

   SayTime  
```` 

### SYNTAX 
```PowerShell 
SayTime [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent 
```PowerShell 

   Set-LocationParent                   --> ..  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent2 
```PowerShell 

   Set-LocationParent2                  --> ...  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent2 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent3 
```PowerShell 

   Set-LocationParent3                  --> ....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent3 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent4 
```PowerShell 

   Set-LocationParent4                  --> .....  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent4 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-LocationParent5 
```PowerShell 

   Set-LocationParent5                  --> ......  
```` 

### SYNTAX 
```PowerShell 
Set-LocationParent5 [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOff 
```PowerShell 

   Set-MonitorPowerOff                  --> poweroff  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-MonitorPowerOn 
```PowerShell 

   Set-MonitorPowerOn                   --> monitoroff, wakemonitor  
```` 

### SYNTAX 
```PowerShell 
Set-MonitorPowerOn [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-VLCPlayerFocused 
```PowerShell 

   Set-VLCPlayerFocused                 --> fvlc, showvlc, vlcf  
```` 

### SYNTAX 
```PowerShell 
Set-VLCPlayerFocused [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-TextToSpeech 
```PowerShell 

   Start-TextToSpeech                   --> say  
```` 

### SYNTAX 
```PowerShell 
Start-TextToSpeech [-Lines] <string[]> [-Locale <string>]
    [-VoiceName <string>] [-PassThru] [-Wait] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Lines <string[]>  
        Text to be spoken  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue)  
        Parameter set name           strings  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Locale <string>  
        The language locale id to use, e.g. 'en-US'  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Output the text being spoken to the pipeline  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VoiceName <string>  
        Name of the voice to use for speech  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Wait  
        Wait for speech to complete before continuing  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Stop-TextToSpeech 
```PowerShell 

   Stop-TextToSpeech                    --> sst  
```` 

### SYNOPSIS 
    Immediately stops any ongoing text-to-speech output.  

### SYNTAX 
```PowerShell 
Stop-TextToSpeech [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Halts all active and queued speech synthesis by canceling both standard and  
    customized speech operations. This provides an immediate silence for any ongoing  
    text-to-speech activities.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
```PowerShell 

       This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)  
       and Skip-TextToSpeech (alias: sstSkip) for speech control.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Stop-TextToSpeech  
   Immediately stops any ongoing speech  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> say "Hello world"; sst  
   Starts speaking but gets interrupted immediately  
```` 

<br/><hr/><br/>
 

##	UtcNow 
```PowerShell 

   UtcNow  
```` 

### SYNTAX 
```PowerShell 
UtcNow [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/> 

##	Add-SpotifyNewPlaylist 
```PowerShell 

   Add-SpotifyNewPlaylist               --> newplaylist  
```` 

### SYNOPSIS 
    Creates a new Spotify playlist with customizable settings.  

### SYNTAX 
```PowerShell 
Add-SpotifyNewPlaylist [-Name] <String> [[-Description]
    <String>] [-Public] [-Collabrative] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Creates a new Spotify playlist with the specified name, description, and privacy  
    settings. The function authenticates with Spotify, creates the playlist, and  
    updates the local playlist cache.  

### PARAMETERS 
    -Name <String>  
        The name for the new playlist. This will be visible to users who can access the  
        playlist.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        An optional description for the playlist that provides additional context about  
        its contents or purpose.  
        Required?                    false  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Public [<SwitchParameter>]  
        When specified, makes the playlist publicly visible to other Spotify users.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Collabrative [<SwitchParameter>]  
        When specified, allows other users to modify the playlist contents.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToLiked 
```PowerShell 

   Add-SpotifyTracksToLiked             --> like  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToLiked [[-TrackId] <string[]>]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track IDs to add to liked songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Add-SpotifyTracksToPlaylist 
```PowerShell 

   Add-SpotifyTracksToPlaylist          --> addtoplaylist  
```` 

### SYNTAX 
```PowerShell 
Add-SpotifyTracksToPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [<CommonParameters>]
Add-SpotifyTracksToPlaylist [-PlaylistId] <string[]> [[-Uri]
    <string[]>] [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to add tracks to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be added to the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Connect-SpotifyApiToken 
```PowerShell 

   Connect-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Connect-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyActiveDevice 
```PowerShell 

   Get-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyActiveDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyApiToken 
```PowerShell 

   Get-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyApiToken [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyCurrentlyPlaying 
```PowerShell 

   Get-SpotifyCurrentlyPlaying          --> gcp  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyCurrentlyPlaying [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyDevice 
```PowerShell 

   Get-SpotifyDevice  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyDevice [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLikedTrack 
```PowerShell 

   Get-SpotifyLikedTrack                --> liked  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLikedTrack [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyLyrics 
```PowerShell 

   Get-SpotifyLyrics                    --> lyrics  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyLyrics [[-TrackId] <string>] [[-Monitor] <int>]
    [[-Width] <int>] [[-Height] <int>] [[-Left] <int>]
    [[-Right] <int>] [[-Top] <int>] [[-Bottom] <int>]
    [[-AcceptLang] <string>] [[-SendKeyDelayMilliSeconds]
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-FullScreen] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-RestoreFocus] [-NewWindow] [-ReturnURL]
    [-ReturnOnlyURL] [-NoBorders] [-SessionOnly]
    [-ClearSession] [-SkipSession] [-SideBySide]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set Accept-Language HTTP header  
        Required?                    false  
        Position?                    8  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Open browser in application mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom <int>  
        Bottom position of browser window  
        Required?                    false  
        Position?                    7  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Center browser window on screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Use Google Chrome browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Use Chromium browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session before opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable popup blocker in browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Use Microsoft Edge browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Use Mozilla Firefox browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus browser window after launch  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force browser launch or override restrictions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Open browser in full screen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs, f  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        Height of browser window in pixels  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left <int>  
        Left position of browser window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        Target monitor for browser window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open link in a new browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Open browser window without borders  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Disable browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Open browser in private/incognito mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore focus to previous window after closing browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        Return only the URL, do not open browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Return the URL after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right <int>  
        Right position of browser window  
        Required?                    false  
        Position?                    5  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay in milliseconds between sending keys  
        Required?                    false  
        Position?                    9  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Send Escape key after page load  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use session-only mode for browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set browser window to foreground  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser side by side with other windows  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top <int>  
        Top position of browser window  
        Required?                    false  
        Position?                    6  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string>  
        Spotify track ID to lookup lyrics for  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        Width of browser window in pixels  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistIdsByName 
```PowerShell 

   Get-SpotifyPlaylistIdsByName  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistIdsByName [-PlaylistName] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistName <string[]>  
        One or more Spotify playlist names to search for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyPlaylistTrack 
```PowerShell 

   Get-SpotifyPlaylistTrack             --> getplaylist  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyPlaylistTrack [-PlaylistName] <string>
    [<CommonParameters>]
Get-SpotifyPlaylistTrack [-PlaylistId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string>  
        The Spotify playlist to return tracks for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackAudioFeatures 
```PowerShell 

   Get-SpotifyTrackAudioFeatures        --> audiofeatures  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackAudioFeatures [-TrackId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string[]>  
        The Spotify track to return audio features for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyTrackById 
```PowerShell 

   Get-SpotifyTrackById                 --> gettrack  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyTrackById [-TrackId] <string>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -TrackId <string>  
        The Spotify track ID to lookup track information for  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Get-SpotifyUserPlaylists 
```PowerShell 

   Get-SpotifyUserPlaylists             --> gupl  
```` 

### SYNTAX 
```PowerShell 
Get-SpotifyUserPlaylists [[-Filter] <string[]>] [-Force]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Filter <string[]>  
        Wildcard pattern to filter playlists by name  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Uri, Id, Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force fresh data retrieval instead of using cache  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Move-SpotifyLikedTracksToPlaylist 
```PowerShell 

   Move-SpotifyLikedTracksToPlaylist    --> moveliked  
```` 

### SYNTAX 
```PowerShell 
Move-SpotifyLikedTracksToPlaylist [-PlaylistName] <string[]>
    [<CommonParameters>]
Move-SpotifyLikedTracksToPlaylist [-PlaylistId] <string[]>
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -PlaylistId <string[]>  
        The Spotify playlist ID where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ById  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist where all liked tracks should move to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           ByName  
        Aliases                      Name  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromLiked 
```PowerShell 

   Remove-SpotifyTracksFromLiked        --> dislike  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromLiked [[-TrackId] <string[]>]
    [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -TrackId <string[]>  
        The Spotify track IDs to remove from Liked Songs  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Remove-SpotifyTracksFromPlaylist 
```PowerShell 

   Remove-SpotifyTracksFromPlaylist     --> removefromplaylist  
```` 

### SYNTAX 
```PowerShell 
Remove-SpotifyTracksFromPlaylist [-PlaylistName] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>]
Remove-SpotifyTracksFromPlaylist [-PlaylistId] <string[]>
    [[-Uri] <string[]>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ById  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistName <string[]>  
        The Spotify playlist to delete tracks from  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           ByName  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Uri <string[]>  
        The Spotify tracks that should be removed from the playlist  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-Spotify 
```PowerShell 

   Search-Spotify                       --> fm, sm  
```` 

### SYNTAX 
```PowerShell 
Search-Spotify [-Queries] <string[]> [[-SearchType] {Album |
    Artist | Playlist | Track | Show | Episode | All}]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        The query to perform  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        Type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndEnqueue 
```PowerShell 

   Search-SpotifyAndEnqueue             --> fmq, smq  
```` 

### SYNOPSIS 
    Searches Spotify and adds the first matching item to the playback queue.  

### SYNTAX 
```PowerShell 
Search-SpotifyAndEnqueue [-Queries] <String[]>
    [[-SearchType] {Album | Artist | Playlist | Track | Show
    | Episode | All}] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Performs a search on Spotify using specified criteria and automatically adds the  
    first matching result to the current playback queue. Supports searching for  
    tracks, albums, artists, playlists, shows, and episodes.  

### PARAMETERS 
    -Queries <String[]>  
        One or more search phrases to find content on Spotify. Each query is processed  
        sequentially and the first match for each is added to the queue.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SearchType  
        Specifies the type(s) of content to search for. Valid options are:  
        - Track (default)  
        - Album  
        - Artist  
        - Playlist  
        - Show  
        - Episode  
        - All  
        Required?                    false  
        Position?                    2  
        Default value                Track  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Search-SpotifyAndPlay 
```PowerShell 

   Search-SpotifyAndPlay                --> fmp, smp  
```` 

### SYNTAX 
```PowerShell 
Search-SpotifyAndPlay [-Queries] <string[]> [[-SearchType]
    {Album | Artist | Playlist | Track | Show | Episode |
    All}] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Queries <string[]>  
        One or more search phrases to look for on Spotify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SearchType <SearchRequest+Types>  
        The type of content to search for  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      t  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyActiveDevice 
```PowerShell 

   Set-SpotifyActiveDevice  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyActiveDevice [-DeviceId] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeviceId <string>  
        The Spotify deviceId to transfer playback to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      Id  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyApiToken 
```PowerShell 

   Set-SpotifyApiToken  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyApiToken [-ApiToken] <string> [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -ApiToken <string>  
        The Spotify API token to cache locally  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyNext 
```PowerShell 

   Set-SpotifyNext                      --> next, skip  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyNext [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPause 
```PowerShell 

   Set-SpotifyPause                     --> pausemusic, togglepausemusic  
```` 

### SYNOPSIS 
    Pauses Spotify playback  

### SYNTAX 
```PowerShell 
Set-SpotifyPause [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### DESCRIPTION 
    Controls Spotify playback by pausing the currently playing track on the active  
    device. If playback is already paused, this command will resume playback.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistDetails 
```PowerShell 

   Set-SpotifyPlaylistDetails           --> spld  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistDetails [-PlaylistId] <string> [-Name]
    <string> [[-Description] <string>] [-Public]
    [-Collabrative] [-Private] [-NoCollabrations] [-WhatIf]
    [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Collabrative  
        Allow others to make changes to this playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Description <string>  
        The description for the new playlist  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Name <string>  
        The name for the new playlist  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoCollabrations  
        Disallow others to make changes  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist to make changes to  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Make the playlist private  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Public  
        Make this a public playlist  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPlaylistOrder 
```PowerShell 

   Set-SpotifyPlaylistOrder  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPlaylistOrder [-PlaylistId] <string>
    [-RangeStart] <int> [-InsertBefore] <int>
    [[-RangeLength] <int>] [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -InsertBefore <int>  
        The position where tracks should be inserted  
        Required?                    true  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlaylistId <string>  
        The Spotify playlist identifier to modify  
        Required?                    true  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeLength <int>  
        Number of consecutive tracks to move (defaults to 1)  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RangeStart <int>  
        The position of the first track to move  
        Required?                    true  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyPrevious 
```PowerShell 

   Set-SpotifyPrevious                  --> prev, previous  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyPrevious [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatContext 
```PowerShell 

   Set-SpotifyRepeatContext             --> repeat  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatContext [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatOff 
```PowerShell 

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyRepeatSong 
```PowerShell 

   Set-SpotifyRepeatSong                --> repeatsong  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyRepeatSong [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOff 
```PowerShell 

   Set-SpotifyShuffleOff                --> noshuffle, shuffleoff  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOff [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyShuffleOn 
```PowerShell 

   Set-SpotifyShuffleOn                 --> shuffle, shuffleon  
```` 

### SYNOPSIS 
    Enables Spotify song-shuffle mode.  

### SYNTAX 
```PowerShell 
Set-SpotifyShuffleOn [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### DESCRIPTION 
    Enables shuffle mode on the currently active Spotify playback device. This  
    function requires a valid Spotify API token and an active playback session.  

### PARAMETERS 
    -WhatIf [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStart 
```PowerShell 

   Set-SpotifyStart                     --> play, startmusic  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStart [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Set-SpotifyStop 
```PowerShell 

   Set-SpotifyStop                      --> stop  
```` 

### SYNTAX 
```PowerShell 
Set-SpotifyStop [-WhatIf] [-Confirm] [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Vlc<hr/> 

##	Open-VlcMediaPlayer 
```PowerShell 

   Open-VlcMediaPlayer                  --> vlc  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayer [[-Path] <string[]>] [[-Width] <int>]
    [[-Height] <int>] [[-X] <int>] [[-Y] <int>] [-KeysToSend
    <string[]>] [-SendKeyEscape] [-SendKeyUseShiftEnter]
    [-SendKeyDelayMilliSeconds <int>]
    [-SendKeyHoldKeyboardFocus] [-Monitor <int>]
    [-AspectRatio <string>] [-Crop <string>] [-SubtitleFile
    <string>] [-SubtitleScale <int>] [-SubtitleLanguage
    {Afrikaans | Akan | Albanian | Amharic | Arabic |
    Armenian | Azerbaijani | Basque | Belarusian | Bemba |
    Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton
    | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa
    | Chinese (Simplified) | Chinese (Traditional) |
    Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-AudioLanguage {Afrikaans | Akan |
    Albanian | Amharic | Arabic | Armenian | Azerbaijani |
    Basque | Belarusian | Bemba | Bengali | Bihari | Bork,
    bork, bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}]
    [-PreferredAudioLanguage {Afrikaans | Akan | Albanian |
    Amharic | Arabic | Armenian | Azerbaijani | Basque |
    Belarusian | Bemba | Bengali | Bihari | Bork, bork,
    bork! | Bosnian | Breton | Bulgarian | Cambodian |
    Catalan | Cherokee | Chichewa | Chinese (Simplified) |
    Chinese (Traditional) | Corsican | Croatian | Czech |
    Danish | Dutch | Elmer Fudd | English | Esperanto |
    Estonian | Ewe | Faroese | Filipino | Finnish | French |
    Frisian | Ga | Galician | Georgian | German | Greek |
    Guarani | Gujarati | Hacker | Haitian Creole | Hausa |
    Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo
    | Indonesian | Interlingua | Irish | Italian | Japanese
    | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi |
    Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish
    | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian
    | Lingala | Lithuanian | Lozi | Luganda | Luo |
    Macedonian | Malagasy | Malay | Malayalam | Maltese |
    Maori | Marathi | Mauritian Creole | Moldavian |
    Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
    Northern Sotho | Norwegian | Norwegian (Nynorsk) |
    Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
    Polish | Portuguese (Brazil) | Portuguese (Portugal) |
    Punjabi | Quechua | Romanian | Romansh | Runyakitara |
    Russian | Scots Gaelic | Serbian | Serbo-Croatian |
    Sesotho | Setswana | Seychellois Creole | Shona | Sindhi
    | Sinhalese | Slovak | Slovenian | Somali | Spanish |
    Spanish (Latin American) | Sundanese | Swahili | Swedish
    | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya |
    Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi |
    Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh |
    Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-HttpProxy
    <string>] [-HttpProxyPassword <string>] [-VerbosityLevel
    <int>] [-SubdirectoryBehavior {None | Collapse |
    Expand}] [-IgnoredExtensions <string>] [-VLCPath
    <string>] [-ReplayGainMode {None | Track | Album}]
    [-ReplayGainPreamp <float>] [-ForceDolbySurround {Auto |
    On | Off}] [-AudioFilters <string[]>] [-Visualization
    {None | Goom | ProjectM | Visual | GLSpectrum}]
    [-Deinterlace {Off | Automatic | On}] [-DeinterlaceMode
    {Auto | Discard | Blend | Mean | Bob | Linear | X |
    Yadif | Yadif2x | Phosphor | IVTC}] [-VideoFilters
    <string[]>] [-VideoFilterModules <string[]>] [-Modules
    <string[]>] [-AudioFilterModules <string[]>]
    [-AudioVisualization {None | Goom | ProjectM | Visual |
    GLSpectrum}] [-PreferredSubtitleLanguage <string>]
    [-IgnoredFileExtensions <string>] [-Arguments <string>]
    [-NoBorders] [-Left] [-Right] [-Top] [-Bottom]
    [-Centered] [-FullScreen] [-PassThru] [-AlwaysOnTop]
    [-Random] [-Loop] [-Repeat] [-StartPaused]
    [-PlayAndExit] [-DisableAudio] [-DisableSubtitles]
    [-AutoScale] [-HighPriority] [-EnableTimeStretch]
    [-NewWindow] [-EnableWallpaperMode]
    [-EnableAudioTimeStretch] [-Close] [-SideBySide]
    [-FocusWindow] [-SetForeground] [-Maximize]
    [-RestoreFocus] [-SessionOnly] [-ClearSession]
    [-SkipSession] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AlwaysOnTop  
        Always on top  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Arguments <string>  
        Additional arguments  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AspectRatio <string>  
        Source aspect ratio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilterModules <string[]>  
        Audio filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioFilters <string[]>  
        Audio filters  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioLanguage <string>  
        Audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AudioVisualization <string>  
        Audio visualization mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -AutoScale  
        Video Auto Scaling  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Close  
        Close the VLC media player window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Crop <string>  
        Video cropping  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Deinterlace <string>  
        Deinterlace  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DeinterlaceMode <string>  
        Deinterlace mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableAudio  
        Disable audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisableSubtitles  
        Disable subtitles  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch  
        Enable audio time stretching  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableTimeStretch  
        Enable time stretching audio  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EnableWallpaperMode  
        Enable video wallpaper mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the VLC window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ForceDolbySurround <string>  
        Force detection of Dolby Surround  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Sends F11 to the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the window  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HighPriority  
        Increase the priority of the process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxy <string>  
        HTTP proxy  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -HttpProxyPassword <string>  
        HTTP proxy password  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredExtensions <string>  
        Ignored extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <string>  
        Ignored file extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the VLC Player Window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       true (ByPropertyName)  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Loop  
        Repeat all  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Modules <string[]>  
        Modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Open new VLC mediaplayer instance  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes the borders of the window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns the window helper for each process  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Path <string[]>  
        The media file(s) or URL(s) to open in VLC  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PlayAndExit  
        Play and exit  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <string>  
        Preferred audio language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <string>  
        Preferred subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Random  
        Play files randomly forever  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Shuffle  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Repeat  
        Repeat current item  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainMode <string>  
        Replay gain mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReplayGainPreamp <float>  
        Replay gain preamp  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus after opening VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between different input strings in milliseconds when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters and modifiers when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Hold keyboard focus on the VLC window after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Use Shift+Enter instead of Enter when sending keys to VLC  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use alternative settings stored in session for AI preferences  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the VLC window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Will either set the window fullscreen on a different monitor than Powershell, or side by side with Powershell on the same monitor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Store settings only in persistent preferences without affecting session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -StartPaused  
        Start paused  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <string>  
        Subdirectory behavior  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleFile <string>  
        Use subtitle file  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleLanguage <string>  
        Subtitle language  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SubtitleScale <int>  
        Subtitles text scaling factor  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VLCPath <string>  
        Path to VLC executable  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VerbosityLevel <int>  
        Verbosity level  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilterModules <string[]>  
        Video filter modules  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -VideoFilters <string[]>  
        Video filter module  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Visualization <string>  
        Audio visualizations  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the window  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the window  
        Required?                    false  
        Position?                    3  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the window  
        Required?                    false  
        Position?                    4  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Open-VlcMediaPlayerLyrics 
```PowerShell 

   Open-VlcMediaPlayerLyrics            --> vlclyrics  
```` 

### SYNTAX 
```PowerShell 
Open-VlcMediaPlayerLyrics [[-Queries] <string[]>]
    [[-EndPoint] {Bing | Github | Google | Youtube}]
    [[-Language] {Afrikaans | Akan | Albanian | Amharic |
    Arabic | Armenian | Azerbaijani | Basque | Belarusian |
    Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian |
    Breton | Bulgarian | Cambodian | Catalan | Cherokee |
    Chichewa | Chinese (Simplified) | Chinese (Traditional)
    | Corsican | Croatian | Czech | Danish | Dutch | Elmer
    Fudd | English | Esperanto | Estonian | Ewe | Faroese |
    Filipino | Finnish | French | Frisian | Ga | Galician |
    Georgian | German | Greek | Guarani | Gujarati | Hacker
    | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi |
    Hungarian | Icelandic | Igbo | Indonesian | Interlingua
    | Irish | Italian | Japanese | Javanese | Kannada |
    Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo |
    Korean | Krio (Sierra Leone) | Kurdish | Kurdish
    (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala
    | Lithuanian | Lozi | Luganda | Luo | Macedonian |
    Malagasy | Malay | Malayalam | Maltese | Maori | Marathi
    | Mauritian Creole | Moldavian | Mongolian | Montenegrin
    | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian
    | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto
    | Persian | Pirate | Polish | Portuguese (Brazil) |
    Portuguese (Portugal) | Punjabi | Quechua | Romanian |
    Romansh | Runyakitara | Russian | Scots Gaelic | Serbian
    | Serbo-Croatian | Sesotho | Setswana | Seychellois
    Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian
    | Somali | Spanish | Spanish (Latin American) |
    Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar |
    Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka |
    Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu |
    Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish |
    Yoruba | Zulu}] [-Monitor <int>] [-Width <int>] [-Height
    <int>] [-X <int>] [-Y <int>] [-AcceptLang <string>]
    [-KeysToSend <string[]>] [-SendKeyDelayMilliSeconds
    <int>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]
    [-Firefox] [-All] [-ShowWindow] [-Left] [-Right] [-Top]
    [-Bottom] [-Centered] [-ApplicationMode]
    [-NoBrowserExtensions] [-DisablePopupBlocker]
    [-SendKeyEscape] [-SendKeyHoldKeyboardFocus]
    [-SendKeyUseShiftEnter] [-FocusWindow] [-SetForeground]
    [-Maximize] [-SetRestored] [-RestoreFocus] [-NewWindow]
    [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders]
    [-SessionOnly] [-ClearSession] [-SkipSession]
    [-SideBySide] [<CommonParameters>] 
```` 

### PARAMETERS 
    -AcceptLang <string>  
        Set the browser accept-lang http header  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      lang, locale  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -All  
        Opens in all registered modern browsers  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ApplicationMode  
        Hide the browser controls  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      a, app, appmode  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Bottom  
        Place browser window on the bottom side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Centered  
        Place browser window in the center of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chrome  
        Opens in Google Chrome  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ch  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Chromium  
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      c  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ClearSession  
        Clear browser session data before opening the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -DisablePopupBlocker  
        Disable the popup blocker  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      allowpopups  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Edge  
        Opens in Microsoft Edge  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      e  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -EndPoint <string>  
        The endpoint to invoke the query on  
        Required?                    false  
        Position?                    1  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Firefox  
        Opens in Firefox  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      ff  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FocusWindow  
        Focus the browser window after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fw, focus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Force  
        Force enable debugging port, stopping existing browsers if needed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Height <int>  
        The initial height of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -KeysToSend <string[]>  
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Language <string>  
        The language of the returned search results  
        Required?                    false  
        Position?                    2  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Left  
        Place browser window on the left side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Maximize  
        Maximize the window after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Monitor <int>  
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      m, mon  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NewWindow  
        Do not re-use existing browser window, instead, create a new one  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nw, new  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBorders  
        Removes window borders from the browser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      nb  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -NoBrowserExtensions  
        Prevent loading of browser extensions  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      de, ne, NoExtensions  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -PassThru  
        Returns a [System.Diagnostics.Process] object of the browserprocess  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      pt  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Private  
        Opens in incognito/private browsing mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      incognito, inprivate  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Queries <string[]>  
        Search terms to find a track  
        Required?                    false  
        Position?                    0  
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)  
        Parameter set name           (All)  
        Aliases                      q, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      rf, bg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnOnlyURL  
        After opening webbrowser, return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ReturnURL  
        Do not open webbrowser, just return the url  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Right  
        Place browser window on the right side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyDelayMilliSeconds <int>  
        Delay between sending different key sequences in milliseconds  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      DelayMilliSeconds  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyEscape  
        Escape control characters when sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      Escape  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyHoldKeyboardFocus  
        Prevent returning keyboard focus to PowerShell after sending keys  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      HoldKeyboardFocus  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SendKeyUseShiftEnter  
        Send Shift+Enter instead of regular Enter for line breaks  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      UseShiftEnter  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SessionOnly  
        Use a session that is not persisted after closing the browser  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetForeground  
        Set the browser window to foreground after opening  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fg  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SetRestored  
        Restore the window to normal state after positioning  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -ShowWindow  
        Opens in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sw  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SideBySide  
        Open browser windows side by side  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      sbs  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -SkipSession  
        Skip using any existing browser session  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      FromPreferences  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Top  
        Place browser window on the top side of the screen  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Width <int>  
        The initial width of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -X <int>  
        The initial X position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -Y <int>  
        The initial Y position of the webbrowser window  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerNextInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerNextInPlaylist   --> vlcnext  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerNextInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Start-VlcMediaPlayerPreviousInPlaylist 
```PowerShell 

   Start-VlcMediaPlayerPreviousInPlaylist --> vlcback, vlcprev  
```` 

### SYNTAX 
```PowerShell 
Start-VlcMediaPlayerPreviousInPlaylist [-WhatIf] [-Confirm]
    [<CommonParameters>] 
```` 

### PARAMETERS 
    -Confirm  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      cf  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -WhatIf  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      wi  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerMute 
```PowerShell 

   Switch-VlcMediaPlayerMute            --> vlcmute, vlcunmute  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerMute [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VLCMediaPlayerPaused 
```PowerShell 

   Switch-VLCMediaPlayerPaused          --> vlcpause, vlcplay  
```` 

### SYNTAX 
```PowerShell 
Switch-VLCMediaPlayerPaused [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
 

##	Switch-VlcMediaPlayerRepeat 
```PowerShell 

   Switch-VlcMediaPlayerRepeat          --> vlcrepeat  
```` 

### SYNTAX 
```PowerShell 
Switch-VlcMediaPlayerRepeat [<CommonParameters>] 
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><br/>
