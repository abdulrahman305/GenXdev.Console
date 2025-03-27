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

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Spotify<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Console.Vlc<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
