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
| [Enable-Screensaver](#Enable-Screensaver) |  | Activates the Windows system screensaver by executing the default screensaverexecutable (scrnsave.scr) with the /s switch to start it immediately. |
| [Get-FunctionDescription](#Get-FunctionDescription) |  |  |
| [Get-GenXDevCmdlets](#Get-GenXDevCmdlets) |  | Searches through installed GenXdev modules and returns detailed information abouttheir cmdlets, including names, aliases, and descriptions. Supports filtering bymodule name and cmdlet name patterns. |
| [Get-IsSpeaking](#Get-IsSpeaking) | iss | Checks the state of both the default and customized speech synthesizers todetermine if either is currently speaking. Returns true if speech is in progress,false otherwise. |
| [Invoke-Fasti](#Invoke-Fasti) | Fasti | Automatically extracts common archive formats (zip, 7z, tar, etc.) found in thecurrent directory into individual folders named after each archive. Aftersuccessful extraction, the original archive files are deleted. Requires 7-Zipto be installed on the system. |
| [Invoke-VLCPlayer](#Invoke-VLCPlayer) | media, vlc | This function scans for media files in the specified directory, filters them basedon file type and optional keywords, creates a playlist, and launches VLC player.It supports videos, audio files and pictures with automatic installation of VLCif needed. |
| [New-MicrosoftShellTab](#New-MicrosoftShellTab) | x | Opens a new Windows Terminal tab by simulating the keyboard shortcut Ctrl+Shift+T.The function brings the PowerShell window to the foreground, sends the keystrokecombination, and optionally closes the current tab after a delay. |
| [Now](#Now) |  | Provides a simple way to get the current system date and time without anyparameters. Returns a standard .NET DateTime object that can be used fordatetime calculations, formatting, and comparisons. |
| [SayDate](#SayDate) |  | Converts the current date into a natural language format and announces it usingthe system's text-to-speech engine. The date is spoken in the format:"It is [day of week], [month] [day] [year]" |
| [SayTime](#SayTime) |  | This function gets the current time and uses the system's text-to-speech engineto verbally announce it in hours and minutes format. It's useful foraccessibility purposes or when you need an audible time announcement. |
| [Set-LocationParent](#Set-LocationParent) | .. | This function navigates up one directory level in the file system hierarchy anddisplays the contents of the new current directory. It provides a convenient '..'alias for quick directory navigation. |
| [Set-LocationParent2](#Set-LocationParent2) | ... | Changes the current working directory to the grandparent directory (two levels up)and displays the contents of the resulting directory. |
| [Set-LocationParent3](#Set-LocationParent3) | .... | Changes the current working directory by moving up three parent directories inthe filesystem hierarchy and displays the contents of the resulting directory. |
| [Set-LocationParent4](#Set-LocationParent4) | ..... | Provides a convenient way to move up four directory levels from the currentlocation in the filesystem. After navigation, displays the contents of theresulting directory. |
| [Set-LocationParent5](#Set-LocationParent5) | ...... | Changes the current working directory by moving up five parent directory levelsand displays the contents of the resulting directory. This function provides aconvenient shorthand alias '......' for quick navigation. |
| [Set-MonitorPowerOff](#Set-MonitorPowerOff) | poweroff | Uses Windows API calls to send a power-off signal to all connected monitors. Thisis equivalent to pressing the physical power button on your monitors. The monitorswill enter power saving mode but can be awakened by moving the mouse or pressinga key. |
| [Set-MonitorPowerOn](#Set-MonitorPowerOn) | wake-monitor | Uses the Windows API through GenXdev.Helpers.WindowObj to wake up the monitorfrom sleep/power off state. This is useful for automation scripts that need toensure the monitor is powered on. |
| [Set-VLCPlayerFocused](#Set-VLCPlayerFocused) | fvlc, showvlc, vlcf | Locates a running instance of VLC media player and brings its window to theforeground, making it the active window. If VLC is not running, silentlycontinues without error. Uses Windows API calls to manipulate window focus. |
| [Show-GenXDevCmdlets](#Show-GenXDevCmdlets) | cmds | Lists all installed GenXdev PowerShell modules and their associated cmdlets andaliases. Provides filtering capabilities for module names and cmdlet names. Candisplay results in console or open online documentation on GitHub. |
| [Show-Verb](#Show-Verb) | showverbs | Displays PowerShell approved verbs in a comma-separated list. If specific verbsare provided as input, only matching verbs will be shown. Supports wildcards. |
| [Start-TextToSpeech](#Start-TextToSpeech) | say | Uses the Windows Speech API to convert text to speech. This function providesflexible text-to-speech capabilities with support for different voices, locales,and synchronous/asynchronous playback options. It can handle both single stringsand arrays of text, with error handling for speech synthesis failures. |
| [Stop-TextToSpeech](#Stop-TextToSpeech) | sst | Halts all active and queued speech synthesis by canceling both standard andcustomized speech operations. This provides an immediate silence for any ongoingtext-to-speech activities. |
| [UtcNow](#UtcNow) |  | Returns the current UTC date and time as a System.DateTime object. This functionprovides a standardized way to retrieve UTC time across different systems andtime zones. The returned DateTime object can be used for timestampsynchronization, logging, and cross-timezone operations. |

<hr/>
&nbsp;

### GenXdev.Console.Spotify</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-SpotifyNewPlaylist](#Add-SpotifyNewPlaylist) | newplaylist | Creates a new Spotify playlist with the specified name, description, and privacysettings. The function authenticates with Spotify, creates the playlist, andupdates the local playlist cache. |
| [Add-SpotifyTracksToLiked](#Add-SpotifyTracksToLiked) | like | This function allows you to add one or more tracks to your Spotify liked songslibrary. If no track IDs are provided, it will attempt to like the currentlyplaying track. |
| [Add-SpotifyTracksToPlaylist](#Add-SpotifyTracksToPlaylist) | addtoplaylist | Adds one or more tracks to either a named Spotify playlist or a playlistspecified by its ID. Supports pipeline input for track URIs. |
| [Connect-SpotifyApiToken](#Connect-SpotifyApiToken) |  | Opens a browser window in application mode to handle the Spotify OAuthauthentication flow. Once authenticated, retrieves and stores the access token forsubsequent API calls. The browser window automatically closes after successfulauthentication. Uses port 5642 for the OAuth callback listener. |
| [Get-SpotifyActiveDevice](#Get-SpotifyActiveDevice) |  | Retrieves a list of Spotify devices that are currently marked as active for theauthenticated user's account. This includes devices like phones, computers,speakers, etc. that are currently available to play music. |
| [Get-SpotifyApiToken](#Get-SpotifyApiToken) |  | This function manages Spotify API authentication by either retrieving a cachedtoken or obtaining a new one. It also ensures proper firewall access andvalidates the token's functionality. |
| [Get-SpotifyCurrentlyPlaying](#Get-SpotifyCurrentlyPlaying) | gcp | Retrieves detailed information about the track currently playing on Spotify,including track name, artist, album, and playback status using the Spotify WebAPI. |
| [Get-SpotifyDevices](#Get-SpotifyDevices) |  | Retrieves a list of all Spotify devices that are currently available for theauthenticated user. This includes any active or recently active devices such assmartphones, computers, speakers, and other Spotify-enabled devices. |
| [Get-SpotifyLikedTracks](#Get-SpotifyLikedTracks) | liked | This function authenticates with Spotify using an API token and retrieves alltracks that the user has saved (liked) in their Spotify library. The tracks arereturned as collection of track objects containing metadata like title, artist,and album information. |
| [Get-SpotifyLyrics](#Get-SpotifyLyrics) | lyrics | Searches for and displays song lyrics by either:- Using a Spotify track ID- Searching for tracks by name/artist- Getting lyrics for currently playing trackIf lyrics aren't found on Musixmatch, opens a Google search as fallback. |
| [Get-SpotifyPlaylistIdsByName](#Get-SpotifyPlaylistIdsByName) |  | This function searches for Spotify playlists by name and returns theircorresponding IDs. It follows a three-step process:1. Searches in the current session's playlists2. Checks a local cache file if no results found3. Forces a fresh fetch if cache is outdated or missingThe function returns all playlist IDs that match the provided names. |
| [Get-SpotifyPlaylistTracks](#Get-SpotifyPlaylistTracks) | getplaylist | Retrieves all tracks from a Spotify playlist by either playlist name or ID. Whenusing playlist name, it will fetch the first matching playlist's ID and thenretrieve its tracks using the Spotify API. |
| [Get-SpotifyTrackAudioFeatures](#Get-SpotifyTrackAudioFeatures) | audiofeatures | This function connects to the Spotify API to fetch detailed audio features for thespecified tracks. Audio features include characteristics like danceability,energy, key, loudness, mode, speechiness, acousticness, instrumentalness,liveness, valence, tempo, and time signature. |
| [Get-SpotifyTrackById](#Get-SpotifyTrackById) | gettrack | Uses the Spotify Web API to fetch comprehensive track information includingartist, album, duration, popularity, and other metadata for a specific trackidentified by its Spotify track ID. |
| [Get-SpotifyUserPlaylists](#Get-SpotifyUserPlaylists) | gupl | Retrieves all playlists owned by the current Spotify user, with optionalfiltering. Results are cached for 12 hours to improve performance unless Force isspecified. |
| [Move-SpotifyLikedTracksToPlaylist](#Move-SpotifyLikedTracksToPlaylist) | moveliked | This function retrieves all tracks from your Spotify liked songs library and movesthem to one or more specified playlists. After successfully adding the tracks tothe target playlist(s), it removes them from your liked songs. |
| [Remove-SpotifyTracksFromLiked](#Remove-SpotifyTracksFromLiked) | dislike | Removes one or more tracks from the user's Spotify Liked Songs collection.If no track ID is provided, removes the currently playing track. |
| [Remove-SpotifyTracksFromPlaylist](#Remove-SpotifyTracksFromPlaylist) | removefromplaylist | Removes one or more tracks from either a named Spotify playlist or a playlistspecified by its ID. Supports pipeline input for track URIs. |
| [Search-Spotify](#Search-Spotify) | fm, sm | Searches Spotify's catalog for items matching the provided search query. Cansearch for tracks, albums, artists, playlists, shows, and episodes. Results arereturned through the pipeline. |
| [Search-SpotifyAndEnqueue](#Search-SpotifyAndEnqueue) | fmq, smq | Performs a search on Spotify using specified criteria and automatically adds thefirst matching result to the current playback queue. Supports searching fortracks, albums, artists, playlists, shows, and episodes. |
| [Search-SpotifyAndPlay](#Search-SpotifyAndPlay) | fmp, smp | Searches Spotify using the provided query string and automatically plays the firstmatching item on the currently active Spotify device. Can search for differenttypes of content including tracks, albums, artists, playlists, shows and episodes. |
| [Set-SpotifyActiveDevice](#Set-SpotifyActiveDevice) | Set-SpotifyDevice | Transfers playback to the specified Spotify device using the Spotify Web API.This cmdlet requires an authenticated Spotify session and a valid device ID.The device ID can be obtained using the Get-SpotifyDevices cmdlet. |
| [Set-SpotifyApiToken](#Set-SpotifyApiToken) |  | This function stores a provided Spotify API token in a local JSON file forsubsequent use by other Spotify-related commands. The token is saved in adedicated configuration directory under GenXdev.Local. |
| [Set-SpotifyNext](#Set-SpotifyNext) | next, skip | Advances playback to the next track in the current playlist or album on thecurrently active Spotify device. This function requires a valid Spotify API tokenand an active playback session. |
| [Set-SpotifyPause](#Set-SpotifyPause) | pausemusic, Resume-Music | Controls Spotify playback by pausing the currently playing track on the activedevice. If playback is already paused, this command will resume playback. |
| [Set-SpotifyPlaylistDetails](#Set-SpotifyPlaylistDetails) | spld | Modifies playlist properties including name, description, visibility andcollaboration settings using the Spotify API. |
| [Set-SpotifyPlaylistOrder](#Set-SpotifyPlaylistOrder) |  | Allows repositioning of one or more tracks within a Spotify playlist byspecifying the start position of items to move and their destination position.Requires valid Spotify API authentication. |
| [Set-SpotifyPrevious](#Set-SpotifyPrevious) | prev, previous | Controls Spotify playback by skipping to the previous track on the currentlyactive device. Requires valid Spotify API authentication token. |
| [Set-SpotifyRepeatContext](#Set-SpotifyRepeatContext) | repeat | Sets the current Spotify context (playlist, album, etc.) to repeat mode on theactive device. This affects the entire playback queue rather than a single track. |
| [Set-SpotifyRepeatOff](#Set-SpotifyRepeatOff) | norepeat, repeatoff | This function disables the repeat mode on the currently active Spotify deviceusing the Spotify Web API. It requires a valid Spotify API token which isautomatically retrieved using Get-SpotifyApiToken. |
| [Set-SpotifyRepeatSong](#Set-SpotifyRepeatSong) | repeatsong | Sets the repeat mode to 'track' for the currently active Spotify device using theSpotify Web API. This will make the current song play repeatedly until repeatmode is disabled. |
| [Set-SpotifyShuffleOff](#Set-SpotifyShuffleOff) | noshuffle, shuffleoff | Disables the shuffle playback mode on the currently active Spotify device. Thisfunction uses the Spotify Web API to modify the shuffle state of the playback. |
| [Set-SpotifyShuffleOn](#Set-SpotifyShuffleOn) | shuffle, shuffleon | Enables shuffle mode on the currently active Spotify playback device. Thisfunction requires a valid Spotify API token and an active playback session. |
| [Set-SpotifyStart](#Set-SpotifyStart) | play, Start-Music | This function initiates playback on the device that is currently active inSpotify. It uses the Spotify API token to authenticate the request and controlplayback. |
| [Set-SpotifyStop](#Set-SpotifyStop) | stop, Stop-Music | Stops the currently playing music on the active Spotify device by calling theSpotify Web API. Requires a valid authentication token. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/>

##	Search-Spotify
````PowerShell

   Search-Spotify                       --> fm, sm 
````

### SYNOPSIS
    Performs a Spotify search and returns matching items. 

### SYNTAX
````PowerShell

   Search-Spotify [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        The type(s) of items to search for. Valid values are: Album, Artist, Playlist, 
        Track, Show, Episode, or All. Default is Track. 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyNext [<CommonParameters>] 
````

### DESCRIPTION
    Advances playback to the next track in the current playlist or album on the 
    currently active Spotify device. This function requires a valid Spotify API token 
    and an active playback session. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Set-SpotifyStop
````PowerShell

   Set-SpotifyStop                      --> stop, Stop-Music 
````

### SYNOPSIS
    Stops Spotify playback on the active device. 

### SYNTAX
````PowerShell

   Set-SpotifyStop [<CommonParameters>] 
````

### DESCRIPTION
    Stops the currently playing music on the active Spotify device by calling the 
    Spotify Web API. Requires a valid authentication token. 

### PARAMETERS
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

   Set-SpotifyPause [<CommonParameters>] 
````

### DESCRIPTION
    Controls Spotify playback by pausing the currently playing track on the active 
    device. If playback is already paused, this command will resume playback. 

### PARAMETERS
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

   Set-SpotifyStart [<CommonParameters>] 
````

### DESCRIPTION
    This function initiates playback on the device that is currently active in 
    Spotify. It uses the Spotify API token to authenticate the request and control 
    playback. 

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

##	Get-SpotifyDevices
````PowerShell

   Get-SpotifyDevices 
````

### SYNOPSIS
    Returns all currently available Spotify devices for current user. 

### SYNTAX
````PowerShell

   Get-SpotifyDevices [<CommonParameters>] 
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
   PS C:\> Get-SpotifyDevices  
   This command returns all available Spotify devices for the current user. 
````

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

##	Set-SpotifyApiToken
````PowerShell

   Set-SpotifyApiToken 
````

### SYNOPSIS
    Caches a Spotify API token for later use in the local configuration. 

### SYNTAX
````PowerShell

   Set-SpotifyApiToken [-ApiToken] <String> [<CommonParameters>] 
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

   Set-SpotifyPrevious [<CommonParameters>] 
````

### DESCRIPTION
    Controls Spotify playback by skipping to the previous track on the currently 
    active device. Requires valid Spotify API authentication token. 

### PARAMETERS
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

##	Set-SpotifyRepeatOff
````PowerShell

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff 
````

### SYNOPSIS
    Disables Spotify repeat mode for the currently active device. 

### SYNTAX
````PowerShell

   Set-SpotifyRepeatOff [<CommonParameters>] 
````

### DESCRIPTION
    This function disables the repeat mode on the currently active Spotify device 
    using the Spotify Web API. It requires a valid Spotify API token which is 
    automatically retrieved using Get-SpotifyApiToken. 

### PARAMETERS
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

   Set-SpotifyShuffleOn [<CommonParameters>] 
````

### DESCRIPTION
    Enables shuffle mode on the currently active Spotify playback device. This 
    function requires a valid Spotify API token and an active playback session. 

### PARAMETERS
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

   Search-SpotifyAndPlay [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        The type of content to search for. Valid options are: 
        - Track (default) 
        - Album 
        - Artist 
        - Playlist 
        - Show 
        - Episode 
        - All 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyRepeatSong [<CommonParameters>] 
````

### DESCRIPTION
    Sets the repeat mode to 'track' for the currently active Spotify device using the 
    Spotify Web API. This will make the current song play repeatedly until repeat 
    mode is disabled. 

### PARAMETERS
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

   Set-SpotifyShuffleOff [<CommonParameters>] 
````

### DESCRIPTION
    Disables the shuffle playback mode on the currently active Spotify device. This 
    function uses the Spotify Web API to modify the shuffle state of the playback. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

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

##	Get-SpotifyLikedTracks
````PowerShell

   Get-SpotifyLikedTracks               --> liked 
````

### SYNOPSIS
    Retrieves all tracks saved in the user's Spotify Library. 

### SYNTAX
````PowerShell

   Get-SpotifyLikedTracks [<CommonParameters>] 
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

##	Set-SpotifyActiveDevice
````PowerShell

   Set-SpotifyActiveDevice              --> Set-SpotifyDevice 
````

### SYNOPSIS
    Sets the active Spotify playback device. 

### SYNTAX
````PowerShell

   Set-SpotifyActiveDevice [-DeviceId] <String> [<CommonParameters>] 
````

### DESCRIPTION
    Transfers playback to the specified Spotify device using the Spotify Web API. 
    This cmdlet requires an authenticated Spotify session and a valid device ID. 
    The device ID can be obtained using the Get-SpotifyDevices cmdlet. 

### PARAMETERS
    -DeviceId <String> 
        The Spotify device ID to transfer playback to. This is a unique identifier 
        assigned by Spotify to each playback device (speakers, computers, phones, etc.). 
        Use Get-SpotifyDevices to get a list of available device IDs. 
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

##	Search-SpotifyAndEnqueue
````PowerShell

   Search-SpotifyAndEnqueue             --> fmq, smq 
````

### SYNOPSIS
    Searches Spotify and adds the first matching item to the playback queue. 

### SYNTAX
````PowerShell

   Search-SpotifyAndEnqueue [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        Specifies the type(s) of content to search for. Valid options are: 
        - Track (default) 
        - Album 
        - Artist 
        - Playlist 
        - Show 
        - Episode 
        - All 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyPlaylistOrder [-PlaylistId] <String> [-RangeStart] <Int32> [-InsertBefore] <Int32> [[-RangeLength] <Nullable`1>]   
   [<CommonParameters>] 
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

   Set-SpotifyRepeatContext [<CommonParameters>] 
````

### DESCRIPTION
    Sets the current Spotify context (playlist, album, etc.) to repeat mode on the 
    active device. This affects the entire playback queue rather than a single track. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Get-SpotifyPlaylistTracks
````PowerShell

   Get-SpotifyPlaylistTracks            --> getplaylist 
````

### SYNOPSIS
    Returns all tracks from a Spotify playlist. 

### SYNTAX
````PowerShell

   Get-SpotifyPlaylistTracks [-PlaylistName] <String> [<CommonParameters>]  
   Get-SpotifyPlaylistTracks [-PlaylistId] <String> [<CommonParameters>] 
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

##	Set-SpotifyPlaylistDetails
````PowerShell

   Set-SpotifyPlaylistDetails           --> spld 
````

### SYNOPSIS
    Sets the main properties of a Spotify playlist. 

### SYNTAX
````PowerShell

   Set-SpotifyPlaylistDetails [-PlaylistId] <String> [-Name] <String> [[-Description] <String>] [-Public] [-Collabrative] [-Private]   
   [-NoCollabrations] [<CommonParameters>] 
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

##	Remove-SpotifyTracksFromLiked
````PowerShell

   Remove-SpotifyTracksFromLiked        --> dislike 
````

### SYNOPSIS
    Removes tracks from the user's Spotify Library (Liked Songs). 

### SYNTAX
````PowerShell

   Remove-SpotifyTracksFromLiked [[-TrackId] <String[]>] [<CommonParameters>] 
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

   Remove-SpotifyTracksFromPlaylist [-PlaylistName] <String[]> [[-Uri] <String[]>] [<CommonParameters>]  
   Remove-SpotifyTracksFromPlaylist [-PlaylistId] <String[]> [[-Uri] <String[]>] [<CommonParameters>] 
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

&nbsp;<hr/>
###	GenXdev.Console<hr/>

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

##	Show-Verb
````PowerShell

   Show-Verb                            --> showverbs 
````

### SYNOPSIS
    Shows a short alphabetical list of all PowerShell verbs. 

### SYNTAX
````PowerShell

   Show-Verb [[-Verb] <String[]>] [<CommonParameters>] 
````

### DESCRIPTION
    Displays PowerShell approved verbs in a comma-separated list. If specific verbs 
    are provided as input, only matching verbs will be shown. Supports wildcards. 

### PARAMETERS
    -Verb <String[]> 
        One or more verb patterns to filter the output. Supports wildcards. 
        If omitted, all approved verbs are shown. 
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

##	Invoke-Fasti
````PowerShell

   Invoke-Fasti                         --> Fasti 
````

### SYNOPSIS
    Extracts archive files in the current directory and deletes the originals. 

### SYNTAX
````PowerShell

   Invoke-Fasti [<CommonParameters>] 
````

### DESCRIPTION
    Automatically extracts common archive formats (zip, 7z, tar, etc.) found in the 
    current directory into individual folders named after each archive. After 
    successful extraction, the original archive files are deleted. Requires 7-Zip 
    to be installed on the system. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

### NOTES
````PowerShell

       Supported formats: 7z, zip, rar, tar, iso and many others.  
       Requires 7-Zip installation (will attempt auto-install via winget if missing).  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\Downloads>Invoke-Fasti  
   -------------------------- EXAMPLE 2 --------------------------  
   PS C:\Downloads>fasti 
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

##	Invoke-VLCPlayer
````PowerShell

   Invoke-VLCPlayer                     --> media, vlc 
````

### SYNOPSIS
    Plays media files using VLC player with flexible filtering options. 

### SYNTAX
````PowerShell

   Invoke-VLCPlayer [[-DirectoryPath] <String>] [[-Keywords] <String[]>] [[-SearchMask] <String>] [-OnlyVideos] [-OnlyAudio]   
   [-OnlyPictures] [-IncludeVideos] [-IncludeAudio] [-IncludePictures] [<CommonParameters>] 
````

### DESCRIPTION
    This function scans for media files in the specified directory, filters them based 
    on file type and optional keywords, creates a playlist, and launches VLC player. 
    It supports videos, audio files and pictures with automatic installation of VLC 
    if needed. 

### PARAMETERS
    -DirectoryPath <String> 
        The directory path to scan for media files. Defaults to current directory. 
        Required?                    false 
        Position?                    1 
        Default value                .\* 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -Keywords <String[]> 
        Keywords to search for in subtitle files (.srt) and media descriptions. 
        Required?                    false 
        Position?                    2 
        Default value                @() 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -SearchMask <String> 
        File pattern to filter media files. Default is "*". 
        Required?                    false 
        Position?                    3 
        Default value                * 
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

   Stop-TextToSpeech [<CommonParameters>] 
````

### DESCRIPTION
    Halts all active and queued speech synthesis by canceling both standard and 
    customized speech operations. This provides an immediate silence for any ongoing 
    text-to-speech activities. 

### PARAMETERS
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

##	Get-GenXDevCmdlets
````PowerShell

   Get-GenXDevCmdlets 
````

### SYNOPSIS
    Retrieves a list of all installed GenXdev modules, their cmdlets and aliases. 

### SYNTAX
````PowerShell

   Get-GenXDevCmdlets [[-Filter] <String>] [[-ModuleName] <String[]>] [<CommonParameters>] 
````

### DESCRIPTION
    Searches through installed GenXdev modules and returns detailed information about 
    their cmdlets, including names, aliases, and descriptions. Supports filtering by 
    module name and cmdlet name patterns. 

### PARAMETERS
    -Filter <String> 
        A search pattern to filter cmdlets. Supports wildcards. If no wildcards are 
        provided, pattern is wrapped with * on both sides. 
        Required?                    false 
        Position?                    1 
        Default value                * 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -ModuleName <String[]> 
        One or more GenXdev module names to search. Defaults to all modules (*). 
        The "GenXdev." prefix is optional and will be added if missing. 
        Required?                    false 
        Position?                    2 
        Default value                @("*") 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
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

   Set-LocationParent [<CommonParameters>] 
````

### DESCRIPTION
    This function navigates up one directory level in the file system hierarchy and 
    displays the contents of the new current directory. It provides a convenient '..' 
    alias for quick directory navigation. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Set-MonitorPowerOn
````PowerShell

   Set-MonitorPowerOn 
````

### SYNOPSIS
    Turns the monitor power on. 

### SYNTAX
````PowerShell

   Set-MonitorPowerOn [<CommonParameters>] 
````

### DESCRIPTION
    Uses the Windows API through GenXdev.Helpers.WindowObj to wake up the monitor 
    from sleep/power off state. This is useful for automation scripts that need to 
    ensure the monitor is powered on. 

### PARAMETERS
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

   Start-TextToSpeech [-Lines] <String[]> [-Locale <String>] [-VoiceName <String>] [-PassThru] [-Wait] [<CommonParameters>] 
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

   Set-LocationParent2 [<CommonParameters>] 
````

### DESCRIPTION
    Changes the current working directory to the grandparent directory (two levels up) 
    and displays the contents of the resulting directory. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Set-LocationParent3
````PowerShell

   Set-LocationParent3                  --> .... 
````

### SYNOPSIS
    Navigates up three directory levels in the file system hierarchy. 

### SYNTAX
````PowerShell

   Set-LocationParent3 [<CommonParameters>] 
````

### DESCRIPTION
    Changes the current working directory by moving up three parent directories in 
    the filesystem hierarchy and displays the contents of the resulting directory. 

### PARAMETERS
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

   Set-LocationParent4 [<CommonParameters>] 
````

### DESCRIPTION
    Provides a convenient way to move up four directory levels from the current 
    location in the filesystem. After navigation, displays the contents of the 
    resulting directory. 

### PARAMETERS
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

   Set-LocationParent5 [<CommonParameters>] 
````

### DESCRIPTION
    Changes the current working directory by moving up five parent directory levels 
    and displays the contents of the resulting directory. This function provides a 
    convenient shorthand alias '......' for quick navigation. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Set-MonitorPowerOff
````PowerShell

   Set-MonitorPowerOff 
````

### SYNOPSIS
    Turns off power to all connected monitors. 

### SYNTAX
````PowerShell

   Set-MonitorPowerOff [<CommonParameters>] 
````

### DESCRIPTION
    Uses Windows API calls to send a power-off signal to all connected monitors. This 
    is equivalent to pressing the physical power button on your monitors. The monitors 
    will enter power saving mode but can be awakened by moving the mouse or pressing 
    a key. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Show-GenXDevCmdlets
````PowerShell

   Show-GenXDevCmdlets                  --> cmds 
````

### SYNOPSIS
    Displays GenXdev PowerShell modules with their cmdlets and aliases. 

### SYNTAX
````PowerShell

   Show-GenXDevCmdlets [[-Filter] <String>] [-ModuleName <String[]>] [-Online] [<CommonParameters>] 
````

### DESCRIPTION
    Lists all installed GenXdev PowerShell modules and their associated cmdlets and 
    aliases. Provides filtering capabilities for module names and cmdlet names. Can 
    display results in console or open online documentation on GitHub. 

### PARAMETERS
    -Filter <String> 
        Pattern to filter cmdlets by name. Wildcards (*) are supported and automatically 
        added if not present. Example: "Get" becomes "*Get*" 
        Required?                    false 
        Position?                    1 
        Default value                * 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -ModuleName <String[]> 
        Array of module names to filter on. The "GenXdev." prefix is optional. 
        Supports wildcards (*). Filters modules based on these names. 
        Required?                    false 
        Position?                    named 
        Default value                @("*") 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -Online [<SwitchParameter>] 
        When specified, opens the GitHub documentation page instead of console output. 
        Links to the cmdlet index section of the module's README.md. 
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

##	Set-VLCPlayerFocused
````PowerShell

   Set-VLCPlayerFocused                 --> fvlc, showvlc, vlcf 
````

### SYNOPSIS
    Sets focus to the VLC media player window. 

### SYNTAX
````PowerShell

   Set-VLCPlayerFocused [<CommonParameters>] 
````

### DESCRIPTION
    Locates a running instance of VLC media player and brings its window to the 
    foreground, making it the active window. If VLC is not running, silently 
    continues without error. Uses Windows API calls to manipulate window focus. 

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

   New-MicrosoftShellTab [-DontCloseThisTab] [<CommonParameters>] 
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
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Get-FunctionDescription
````PowerShell

   Get-FunctionDescription 
````

### SYNOPSIS
    Helper function to extract function descriptions from help or script block. 

### SYNTAX
````PowerShell

   Get-FunctionDescription [[-Command] <FunctionInfo>] [<CommonParameters>] 
````

### DESCRIPTION

### PARAMETERS
    -Command <FunctionInfo> 
        The function info object to get the description for. 
        Required?                    false 
        Position?                    1 
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
###	GenXdev.Console.Spotify<hr/>

##	Search-Spotify
````PowerShell

   Search-Spotify                       --> fm, sm 
````

### SYNOPSIS
    Performs a Spotify search and returns matching items. 

### SYNTAX
````PowerShell

   Search-Spotify [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        The type(s) of items to search for. Valid values are: Album, Artist, Playlist, 
        Track, Show, Episode, or All. Default is Track. 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyNext [<CommonParameters>] 
````

### DESCRIPTION
    Advances playback to the next track in the current playlist or album on the 
    currently active Spotify device. This function requires a valid Spotify API token 
    and an active playback session. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Set-SpotifyStop
````PowerShell

   Set-SpotifyStop                      --> stop, Stop-Music 
````

### SYNOPSIS
    Stops Spotify playback on the active device. 

### SYNTAX
````PowerShell

   Set-SpotifyStop [<CommonParameters>] 
````

### DESCRIPTION
    Stops the currently playing music on the active Spotify device by calling the 
    Spotify Web API. Requires a valid authentication token. 

### PARAMETERS
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

   Set-SpotifyPause [<CommonParameters>] 
````

### DESCRIPTION
    Controls Spotify playback by pausing the currently playing track on the active 
    device. If playback is already paused, this command will resume playback. 

### PARAMETERS
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

   Set-SpotifyStart [<CommonParameters>] 
````

### DESCRIPTION
    This function initiates playback on the device that is currently active in 
    Spotify. It uses the Spotify API token to authenticate the request and control 
    playback. 

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

##	Get-SpotifyDevices
````PowerShell

   Get-SpotifyDevices 
````

### SYNOPSIS
    Returns all currently available Spotify devices for current user. 

### SYNTAX
````PowerShell

   Get-SpotifyDevices [<CommonParameters>] 
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
   PS C:\> Get-SpotifyDevices  
   This command returns all available Spotify devices for the current user. 
````

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

##	Set-SpotifyApiToken
````PowerShell

   Set-SpotifyApiToken 
````

### SYNOPSIS
    Caches a Spotify API token for later use in the local configuration. 

### SYNTAX
````PowerShell

   Set-SpotifyApiToken [-ApiToken] <String> [<CommonParameters>] 
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

   Set-SpotifyPrevious [<CommonParameters>] 
````

### DESCRIPTION
    Controls Spotify playback by skipping to the previous track on the currently 
    active device. Requires valid Spotify API authentication token. 

### PARAMETERS
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

##	Set-SpotifyRepeatOff
````PowerShell

   Set-SpotifyRepeatOff                 --> norepeat, repeatoff 
````

### SYNOPSIS
    Disables Spotify repeat mode for the currently active device. 

### SYNTAX
````PowerShell

   Set-SpotifyRepeatOff [<CommonParameters>] 
````

### DESCRIPTION
    This function disables the repeat mode on the currently active Spotify device 
    using the Spotify Web API. It requires a valid Spotify API token which is 
    automatically retrieved using Get-SpotifyApiToken. 

### PARAMETERS
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

   Set-SpotifyShuffleOn [<CommonParameters>] 
````

### DESCRIPTION
    Enables shuffle mode on the currently active Spotify playback device. This 
    function requires a valid Spotify API token and an active playback session. 

### PARAMETERS
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

   Search-SpotifyAndPlay [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        The type of content to search for. Valid options are: 
        - Track (default) 
        - Album 
        - Artist 
        - Playlist 
        - Show 
        - Episode 
        - All 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyRepeatSong [<CommonParameters>] 
````

### DESCRIPTION
    Sets the repeat mode to 'track' for the currently active Spotify device using the 
    Spotify Web API. This will make the current song play repeatedly until repeat 
    mode is disabled. 

### PARAMETERS
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

   Set-SpotifyShuffleOff [<CommonParameters>] 
````

### DESCRIPTION
    Disables the shuffle playback mode on the currently active Spotify device. This 
    function uses the Spotify Web API to modify the shuffle state of the playback. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

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

##	Get-SpotifyLikedTracks
````PowerShell

   Get-SpotifyLikedTracks               --> liked 
````

### SYNOPSIS
    Retrieves all tracks saved in the user's Spotify Library. 

### SYNTAX
````PowerShell

   Get-SpotifyLikedTracks [<CommonParameters>] 
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

##	Set-SpotifyActiveDevice
````PowerShell

   Set-SpotifyActiveDevice              --> Set-SpotifyDevice 
````

### SYNOPSIS
    Sets the active Spotify playback device. 

### SYNTAX
````PowerShell

   Set-SpotifyActiveDevice [-DeviceId] <String> [<CommonParameters>] 
````

### DESCRIPTION
    Transfers playback to the specified Spotify device using the Spotify Web API. 
    This cmdlet requires an authenticated Spotify session and a valid device ID. 
    The device ID can be obtained using the Get-SpotifyDevices cmdlet. 

### PARAMETERS
    -DeviceId <String> 
        The Spotify device ID to transfer playback to. This is a unique identifier 
        assigned by Spotify to each playback device (speakers, computers, phones, etc.). 
        Use Get-SpotifyDevices to get a list of available device IDs. 
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

##	Search-SpotifyAndEnqueue
````PowerShell

   Search-SpotifyAndEnqueue             --> fmq, smq 
````

### SYNOPSIS
    Searches Spotify and adds the first matching item to the playback queue. 

### SYNTAX
````PowerShell

   Search-SpotifyAndEnqueue [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>] 
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
    -SearchType <String[]> 
        Specifies the type(s) of content to search for. Valid options are: 
        - Track (default) 
        - Album 
        - Artist 
        - Playlist 
        - Show 
        - Episode 
        - All 
        Required?                    false 
        Position?                    named 
        Default value                @("Track") 
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

   Set-SpotifyPlaylistOrder [-PlaylistId] <String> [-RangeStart] <Int32> [-InsertBefore] <Int32> [[-RangeLength] <Nullable`1>]   
   [<CommonParameters>] 
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

   Set-SpotifyRepeatContext [<CommonParameters>] 
````

### DESCRIPTION
    Sets the current Spotify context (playlist, album, etc.) to repeat mode on the 
    active device. This affects the entire playback queue rather than a single track. 

### PARAMETERS
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Get-SpotifyPlaylistTracks
````PowerShell

   Get-SpotifyPlaylistTracks            --> getplaylist 
````

### SYNOPSIS
    Returns all tracks from a Spotify playlist. 

### SYNTAX
````PowerShell

   Get-SpotifyPlaylistTracks [-PlaylistName] <String> [<CommonParameters>]  
   Get-SpotifyPlaylistTracks [-PlaylistId] <String> [<CommonParameters>] 
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

##	Set-SpotifyPlaylistDetails
````PowerShell

   Set-SpotifyPlaylistDetails           --> spld 
````

### SYNOPSIS
    Sets the main properties of a Spotify playlist. 

### SYNTAX
````PowerShell

   Set-SpotifyPlaylistDetails [-PlaylistId] <String> [-Name] <String> [[-Description] <String>] [-Public] [-Collabrative] [-Private]   
   [-NoCollabrations] [<CommonParameters>] 
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

##	Remove-SpotifyTracksFromLiked
````PowerShell

   Remove-SpotifyTracksFromLiked        --> dislike 
````

### SYNOPSIS
    Removes tracks from the user's Spotify Library (Liked Songs). 

### SYNTAX
````PowerShell

   Remove-SpotifyTracksFromLiked [[-TrackId] <String[]>] [<CommonParameters>] 
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

   Remove-SpotifyTracksFromPlaylist [-PlaylistName] <String[]> [[-Uri] <String[]>] [<CommonParameters>]  
   Remove-SpotifyTracksFromPlaylist [-PlaylistId] <String[]> [[-Uri] <String[]>] [<CommonParameters>] 
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
