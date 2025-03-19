<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Console
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Console?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ text-to-speech
    * ✅ spotify control
    * ✅ microsoft Shell helpers
    * ✅ after installation, use 'cmds' to see full list of installed GenXdev cmdslets

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.Console"
Import-Module "GenXdev.Console"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Console<hr/>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Enable-Screensaver](#Enable-Screensaver) |  | Starts the configured Windows screensaver. |
| [Get-IsSpeaking](#Get-IsSpeaking) | iss | Returns true if the text-to-speech engine is speaking. |
| [New-MicrosoftShellTab](#New-MicrosoftShellTab) | x | Creates a new Windows Terminal tab running PowerShell. |
| [Now](#Now) |  | Returns the current system date and time as a DateTime object. |
| [Open-MediaFile](#Open-MediaFile) | vlcmedia, media | Plays media files using VLC player with flexible filtering options. |
| [SayDate](#SayDate) |  | Speaks the current date using text-to-speech synthesis. |
| [SayTime](#SayTime) |  | Announces the current time using text-to-speech. |
| [Set-LocationParent](#Set-LocationParent) | .. | Changes the current location to the parent directory and lists its contents. |
| [Set-LocationParent2](#Set-LocationParent2) | ... | Navigates up two directory levels in the file system hierarchy. |
| [Set-LocationParent3](#Set-LocationParent3) |  | Navigates up three directory levels in the file system hierarchy. |
| [Set-LocationParent4](#Set-LocationParent4) | ..... | Navigates up four directory levels in the filesystem hierarchy. |
| [Set-LocationParent5](#Set-LocationParent5) |  | Navigates up five directory levels in the file system hierarchy. |
| [Set-MonitorPowerOff](#Set-MonitorPowerOff) | poweroff | Turns off power to all connected monitors. |
| [Set-MonitorPowerOn](#Set-MonitorPowerOn) | wake-monitor | Turns the monitor power on. |
| [Set-VLCPlayerFocused](#Set-VLCPlayerFocused) | showvlc, vlcf, fvlc | Sets focus to the VLC media player window. |
| [Start-TextToSpeech](#Start-TextToSpeech) | say | Converts text to speech using the Windows Speech API. |
| [Stop-TextToSpeech](#Stop-TextToSpeech) | sst | Immediately stops any ongoing text-to-speech output. |
| [UtcNow](#UtcNow) |  | Gets the current UTC (Coordinated Universal Time) date and time. |

<hr/>
&nbsp;

### GenXdev.Console.Spotify</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-SpotifyNewPlaylist](#Add-SpotifyNewPlaylist) | newplaylist | Creates a new Spotify playlist with customizable settings. |
| [Add-SpotifyTracksToLiked](#Add-SpotifyTracksToLiked) | like | Adds tracks to the user's Spotify liked songs library. |
| [Add-SpotifyTracksToPlaylist](#Add-SpotifyTracksToPlaylist) | addtoplaylist | Adds tracks to a Spotify playlist. |
| [Connect-SpotifyApiToken](#Connect-SpotifyApiToken) |  | Authenticates with Spotify API using OAuth flow to obtain an access token. |
| [Get-SpotifyActiveDevice](#Get-SpotifyActiveDevice) |  | Returns all currently active Spotify devices for the current user. |
| [Get-SpotifyApiToken](#Get-SpotifyApiToken) |  | Retrieves or generates a valid Spotify API authentication token. |
| [Get-SpotifyCurrentlyPlaying](#Get-SpotifyCurrentlyPlaying) | gcp | Returns information about the currently playing track on Spotify. |
| [Get-SpotifyDevice](#Get-SpotifyDevice) | get-spotifydevices | Returns all currently available Spotify devices for current user. |
| [Get-SpotifyLikedTrack](#Get-SpotifyLikedTrack) | liked | Retrieves all tracks saved in the user's Spotify Library. |
| [Get-SpotifyLyrics](#Get-SpotifyLyrics) | lyrics | Retrieves lyrics for Spotify tracks from Musixmatch.com |
| [Get-SpotifyPlaylistIdsByName](#Get-SpotifyPlaylistIdsByName) |  | Retrieves Spotify playlist IDs by their names. |
| [Get-SpotifyPlaylistTrack](#Get-SpotifyPlaylistTrack) | getplaylist | Returns all tracks from a Spotify playlist. |
| [Get-SpotifyTrackAudioFeatures](#Get-SpotifyTrackAudioFeatures) | audiofeatures | Retrieves audio feature information for one or more Spotify tracks. |
| [Get-SpotifyTrackById](#Get-SpotifyTrackById) | gettrack | Retrieves detailed track information from Spotify using a track ID. |
| [Get-SpotifyUserPlaylists](#Get-SpotifyUserPlaylists) | gupl | Returns a collection of Spotify playlists owned by the current user. |
| [Move-SpotifyLikedTracksToPlaylist](#Move-SpotifyLikedTracksToPlaylist) | moveliked | Moves all liked tracks from your Spotify library to specified playlist(s) |
| [Remove-SpotifyTracksFromLiked](#Remove-SpotifyTracksFromLiked) | dislike | Removes tracks from the user's Spotify Library (Liked Songs). |
| [Remove-SpotifyTracksFromPlaylist](#Remove-SpotifyTracksFromPlaylist) | removefromplaylist | Removes tracks from a Spotify playlist. |
| [Search-Spotify](#Search-Spotify) | sm, fm | Performs a Spotify search and returns matching items. |
| [Search-SpotifyAndEnqueue](#Search-SpotifyAndEnqueue) | smq, fmq | Searches Spotify and adds the first matching item to the playback queue. |
| [Search-SpotifyAndPlay](#Search-SpotifyAndPlay) | smp, fmp | Performs a Spotify search and plays the first found item. |
| [Set-SpotifyActiveDevice](#Set-SpotifyActiveDevice) | set-spotifydevice | Sets the active Spotify playback device. |
| [Set-SpotifyApiToken](#Set-SpotifyApiToken) |  | Caches a Spotify API token for later use in the local configuration. |
| [Set-SpotifyNext](#Set-SpotifyNext) | next, skip | Skips to next track on Spotify. |
| [Set-SpotifyPause](#Set-SpotifyPause) | pausemusic, resume-music | Pauses Spotify playback |
| [Set-SpotifyPlaylistDetails](#Set-SpotifyPlaylistDetails) | spld | Sets the main properties of a Spotify playlist. |
| [Set-SpotifyPlaylistOrder](#Set-SpotifyPlaylistOrder) |  |  |
| [Set-SpotifyPrevious](#Set-SpotifyPrevious) | previous, prev | Skips to the previous track in Spotify playback. |
| [Set-SpotifyRepeatContext](#Set-SpotifyRepeatContext) | repeat | Enables playlist repeat mode for Spotify playback. |
| [Set-SpotifyRepeatOff](#Set-SpotifyRepeatOff) | norepeat, repeatoff | Disables Spotify repeat mode for the currently active device. |
| [Set-SpotifyRepeatSong](#Set-SpotifyRepeatSong) | repeatsong | Enables song repeat mode in Spotify. |
| [Set-SpotifyShuffleOff](#Set-SpotifyShuffleOff) | noshuffle, shuffleoff | Disables Spotify song-shuffle mode on the active device. |
| [Set-SpotifyShuffleOn](#Set-SpotifyShuffleOn) | shuffle, shuffleon | Enables Spotify song-shuffle mode. |
| [Set-SpotifyStart](#Set-SpotifyStart) | play, start-music | Starts Spotify playback on the currently active device. |
| [Set-SpotifyStop](#Set-SpotifyStop) | stop | Stops Spotify playback on the active device. |

<hr/>
&nbsp;

### GenXdev.Console.Vlc</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-VlcMediaPlayer](#Open-VlcMediaPlayer) | vlc | Launches and controls VLC Media Player with extensive configuration options. |
| [Open-VlcMediaPlayerLyrics](#Open-VlcMediaPlayerLyrics) | vlclyrics |  |
| [Start-VlcMediaPlayerNextInPlaylist](#Start-VlcMediaPlayerNextInPlaylist) |  |  |
| [Start-VlcMediaPlayerPreviousInPlaylist](#Start-VlcMediaPlayerPreviousInPlaylist) |  |  |
| [Switch-VlcMediaPlayerMute](#Switch-VlcMediaPlayerMute) |  |  |
| [Switch-VLCMediaPlayerPaused](#Switch-VLCMediaPlayerPaused) |  |  |
| [Switch-VlcMediaPlayerRepeat](#Switch-VlcMediaPlayerRepeat) |  |  |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Console<hr/> 

##	Enable-Screensaver 
````PowerShell 

   Enable-Screensaver  
```` 

### SYNOPSIS 
    Starts the configured Windows screensaver.  

### SYNTAX 
````PowerShell 

   Enable-Screensaver [<CommonParameters>]  
```` 

### DESCRIPTION 
    Activates the Windows system screensaver by executing the default screensaver  
    executable (scrnsave.scr) with the /s switch to start it immediately.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       This function requires the Windows screensaver to be properly configured in the  
       system settings. The screensaver executable must exist at the default Windows  
       System32 location.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Enable-Screensaver  
```` 

<br/><hr/><hr/><br/>
 

##	Get-IsSpeaking 
````PowerShell 

   Get-IsSpeaking                       --> iss  
```` 

### SYNOPSIS 
    Returns true if the text-to-speech engine is speaking.  

### SYNTAX 
````PowerShell 

   Get-IsSpeaking [<CommonParameters>]  
```` 

### DESCRIPTION 
    Checks the state of both the default and customized speech synthesizers to  
    determine if either is currently speaking. Returns true if speech is in progress,  
    false otherwise.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	New-MicrosoftShellTab 
````PowerShell 

   New-MicrosoftShellTab                --> x  
```` 

### SYNOPSIS 
    Creates a new Windows Terminal tab running PowerShell.  

### SYNTAX 
````PowerShell 

   New-MicrosoftShellTab [-DontCloseThisTab] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Opens a new Windows Terminal tab by simulating the keyboard shortcut Ctrl+Shift+T.  
    The function brings the PowerShell window to the foreground, sends the keystroke  
    combination, and optionally closes the current tab after a delay.  

### PARAMETERS 
    -DontCloseThisTab [<SwitchParameter>]  
        When specified, prevents the current tab from being closed after creating the new  
        tab. By default, the current tab will close after 3 seconds.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -WhatIf [<SwitchParameter>]  
        Shows what would happen if the cmdlet runs. The cmdlet is not run.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Confirm [<SwitchParameter>]  
        Prompts you for confirmation before running the cmdlet.  
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

<br/><hr/><hr/><br/>
 

##	Now 
````PowerShell 

   Now  
```` 

### SYNOPSIS 
    Returns the current system date and time as a DateTime object.  

### SYNTAX 
````PowerShell 

   Now [<CommonParameters>]  
```` 

### DESCRIPTION 
    Provides a simple way to get the current system date and time without any  
    parameters. Returns a standard .NET DateTime object that can be used for  
    datetime calculations, formatting, and comparisons.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Open-MediaFile 
````PowerShell 

   Open-MediaFile                       --> media, vlcmedia  
```` 

### SYNOPSIS 
    Plays media files using VLC player with flexible filtering options.  

### SYNTAX 
````PowerShell 

   Open-MediaFile [[-SearchMask] <String[]>] [-Keywords <String[]>] [-AllDrives] [-NoRecurse] [-OnlyVideos] [-OnlyAudio] [-OnlyPictures] [-IncludeVideos] [-IncludeAudio] [-IncludePictures] [[-KeysToSend] <String[]>] [-Escape] [-ShiftEnter]   
   [-DelayMilliSeconds <Int32>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-Fullscreen] [-PassThru] [-AlwaysOnTop] [-Random] [-Loop] [-Repeat]   
   [-StartPaused] [-PlayAndExit] [-DisableAudio] [-ReplayGainMode <String>] [-ReplayGainPreamp <Single>] [-ForceDolbySurround <String>] [-AudioFilters <String[]>] [-Visualization <String>] [-Deinterlace <String>] [-DeinterlaceMode   
   <String>] [-AspectRatio <String>] [-Crop <String>] [-AutoScale] [-VideoFilters <String[]>] [-SubtitleFile <String>] [-DisableSubtitles] [-SubtitleScale <Int32>] [-SubtitleLanguage <String>] [-AudioLanguage <String>]   
   [-PreferredAudioLanguage <String>] [-HttpProxy <String>] [-HttpProxyPassword <String>] [-VerbosityLevel <Int32>] [-SubdirectoryBehavior <String>] [-IgnoredExtensions <String>] [-HighPriority] [-EnableTimeStretch] [-VLCPath <String>]   
   [-NewWindow] [-EnableWallpaperMode] [-VideoFilterModules <String[]>] [-Modules <String[]>] [-AudioFilterModules <String[]>] [-AudioVisualization <String>] [-PreferredSubtitleLanguage <String>] [-IgnoredFileExtensions <String>]   
   [-EnableAudioTimeStretch] [-Arguments <String>] [-SideBySide] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function scans for media files in the specified directory, filters them based  
    on file type and optional keywords, creates a playlist, and launches VLC player.  
    It supports videos, audio files and pictures with automatic installation of VLC  
    if needed.  

### PARAMETERS 
    -SearchMask <String[]>  
        File pattern to filter media files. Default is "*".  
        Required?                    false  
        Position?                    1  
        Default value                *  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  true  
    -Keywords <String[]>  
        Keywords to search for in subtitle files (.srt) and media descriptions.  
        Required?                    false  
        Position?                    named  
        Default value                @()  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  true  
    -AllDrives [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoRecurse [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyVideos [<SwitchParameter>]  
        Filter to only include video files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyAudio [<SwitchParameter>]  
        Filter to only include audio files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -OnlyPictures [<SwitchParameter>]  
        Filter to only include picture files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeVideos [<SwitchParameter>]  
        Additionally include video files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludeAudio [<SwitchParameter>]  
        Additionally include audio files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IncludePictures [<SwitchParameter>]  
        Additionally include picture files in the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the VLC window.  
        Required?                    false  
        Position?                    2  
        Default value                @("f")  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Escape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor to display VLC on (-1=discard, 0=default).  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Initial window width.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Initial window height.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Initial window X position.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Initial window Y position.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left side of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right side of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers the window on screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Maximizes the window.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns the window helper for each VLC process.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AlwaysOnTop [<SwitchParameter>]  
        Keeps VLC window always on top.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Random [<SwitchParameter>]  
        Enables random playback order or shuffle.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Loop [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Repeat [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -StartPaused [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PlayAndExit [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DisableAudio [<SwitchParameter>]  
        Audio Options  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReplayGainMode <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReplayGainPreamp <Single>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ForceDolbySurround <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioFilters <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Visualization <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Deinterlace <String>  
        Video Options  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DeinterlaceMode <String>  
        Sets deinterlacing mode.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AspectRatio <String>  
        Sets video aspect ratio.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Crop <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoScale [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VideoFilters <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleFile <String>  
        Specifies external subtitle file.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DisableSubtitles [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleScale <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <String>  
        Sets preferred audio language.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HttpProxy <String>  
        Network Options  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HttpProxyPassword <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VerbosityLevel <Int32>  
        Advanced Options  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IgnoredExtensions <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HighPriority [<SwitchParameter>]  
        Performance Options  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableTimeStretch [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VLCPath <String>  
        Required?                    false  
        Position?                    named  
        Default value                "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe"  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NewWindow [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableWallpaperMode [<SwitchParameter>]  
        Enables wallpaper mode.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VideoFilterModules <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Modules <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioFilterModules <String[]>  
        Specifies audio filter modules to use.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioVisualization <String>  
        Sets audio visualization mode.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch [<SwitchParameter>]  
        Enables audio time stretching.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Arguments <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
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

<br/><hr/><hr/><br/>
 

##	SayDate 
````PowerShell 

   SayDate  
```` 

### SYNOPSIS 
    Speaks the current date using text-to-speech synthesis.  

### SYNTAX 
````PowerShell 

   SayDate [<CommonParameters>]  
```` 

### DESCRIPTION 
    Converts the current date into a natural language format and announces it using  
    the system's text-to-speech engine. The date is spoken in the format:  
    "It is [day of week], [month] [day] [year]"  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	SayTime 
````PowerShell 

   SayTime  
```` 

### SYNOPSIS 
    Announces the current time using text-to-speech.  

### SYNTAX 
````PowerShell 

   SayTime [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function gets the current time and uses the system's text-to-speech engine  
    to verbally announce it in hours and minutes format. It is useful for  
    accessibility purposes or when you need an audible time announcement.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Set-LocationParent 
````PowerShell 

   Set-LocationParent                   --> ..  
```` 

### SYNOPSIS 
    Changes the current location to the parent directory and lists its contents.  

### SYNTAX 
````PowerShell 

   Set-LocationParent [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function navigates up one directory level in the file system hierarchy and  
    displays the contents of the new current directory. It provides a convenient '..'  
    alias for quick directory navigation.  

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

<br/><hr/><hr/><br/>
 

##	Set-LocationParent2 
````PowerShell 

   Set-LocationParent2                  --> ...  
```` 

### SYNOPSIS 
    Navigates up two directory levels in the file system hierarchy.  

### SYNTAX 
````PowerShell 

   Set-LocationParent2 [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Changes the current working directory to the grandparent directory (two levels up)  
    and displays the contents of the resulting directory.  

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
````PowerShell 

       This function supports -WhatIf and -Confirm parameters through ShouldProcess.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Set-LocationParent2  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> ...  
```` 

<br/><hr/><hr/><br/>
 

##	Set-LocationParent3 
````PowerShell 

   Set-LocationParent3                  --> ....  
```` 

### SYNOPSIS 
    Navigates up three directory levels in the file system hierarchy.  

### SYNTAX 
````PowerShell 

   Set-LocationParent3 [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Changes the current working directory by moving up three parent directories in  
    the filesystem hierarchy and displays the contents of the resulting directory.  

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

<br/><hr/><hr/><br/>
 

##	Set-LocationParent4 
````PowerShell 

   Set-LocationParent4                  --> .....  
```` 

### SYNOPSIS 
    Navigates up four directory levels in the filesystem hierarchy.  

### SYNTAX 
````PowerShell 

   Set-LocationParent4 [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Provides a convenient way to move up four directory levels from the current  
    location in the filesystem. After navigation, displays the contents of the  
    resulting directory.  

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
````PowerShell 

       The alias '.....'' represents moving up four parent directories, where each dot  
       represents one level up.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Set-LocationParent4  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> .....  
```` 

<br/><hr/><hr/><br/>
 

##	Set-LocationParent5 
````PowerShell 

   Set-LocationParent5                  --> ......  
```` 

### SYNOPSIS 
    Navigates up five directory levels in the file system hierarchy.  

### SYNTAX 
````PowerShell 

   Set-LocationParent5 [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Changes the current working directory by moving up five parent directory levels  
    and displays the contents of the resulting directory. This function provides a  
    convenient shorthand alias '......' for quick navigation.  

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

<br/><hr/><hr/><br/>
 

##	Set-MonitorPowerOff 
````PowerShell 

   Set-MonitorPowerOff                  --> poweroff  
```` 

### SYNOPSIS 
    Turns off power to all connected monitors.  

### SYNTAX 
````PowerShell 

   Set-MonitorPowerOff [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Uses Windows API calls to send a power-off signal to all connected monitors. This  
    is equivalent to pressing the physical power button on your monitors. The monitors  
    will enter power saving mode but can be awakened by moving the mouse or pressing  
    a key.  

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

<br/><hr/><hr/><br/>
 

##	Set-MonitorPowerOn 
````PowerShell 

   Set-MonitorPowerOn                   --> wake-monitor  
```` 

### SYNOPSIS 
    Turns the monitor power on.  

### SYNTAX 
````PowerShell 

   Set-MonitorPowerOn [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Uses the Windows API through GenXdev.Helpers.WindowObj to wake up the monitor  
    from sleep/power off state. This is useful for automation scripts that need to  
    ensure the monitor is powered on.  

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

<br/><hr/><hr/><br/>
 

##	Set-VLCPlayerFocused 
````PowerShell 

   Set-VLCPlayerFocused                 --> fvlc, showvlc, vlcf  
```` 

### SYNOPSIS 
    Sets focus to the VLC media player window.  

### SYNTAX 
````PowerShell 

   Set-VLCPlayerFocused [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Locates a running instance of VLC media player and brings its window to the  
    foreground, making it the active window. If VLC is not running, silently  
    continues without error. Uses Windows API calls to manipulate window focus.  

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

<br/><hr/><hr/><br/>
 

##	Start-TextToSpeech 
````PowerShell 

   Start-TextToSpeech                   --> say  
```` 

### SYNOPSIS 
    Converts text to speech using the Windows Speech API.  

### SYNTAX 
````PowerShell 

   Start-TextToSpeech [-Lines] <String[]> [-Locale <String>] [-VoiceName <String>] [-PassThru] [-Wait] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Uses the Windows Speech API to convert text to speech. This function provides  
    flexible text-to-speech capabilities with support for different voices, locales,  
    and synchronous/asynchronous playback options. It can handle both single strings  
    and arrays of text, with error handling for speech synthesis failures.  

### PARAMETERS 
    -Lines <String[]>  
        The text to be spoken. Accepts single string or array of strings. Each line will  
        be processed sequentially for speech synthesis.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue)  
        Aliases                        
        Accept wildcard characters?  false  
    -Locale <String>  
        The language locale ID to use (e.g., 'en-US', 'es-ES'). When specified, the  
        function will attempt to use a voice matching this locale.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VoiceName <String>  
        The specific voice name to use for speech synthesis. If specified, the function  
        will attempt to find and use a matching voice from installed voices.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        When specified, outputs the text being spoken to the pipeline, allowing for  
        text processing while speaking.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Wait [<SwitchParameter>]  
        When specified, waits for speech to complete before continuing execution.  
        Useful for synchronous operations.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Stop-TextToSpeech 
````PowerShell 

   Stop-TextToSpeech                    --> sst  
```` 

### SYNOPSIS 
    Immediately stops any ongoing text-to-speech output.  

### SYNTAX 
````PowerShell 

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
````PowerShell 

       This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)  
       and Skip-TextToSpeech (alias: sstSkip) for speech control.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Stop-TextToSpeech  
   # Immediately stops any ongoing speech  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> say "Hello world"; sst  
   # Starts speaking but gets interrupted immediately  
```` 

<br/><hr/><hr/><br/>
 

##	UtcNow 
````PowerShell 

   UtcNow  
```` 

### SYNOPSIS 
    Gets the current UTC (Coordinated Universal Time) date and time.  

### SYNTAX 
````PowerShell 

   UtcNow [<CommonParameters>]  
```` 

### DESCRIPTION 
    Returns the current UTC date and time as a System.DateTime object. This function  
    provides a standardized way to retrieve UTC time across different systems and  
    time zones. The returned DateTime object can be used for timestamp  
    synchronization, logging, and cross-timezone operations.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/> 

##	Add-SpotifyNewPlaylist 
````PowerShell 

   Add-SpotifyNewPlaylist               --> newplaylist  
```` 

### SYNOPSIS 
    Creates a new Spotify playlist with customizable settings.  

### SYNTAX 
````PowerShell 

   Add-SpotifyNewPlaylist [-Name] <String> [[-Description] <String>] [-Public] [-Collabrative] [<CommonParameters>]  
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

<br/><hr/><hr/><br/>
 

##	Add-SpotifyTracksToLiked 
````PowerShell 

   Add-SpotifyTracksToLiked             --> like  
```` 

### SYNOPSIS 
    Adds tracks to the user's Spotify liked songs library.  

### SYNTAX 
````PowerShell 

   Add-SpotifyTracksToLiked [[-TrackId] <String[]>] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function allows you to add one or more tracks to your Spotify liked songs  
    library. If no track IDs are provided, it will attempt to like the currently  
    playing track.  

### PARAMETERS 
    -TrackId <String[]>  
        An array of Spotify track IDs that should be added to your liked songs. If not  
        provided, the currently playing track will be liked instead.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Add-SpotifyTracksToPlaylist 
````PowerShell 

   Add-SpotifyTracksToPlaylist          --> addtoplaylist  
```` 

### SYNOPSIS 
    Adds tracks to a Spotify playlist.  

### SYNTAX 
````PowerShell 

   Add-SpotifyTracksToPlaylist [-PlaylistName] <String[]> [[-Uri] <String[]>] [<CommonParameters>]  
   Add-SpotifyTracksToPlaylist [-PlaylistId] <String[]> [[-Uri] <String[]>] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Adds one or more tracks to either a named Spotify playlist or a playlist  
    specified by its ID. Supports pipeline input for track URIs.  

### PARAMETERS 
    -PlaylistName <String[]>  
        The name(s) of the Spotify playlist(s) to add tracks to.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PlaylistId <String[]>  
        The Spotify playlist ID(s) to add tracks to.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Uri <String[]>  
        The Spotify track URIs that should be added to the playlist.  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Connect-SpotifyApiToken 
````PowerShell 

   Connect-SpotifyApiToken  
```` 

### SYNOPSIS 
    Authenticates with Spotify API using OAuth flow to obtain an access token.  

### SYNTAX 
````PowerShell 

   Connect-SpotifyApiToken [<CommonParameters>]  
```` 

### DESCRIPTION 
    Opens a browser window in application mode to handle the Spotify OAuth  
    authentication flow. Once authenticated, retrieves and stores the access token for  
    subsequent API calls. The browser window automatically closes after successful  
    authentication. Uses port 5642 for the OAuth callback listener.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       Uses port 5642 as the default callback port for OAuth flow  
       Minimizes browser window during authentication  
       Automatically closes browser window after successful authentication  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> # Authenticate with Spotify and obtain access token  
   Connect-SpotifyApiToken  
```` 

<br/><hr/><hr/><br/>
 

##	Get-SpotifyActiveDevice 
````PowerShell 

   Get-SpotifyActiveDevice  
```` 

### SYNOPSIS 
    Returns all currently active Spotify devices for the current user.  

### SYNTAX 
````PowerShell 

   Get-SpotifyActiveDevice [<CommonParameters>]  
```` 

### DESCRIPTION 
    Retrieves a list of Spotify devices that are currently marked as active for the  
    authenticated user's account. This includes devices like phones, computers,  
    speakers, etc. that are currently available to play music.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyApiToken 
````PowerShell 

   Get-SpotifyApiToken  
```` 

### SYNOPSIS 
    Retrieves or generates a valid Spotify API authentication token.  

### SYNTAX 
````PowerShell 

   Get-SpotifyApiToken [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function manages Spotify API authentication by either retrieving a cached  
    token or obtaining a new one. It also ensures proper firewall access and  
    validates the token's functionality.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyCurrentlyPlaying 
````PowerShell 

   Get-SpotifyCurrentlyPlaying          --> gcp  
```` 

### SYNOPSIS 
    Returns information about the currently playing track on Spotify.  

### SYNTAX 
````PowerShell 

   Get-SpotifyCurrentlyPlaying [<CommonParameters>]  
```` 

### DESCRIPTION 
    Retrieves detailed information about the track currently playing on Spotify,  
    including track name, artist, album, and playback status using the Spotify Web  
    API.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyDevice 
````PowerShell 

   Get-SpotifyDevice                    --> Get-SpotifyDevices  
```` 

### SYNOPSIS 
    Returns all currently available Spotify devices for current user.  

### SYNTAX 
````PowerShell 

   Get-SpotifyDevice [<CommonParameters>]  
```` 

### DESCRIPTION 
    Retrieves a list of all Spotify devices that are currently available for the  
    authenticated user. This includes any active or recently active devices such as  
    smartphones, computers, speakers, and other Spotify-enabled devices.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

### NOTES 
````PowerShell 

       Requires valid Spotify authentication token to function. The token is automatically  
       retrieved using Get-SpotifyApiToken.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Get-SpotifyDevice  
   This command returns all available Spotify devices for the current user.  
```` 

<br/><hr/><hr/><br/>
 

##	Get-SpotifyLikedTrack 
````PowerShell 

   Get-SpotifyLikedTrack                --> liked  
```` 

### SYNOPSIS 
    Retrieves all tracks saved in the user's Spotify Library.  

### SYNTAX 
````PowerShell 

   Get-SpotifyLikedTrack [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function authenticates with Spotify using an API token and retrieves all  
    tracks that the user has saved (liked) in their Spotify library. The tracks are  
    returned as collection of track objects containing metadata like title, artist,  
    and album information.  

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyLyrics 
````PowerShell 

   Get-SpotifyLyrics                    --> lyrics  
```` 

### SYNOPSIS 
    Retrieves lyrics for Spotify tracks from Musixmatch.com  

### SYNTAX 
````PowerShell 

   Get-SpotifyLyrics [-TrackId <String>] [[-Queries] <String[]>] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Searches for and displays song lyrics by either:  
    - Using a Spotify track ID  
    - Searching for tracks by name/artist  
    - Getting lyrics for currently playing track  
    If lyrics aren't found on Musixmatch, opens a Google search as fallback.  

### PARAMETERS 
    -TrackId <String>  
        The Spotify track ID to look up lyrics for. If omitted, uses currently playing  
        track or allows searching by name.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       true (ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Queries <String[]>  
        Search terms to find a track. Can include artist name and/or song title.  
        Results will be shown for selection.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyPlaylistIdsByName 
````PowerShell 

   Get-SpotifyPlaylistIdsByName  
```` 

### SYNOPSIS 
    Retrieves Spotify playlist IDs by their names.  

### SYNTAX 
````PowerShell 

   Get-SpotifyPlaylistIdsByName [-PlaylistName] <String[]> [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function searches for Spotify playlists by name and returns their  
    corresponding IDs. It follows a three-step process:  
    1. Searches in the current session's playlists  
    2. Checks a local cache file if no results found  
    3. Forces a fresh fetch if cache is outdated or missing  
    The function returns all playlist IDs that match the provided names.  

### PARAMETERS 
    -PlaylistName <String[]>  
        An array of playlist names to search for. The function will match these names  
        against your Spotify playlists and return the IDs of matching playlists.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyPlaylistTrack 
````PowerShell 

   Get-SpotifyPlaylistTrack             --> getplaylist  
```` 

### SYNOPSIS 
    Returns all tracks from a Spotify playlist.  

### SYNTAX 
````PowerShell 

   Get-SpotifyPlaylistTrack [-PlaylistName] <String> [<CommonParameters>]  
   Get-SpotifyPlaylistTrack [-PlaylistId] <String> [<CommonParameters>]  
```` 

### DESCRIPTION 
    Retrieves all tracks from a Spotify playlist by either playlist name or ID. When  
    using playlist name, it will fetch the first matching playlist's ID and then  
    retrieve its tracks using the Spotify API.  

### PARAMETERS 
    -PlaylistName <String>  
        The name of the Spotify playlist to retrieve tracks from. Will match the first  
        playlist found with this name.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -PlaylistId <String>  
        The unique Spotify ID of the playlist to retrieve tracks from.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyTrackAudioFeatures 
````PowerShell 

   Get-SpotifyTrackAudioFeatures        --> audiofeatures  
```` 

### SYNOPSIS 
    Retrieves audio feature information for one or more Spotify tracks.  

### SYNTAX 
````PowerShell 

   Get-SpotifyTrackAudioFeatures [-TrackId] <String[]> [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function connects to the Spotify API to fetch detailed audio features for the  
    specified tracks. Audio features include characteristics like danceability,  
    energy, key, loudness, mode, speechiness, acousticness, instrumentalness,  
    liveness, valence, tempo, and time signature.  

### PARAMETERS 
    -TrackId <String[]>  
        One or more Spotify track IDs to analyze. These must be valid Spotify track  
        identifiers.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyTrackById 
````PowerShell 

   Get-SpotifyTrackById                 --> gettrack  
```` 

### SYNOPSIS 
    Retrieves detailed track information from Spotify using a track ID.  

### SYNTAX 
````PowerShell 

   Get-SpotifyTrackById [-TrackId] <String> [<CommonParameters>]  
```` 

### DESCRIPTION 
    Uses the Spotify Web API to fetch comprehensive track information including  
    artist, album, duration, popularity, and other metadata for a specific track  
    identified by its Spotify track ID.  

### PARAMETERS 
    -TrackId <String>  
        The unique Spotify track identifier. This is typically a 22-character string  
        that can be found in the Spotify track URL or through the Spotify client.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Get-SpotifyUserPlaylists 
````PowerShell 

   Get-SpotifyUserPlaylists             --> gupl  
```` 

### SYNOPSIS 
    Returns a collection of Spotify playlists owned by the current user.  

### SYNTAX 
````PowerShell 

   Get-SpotifyUserPlaylists [[-Filter] <String[]>] [-Force] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Retrieves all playlists owned by the current Spotify user, with optional  
    filtering. Results are cached for 12 hours to improve performance unless Force is  
    specified.  

### PARAMETERS 
    -Filter <String[]>  
        Specifies a wildcard pattern to filter playlists by name. Accepts pipeline input.  
        Multiple patterns can be provided.  
        Required?                    false  
        Position?                    1  
        Default value                @("*")  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -Force [<SwitchParameter>]  
        Forces retrieval of fresh data from Spotify API instead of using cached results.  
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

<br/><hr/><hr/><br/>
 

##	Move-SpotifyLikedTracksToPlaylist 
````PowerShell 

   Move-SpotifyLikedTracksToPlaylist    --> moveliked  
```` 

### SYNOPSIS 
    Moves all liked tracks from your Spotify library to specified playlist(s)  

### SYNTAX 
````PowerShell 

   Move-SpotifyLikedTracksToPlaylist [-PlaylistName] <String[]> [<CommonParameters>]  
   Move-SpotifyLikedTracksToPlaylist [-PlaylistId] <String[]> [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function retrieves all tracks from your Spotify liked songs library and moves  
    them to one or more specified playlists. After successfully adding the tracks to  
    the target playlist(s), it removes them from your liked songs.  

### PARAMETERS 
    -PlaylistName <String[]>  
        The name(s) of the Spotify playlist(s) where liked tracks should be moved to.  
        Multiple playlist names can be specified.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -PlaylistId <String[]>  
        The Spotify ID(s) of the playlist(s) where liked tracks should be moved to.  
        Multiple playlist IDs can be specified.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Remove-SpotifyTracksFromLiked 
````PowerShell 

   Remove-SpotifyTracksFromLiked        --> dislike  
```` 

### SYNOPSIS 
    Removes tracks from the user's Spotify Library (Liked Songs).  

### SYNTAX 
````PowerShell 

   Remove-SpotifyTracksFromLiked [[-TrackId] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Removes one or more tracks from the user's Spotify Liked Songs collection.  
    If no track ID is provided, removes the currently playing track.  

### PARAMETERS 
    -TrackId <String[]>  
        One or more Spotify track IDs to remove from the Liked Songs collection.  
        If omitted, the currently playing track will be removed.  
        Required?                    false  
        Position?                    1  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Remove-SpotifyTracksFromPlaylist 
````PowerShell 

   Remove-SpotifyTracksFromPlaylist     --> removefromplaylist  
```` 

### SYNOPSIS 
    Removes tracks from a Spotify playlist.  

### SYNTAX 
````PowerShell 

   Remove-SpotifyTracksFromPlaylist [-PlaylistName] <String[]> [[-Uri] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]  
   Remove-SpotifyTracksFromPlaylist [-PlaylistId] <String[]> [[-Uri] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Removes one or more tracks from either a named Spotify playlist or a playlist  
    specified by its ID. Supports pipeline input for track URIs.  

### PARAMETERS 
    -PlaylistName <String[]>  
        The name(s) of the Spotify playlist(s) to remove tracks from.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PlaylistId <String[]>  
        The Spotify playlist ID(s) to remove tracks from.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Uri <String[]>  
        The Spotify track URIs that should be removed from the playlist.  
        Required?                    false  
        Position?                    2  
        Default value                @()  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Search-Spotify 
````PowerShell 

   Search-Spotify                       --> fm, sm  
```` 

### SYNOPSIS 
    Performs a Spotify search and returns matching items.  

### SYNTAX 
````PowerShell 

   Search-Spotify [-Queries] <String[]> [[-SearchType] {Album | Artist | Playlist | Track | Show | Episode | All}] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Searches Spotify's catalog for items matching the provided search query. Can  
    search for tracks, albums, artists, playlists, shows, and episodes. Results are  
    returned through the pipeline.  

### PARAMETERS 
    -Queries <String[]>  
        One or more search phrases to look up in Spotify's catalog. Multiple queries will  
        be processed sequentially.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SearchType  
        The type(s) of items to search for. Valid values are: Album, Artist, Playlist,  
        Track, Show, Episode, or All. Default is Track.  
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

<br/><hr/><hr/><br/>
 

##	Search-SpotifyAndEnqueue 
````PowerShell 

   Search-SpotifyAndEnqueue             --> fmq, smq  
```` 

### SYNOPSIS 
    Searches Spotify and adds the first matching item to the playback queue.  

### SYNTAX 
````PowerShell 

   Search-SpotifyAndEnqueue [-Queries] <String[]> [[-SearchType] {Album | Artist | Playlist | Track | Show | Episode | All}] [<CommonParameters>]  
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

<br/><hr/><hr/><br/>
 

##	Search-SpotifyAndPlay 
````PowerShell 

   Search-SpotifyAndPlay                --> fmp, smp  
```` 

### SYNOPSIS 
    Performs a Spotify search and plays the first found item.  

### SYNTAX 
````PowerShell 

   Search-SpotifyAndPlay [-Queries] <String[]> [[-SearchType] {Album | Artist | Playlist | Track | Show | Episode | All}] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Searches Spotify using the provided query string and automatically plays the first  
    matching item on the currently active Spotify device. Can search for different  
    types of content including tracks, albums, artists, playlists, shows and episodes.  

### PARAMETERS 
    -Queries <String[]>  
        One or more search phrases to look for on Spotify. Each query will be processed  
        in sequence.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -SearchType  
        The type of content to search for. Valid options are:  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyActiveDevice 
````PowerShell 

   Set-SpotifyActiveDevice              --> Set-SpotifyDevice  
```` 

### SYNOPSIS 
    Sets the active Spotify playback device.  

### SYNTAX 
````PowerShell 

   Set-SpotifyActiveDevice [-DeviceId] <String> [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Transfers playback to the specified Spotify device using the Spotify Web API.  
    This cmdlet requires an authenticated Spotify session and a valid device ID.  
    The device ID can be obtained using the Get-SpotifyDevice cmdlet.  

### PARAMETERS 
    -DeviceId <String>  
        The Spotify device ID to transfer playback to. This is a unique identifier  
        assigned by Spotify to each playback device (speakers, computers, phones, etc.).  
        Use Get-SpotifyDevice to get a list of available device IDs.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyApiToken 
````PowerShell 

   Set-SpotifyApiToken  
```` 

### SYNOPSIS 
    Caches a Spotify API token for later use in the local configuration.  

### SYNTAX 
````PowerShell 

   Set-SpotifyApiToken [-ApiToken] <String> [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function stores a provided Spotify API token in a local JSON file for  
    subsequent use by other Spotify-related commands. The token is saved in a  
    dedicated configuration directory under GenXdev.Local.  

### PARAMETERS 
    -ApiToken <String>  
        The Spotify API authentication token to be cached locally.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyNext 
````PowerShell 

   Set-SpotifyNext                      --> next, skip  
```` 

### SYNOPSIS 
    Skips to next track on Spotify.  

### SYNTAX 
````PowerShell 

   Set-SpotifyNext [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Advances playback to the next track in the current playlist or album on the  
    currently active Spotify device. This function requires a valid Spotify API token  
    and an active playback session.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyPause 
````PowerShell 

   Set-SpotifyPause                     --> pausemusic, Resume-Music  
```` 

### SYNOPSIS 
    Pauses Spotify playback  

### SYNTAX 
````PowerShell 

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyPlaylistDetails 
````PowerShell 

   Set-SpotifyPlaylistDetails           --> spld  
```` 

### SYNOPSIS 
    Sets the main properties of a Spotify playlist.  

### SYNTAX 
````PowerShell 

   Set-SpotifyPlaylistDetails [-PlaylistId] <String> [-Name] <String> [[-Description] <String>] [-Public] [-Collabrative] [-Private] [-NoCollabrations] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Modifies playlist properties including name, description, visibility and  
    collaboration settings using the Spotify API.  

### PARAMETERS 
    -PlaylistId <String>  
        The unique identifier of the Spotify playlist to modify.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Name <String>  
        The new name to set for the playlist.  
        Required?                    true  
        Position?                    2  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Description <String>  
        Optional description text for the playlist.  
        Required?                    false  
        Position?                    3  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Public [<SwitchParameter>]  
        Switch to make the playlist visible to all users.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Collabrative [<SwitchParameter>]  
        Switch to allow other users to modify the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Private [<SwitchParameter>]  
        Switch to make the playlist only visible to you.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoCollabrations [<SwitchParameter>]  
        Switch to prevent other users from modifying the playlist.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyPlaylistOrder 
````PowerShell 

   Set-SpotifyPlaylistOrder  
```` 

### SYNOPSIS 
    Reorders tracks within a Spotify playlist by moving a range of items to a new  
    position.  

### SYNTAX 
````PowerShell 

   Set-SpotifyPlaylistOrder [-PlaylistId] <String> [-RangeStart] <Int32> [-InsertBefore] <Int32> [[-RangeLength] <Nullable`1>] [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Allows repositioning of one or more tracks within a Spotify playlist by  
    specifying the start position of items to move and their destination position.  
    Requires valid Spotify API authentication.  

### PARAMETERS 
    -PlaylistId <String>  
        The unique identifier of the Spotify playlist to modify.  
        Required?                    true  
        Position?                    1  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RangeStart <Int32>  
        The zero-based position index of the first track to be moved.  
        Required?                    true  
        Position?                    2  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -InsertBefore <Int32>  
        The zero-based position index where the moved tracks should be inserted.  
        For example, to move items to the end of a 10-track playlist, use 10.  
        To move items to the start, use 0.  
        Required?                    true  
        Position?                    3  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -RangeLength <Nullable`1>  
        Optional. The number of consecutive tracks to move, starting from RangeStart.  
        Defaults to 1 if not specified.  
        Required?                    false  
        Position?                    4  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyPrevious 
````PowerShell 

   Set-SpotifyPrevious                  --> prev, previous  
```` 

### SYNOPSIS 
    Skips to the previous track in Spotify playback.  

### SYNTAX 
````PowerShell 

   Set-SpotifyPrevious [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Controls Spotify playback by skipping to the previous track on the currently  
    active device. Requires valid Spotify API authentication token.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyRepeatContext 
````PowerShell 

   Set-SpotifyRepeatContext             --> repeat  
```` 

### SYNOPSIS 
    Enables playlist repeat mode for Spotify playback.  

### SYNTAX 
````PowerShell 

   Set-SpotifyRepeatContext [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Sets the current Spotify context (playlist, album, etc.) to repeat mode on the  
    active device. This affects the entire playback queue rather than a single track.  

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
````PowerShell 

       This cmdlet supports ShouldProcess, allowing use of -WhatIf and -Confirm parameters  
       to control execution of state-changing operations.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Set-SpotifyRepeatContext  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\> repeat  
```` 

<br/><hr/><hr/><br/>
 

##	Set-SpotifyRepeatOff 
````PowerShell 

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff  
```` 

### SYNOPSIS 
    Disables Spotify repeat mode for the currently active device.  

### SYNTAX 
````PowerShell 

   Set-SpotifyRepeatOff [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function disables the repeat mode on the currently active Spotify device  
    using the Spotify Web API. It requires a valid Spotify API token which is  
    automatically retrieved using Get-SpotifyApiToken.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyRepeatSong 
````PowerShell 

   Set-SpotifyRepeatSong                --> repeatsong  
```` 

### SYNOPSIS 
    Enables song repeat mode in Spotify.  

### SYNTAX 
````PowerShell 

   Set-SpotifyRepeatSong [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Sets the repeat mode to 'track' for the currently active Spotify device using the  
    Spotify Web API. This will make the current song play repeatedly until repeat  
    mode is disabled.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyShuffleOff 
````PowerShell 

   Set-SpotifyShuffleOff                --> noshuffle, shuffleoff  
```` 

### SYNOPSIS 
    Disables Spotify song-shuffle mode on the active device.  

### SYNTAX 
````PowerShell 

   Set-SpotifyShuffleOff [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Disables the shuffle playback mode on the currently active Spotify device. This  
    function uses the Spotify Web API to modify the shuffle state of the playback.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyShuffleOn 
````PowerShell 

   Set-SpotifyShuffleOn                 --> shuffle, shuffleon  
```` 

### SYNOPSIS 
    Enables Spotify song-shuffle mode.  

### SYNTAX 
````PowerShell 

   Set-SpotifyShuffleOn [-WhatIf] [-Confirm] [<CommonParameters>]  
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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyStart 
````PowerShell 

   Set-SpotifyStart                     --> play, Start-Music  
```` 

### SYNOPSIS 
    Starts Spotify playback on the currently active device.  

### SYNTAX 
````PowerShell 

   Set-SpotifyStart [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    This function initiates playback on the device that is currently active in  
    Spotify. It uses the Spotify API token to authenticate the request and control  
    playback.  

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

<br/><hr/><hr/><br/>
 

##	Set-SpotifyStop 
````PowerShell 

   Set-SpotifyStop                      --> stop  
```` 

### SYNOPSIS 
    Stops Spotify playback on the active device.  

### SYNTAX 
````PowerShell 

   Set-SpotifyStop [-WhatIf] [-Confirm] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Stops the currently playing music on the active Spotify device by calling the  
    Spotify Web API. Requires a valid authentication token.  

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

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Vlc<hr/> 

##	Open-VlcMediaPlayer 
````PowerShell 

   Open-VlcMediaPlayer                  --> vlc  
```` 

### SYNOPSIS 
    Launches and controls VLC Media Player with extensive configuration options.  

### SYNTAX 
````PowerShell 

   Open-VlcMediaPlayer [[-Path] <String[]>] [-KeysToSend <String[]>] [-Escape] [-ShiftEnter] [-DelayMilliSeconds <Int32>] [-Monitor <Int32>] [-NoBorders] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top]   
   [-Bottom] [-Centered] [-Fullscreen] [-PassThru] [-AlwaysOnTop] [-Random] [-Loop] [-Repeat] [-StartPaused] [-PlayAndExit] [-DisableAudio] [-ReplayGainMode <String>] [-ReplayGainPreamp <Single>] [-ForceDolbySurround <String>]   
   [-AudioFilters <String[]>] [-Visualization <String>] [-Deinterlace <String>] [-DeinterlaceMode <String>] [-AspectRatio <String>] [-Crop <String>] [-AutoScale] [-VideoFilters <String[]>] [-SubtitleFile <String>] [-DisableSubtitles]   
   [-SubtitleScale <Int32>] [-SubtitleLanguage <String>] [-AudioLanguage <String>] [-PreferredAudioLanguage <String>] [-HttpProxy <String>] [-HttpProxyPassword <String>] [-VerbosityLevel <Int32>] [-SubdirectoryBehavior <String>]   
   [-IgnoredExtensions <String>] [-HighPriority] [-EnableTimeStretch] [-VLCPath <String>] [-NewWindow] [-EnableWallpaperMode] [-VideoFilterModules <String[]>] [-Modules <String[]>] [-AudioFilterModules <String[]>] [-AudioVisualization   
   <String>] [-PreferredSubtitleLanguage <String>] [-IgnoredFileExtensions <String>] [-EnableAudioTimeStretch] [-Arguments <String>] [-Close] [-SideBySide] [<CommonParameters>]  
```` 

### DESCRIPTION 
    Provides a comprehensive interface to launch and control VLC Media Player with  
    support for:  
    - Window positioning and monitor selection  
    - Playback settings (speed, aspect ratio, etc)  
    - Audio/video filters and options  
    - Subtitle handling  
    - Multiple language support  
    - Network proxy settings  
    - Advanced performance options  

### PARAMETERS 
    -Path <String[]>  
        The media file(s) or URL(s) to open in VLC.  
        Required?                    false  
        Position?                    1  
        Default value                  
        Accept pipeline input?       true (ByValue, ByPropertyName)  
        Aliases                        
        Accept wildcard characters?  false  
    -KeysToSend <String[]>  
        Keystrokes to send to the VLC window for control.  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Escape [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ShiftEnter [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DelayMilliSeconds <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Monitor <Int32>  
        Monitor to display VLC on (-1=discard, 0=default, >0=specific monitor).  
        Required?                    false  
        Position?                    named  
        Default value                -2  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NoBorders [<SwitchParameter>]  
        Removes window borders for a cleaner look.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Width <Int32>  
        Initial window width in pixels.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Height <Int32>  
        Initial window height in pixels.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -X <Int32>  
        Initial window X position.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Y <Int32>  
        Initial window Y position.  
        Required?                    false  
        Position?                    named  
        Default value                -1  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Left [<SwitchParameter>]  
        Places window on left side of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Right [<SwitchParameter>]  
        Places window on right side of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Top [<SwitchParameter>]  
        Places window on top of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Bottom [<SwitchParameter>]  
        Places window on bottom of screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Centered [<SwitchParameter>]  
        Centers the window on screen.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Fullscreen [<SwitchParameter>]  
        Maximizes the window.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PassThru [<SwitchParameter>]  
        Returns the window helper object.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AlwaysOnTop [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Random [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Loop [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Repeat [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -StartPaused [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PlayAndExit [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DisableAudio [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReplayGainMode <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ReplayGainPreamp <Single>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -ForceDolbySurround <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioFilters <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Visualization <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Deinterlace <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DeinterlaceMode <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AspectRatio <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Crop <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AutoScale [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VideoFilters <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleFile <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -DisableSubtitles [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleScale <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubtitleLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferredAudioLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HttpProxy <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HttpProxyPassword <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VerbosityLevel <Int32>  
        Required?                    false  
        Position?                    named  
        Default value                0  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SubdirectoryBehavior <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IgnoredExtensions <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -HighPriority [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableTimeStretch [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VLCPath <String>  
        Custom path to VLC executable.  
        Required?                    false  
        Position?                    named  
        Default value                "${env:ProgramFiles}\VideoLAN\VLC\vlc.exe"  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -NewWindow [<SwitchParameter>]  
        Forces new VLC instance.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableWallpaperMode [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -VideoFilterModules <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Modules <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioFilterModules <String[]>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -AudioVisualization <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -PreferredSubtitleLanguage <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -IgnoredFileExtensions <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -EnableAudioTimeStretch [<SwitchParameter>]  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Arguments <String>  
        Required?                    false  
        Position?                    named  
        Default value                  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -Close [<SwitchParameter>]  
        Closes VLC window.  
        Required?                    false  
        Position?                    named  
        Default value                False  
        Accept pipeline input?       false  
        Aliases                        
        Accept wildcard characters?  false  
    -SideBySide [<SwitchParameter>]  
        Places VLC window side by side with PowerShell window.  
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

<br/><hr/><hr/><br/>
 

##	Open-VlcMediaPlayerLyrics 
````PowerShell 

   Open-VlcMediaPlayerLyrics            --> vlclyrics  
```` 

### SYNTAX 
````PowerShell 

   Open-VlcMediaPlayerLyrics [[-Queries] <string[]>] [[-EndPoint] {Bing | Github | Google | IMDB | InstantStreetView | StackOverflow | Wikipedia | WikipediaNL | WolframAlpha | Youtube}] [[-Language] {Afrikaans | Akan | Albanian | Amharic |   
   Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa | Chinese (Simplified) | Chinese (Traditional) | Corsican |   
   Croatian | Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe | Faroese | Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani | Gujarati | Hacker | Haitian Creole | Hausa |   
   Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish | Kurdish   
   (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala | Lithuanian | Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese | Maori | Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali |   
   Nigerian Pidgin | Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua | Romanian | Romansh | Runyakitara |   
   Russian | Scots Gaelic | Serbian | Serbo-Croatian | Sesotho | Setswana | Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian | Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili | Swedish | Tajik | Tamil   
   | Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-Private] [-Force] [-Edge] [-Chrome]   
   [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>]   
   [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [<CommonParameters>]  
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
        The enpoint to invoke the query on  
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
    -Force  
        Force enable debugging port, stopping existing browsers if needed  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      None  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -FullScreen  
        Opens in fullscreen mode  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      fs, f  
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
        Aliases                      None  
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
        Aliases                      q, Value, Name, Text, Query  
        Dynamic?                     false  
        Accept wildcard characters?  false  
    -RestoreFocus  
        Restore PowerShell window focus  
        Required?                    false  
        Position?                    Named  
        Accept pipeline input?       false  
        Parameter set name           (All)  
        Aliases                      bg  
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

<br/><hr/><hr/><br/>
 

##	Start-VlcMediaPlayerNextInPlaylist 
````PowerShell 

   Start-VlcMediaPlayerNextInPlaylist   --> vlcnext  
```` 

### SYNTAX 
````PowerShell 

   Start-VlcMediaPlayerNextInPlaylist [-WhatIf] [-Confirm] [<CommonParameters>]  
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

<br/><hr/><hr/><br/>
 

##	Start-VlcMediaPlayerPreviousInPlaylist 
````PowerShell 

   Start-VlcMediaPlayerPreviousInPlaylist --> vlcback, vlcprev  
```` 

### SYNTAX 
````PowerShell 

   Start-VlcMediaPlayerPreviousInPlaylist [-WhatIf] [-Confirm] [<CommonParameters>]  
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

<br/><hr/><hr/><br/>
 

##	Switch-VlcMediaPlayerMute 
````PowerShell 

   Switch-VlcMediaPlayerMute            --> vlcmute, vlcunmute  
```` 

### SYNTAX 
````PowerShell 

   Switch-VlcMediaPlayerMute [<CommonParameters>]  
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Switch-VLCMediaPlayerPaused 
````PowerShell 

   Switch-VlcMediaPlayerPaused          --> vlcpause, vlcplay  
```` 

### SYNTAX 
````PowerShell 

   Switch-VlcMediaPlayerPaused [<CommonParameters>]  
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
 

##	Switch-VlcMediaPlayerRepeat 
````PowerShell 

   Switch-VlcMediaPlayerRepeat          --> vlcrepeat  
```` 

### SYNTAX 
````PowerShell 

   Switch-VlcMediaPlayerRepeat [<CommonParameters>]  
```` 

### PARAMETERS 
    <CommonParameters>  
        This cmdlet supports the common parameters: Verbose, Debug,  
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,  
        OutBuffer, PipelineVariable, and OutVariable. For more information, see  
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).   

<br/><hr/><hr/><br/>
