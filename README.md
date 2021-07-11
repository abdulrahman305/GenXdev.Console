<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Console
### SYNOPSIS
    A Windows PowerShell module for enhancing the commandline experience
[![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/) [![License](https://img.shields.io/github/license/renevaessen/GenXdev.Console?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ Text-to-speech
    * ✅ Spotify control
    * ✅ Microsoft Shell helpers
    * ✅ after installation, use 'cmds' to see full list of installed GenXdev cmdslets

### DEPENDENCIES
[![WinOS - Windows-10](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.Console" -Force
Import-Module "GenXdev.Console"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><br/>

# Cmdlet Index
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Connect-SpotifyApiToken](#Connect-SpotifyApiToken) |  | Uses Spotify Open-Auth to request an access token |
| [Enable-Screensaver](#Enable-Screensaver) |  | Starts the configured Windows screensaver |
| [Get-GenXDevCmdLets](#Get-GenXDevCmdLets) |  | Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases |
| [Get-SpotifyApiToken](#Get-SpotifyApiToken) |  | Returns a ApiToken for spotify |
| [Invoke-Fasti](#Invoke-Fasti) | Fasti | Will extract all archive files (zip, 7z, tar, etc) found in current directory and then DELETE them.Each archive file is extracted into their own directory with the same name as the file |
| [Invoke-Repeated](#Invoke-Repeated) | rpt | Pauses playback on the device that is active on Spotify |
| [New-MicrosoftShellTab](#New-MicrosoftShellTab) | x | Opens a new Windows Terminal tab and closes current by default |
| [Search-Spotify](#Search-Spotify) | fm, sm | Performs a spotify search and returns the search results |
| [Search-SpotifyAndPlay](#Search-SpotifyAndPlay) | fmp, smp | Performs a spotify search and plays the first found item on the active device |
| [Set-LocationParent](#Set-LocationParent) | .. | Provides the .. alias to go one directory up |
| [Set-LocationParent2](#Set-LocationParent2) | ... | Provides the ... alias to go two directory up |
| [Set-LocationParent3](#Set-LocationParent3) | .... | Provides the .... alias to go three directory up |
| [Set-LocationParent4](#Set-LocationParent4) | ..... | Provides the ..... alias to go four directory up |
| [Set-LocationParent5](#Set-LocationParent5) | ...... | Provides the ...... alias to go five directory up |
| [Set-MonitorPowerOff](#Set-MonitorPowerOff) |  | Turns the monitor power off |
| [Set-MonitorPowerOn](#Set-MonitorPowerOn) |  | Turns the monitor power on |
| [Set-SpotifyApiToken](#Set-SpotifyApiToken) |  | Caches an Spotify API-token for later use |
| [Set-SpotifyNext](#Set-SpotifyNext) | next, skip | Skips to next track on the device that is active on Spotify |
| [Set-SpotifyPause](#Set-SpotifyPause) | pausemusic, Resume-Music | Pauses playback on the device that is active on Spotify |
| [Set-SpotifyPrevious](#Set-SpotifyPrevious) | prev, previous | Skips to previous track on the device that is active on Spotify |
| [Set-SpotifyRepeatContext](#Set-SpotifyRepeatContext) | repeat | Enables playlist-repeat on the device that is active on Spotify |
| [Set-SpotifyRepeatOff](#Set-SpotifyRepeatOff) | norepeat, repeatoff | Disables repeat on the device that is active on Spotify |
| [Set-SpotifyRepeatSong](#Set-SpotifyRepeatSong) | repeatsong | Enables song-repeat on the device that is active on Spotify |
| [Set-SpotifyShuffleOff](#Set-SpotifyShuffleOff) | noshuffle, shuffleoff | Disables song-shuffle on the device that is active on Spotify |
| [Set-SpotifyShuffleOn](#Set-SpotifyShuffleOn) | shuffle, shuffleon | Enables song-shuffle on the device that is active on Spotify |
| [Set-SpotifyStart](#Set-SpotifyStart) | play, Start-Music | Starts playback on the device that is active on Spotify |
| [Set-SpotifyStop](#Set-SpotifyStop) | stop, Stop-Music | Stops playback on the device that is active on Spotify |
| [Show-GenXDevCmdLets](#Show-GenXDevCmdLets) | cmds | Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases |
| [Show-Verb](#Show-Verb) |  | Shows a short alphabetical list of all PowerShell verbs |
| [Start-TextToSpeech](#Start-TextToSpeech) | say | Will use the text-to-speech engine to speak out text |
| [Stop-TextToSpeech](#Stop-TextToSpeech) | sst | Will stop the text-to-speech engine from saying anything else |

<br/><hr/><hr/><br/>
# Cmdlets
## Connect-SpotifyApiToken
````PowerShell
Connect-SpotifyApiToken
````
### SYNOPSIS
    Uses Spotify Open-Auth to request an access token
### SYNTAX
````PowerShell
Connect-SpotifyApiToken [<CommonParameters>]
````
### DESCRIPTION
    Uses Spotify Open-Auth to request an access token
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Enable-Screensaver
````PowerShell
Enable-Screensaver
````
### SYNOPSIS
    Starts the configured Windows screensaver
### SYNTAX
````PowerShell
Enable-Screensaver [<CommonParameters>]
````
### DESCRIPTION
    Starts the configured Windows screensaver
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Get-GenXDevCmdLets
````PowerShell
Get-GenXDevCmdLets
````
### SYNOPSIS
    Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases
### SYNTAX
````PowerShell
Get-GenXDevCmdLets [[-Filter] <String>] [-ModuleName <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases
### PARAMETERS
    -Filter <String>
        Allows you to search for cmdLets by providing searchstrings, with or without wildcards
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -ModuleName <String[]>
        Required?                    false
        Position?                    named
        Default value                @("GenXdev.*")
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Get-SpotifyApiToken
````PowerShell
Get-SpotifyApiToken
````
### SYNOPSIS
    Returns a ApiToken for spotify
### SYNTAX
````PowerShell
Get-SpotifyApiToken [<CommonParameters>]
````
### DESCRIPTION
    Returns a ApiToken for spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Invoke-Fasti
````PowerShell
Invoke-Fasti                         --> Fasti
````
### SYNOPSIS
    Will extract all archive files (zip, 7z, tar, etc) found in current directory and then DELETE them
### SYNTAX
````PowerShell
Invoke-Fasti [<CommonParameters>]
````
### DESCRIPTION
    Will extract all archive files (zip, 7z, tar, etc) found in current directory and then DELETE them.
    Each archive file is extracted into their own directory with the same name as the file
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
### NOTES
````PowerShell
    You need 7z installed
-------------------------- EXAMPLE 1 --------------------------
PS D:\downloads>Invoke-Fasti
````
<br/><hr/><hr/><br/>
## Invoke-Repeated
````PowerShell
Invoke-Repeated                      --> rpt
````
### SYNOPSIS
    Pauses Spotify playback
### SYNTAX
````PowerShell
Invoke-Repeated [-script] <String> [<CommonParameters>]
````
### DESCRIPTION
    Pauses playback on the device that is active on Spotify
### PARAMETERS
    -script <String>
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## New-MicrosoftShellTab
````PowerShell
New-MicrosoftShellTab                --> x
````
### SYNOPSIS
    Opens a new Windows Terminal tab
### SYNTAX
````PowerShell
New-MicrosoftShellTab [-DontCloseThisTab] [<CommonParameters>]
````
### DESCRIPTION
    Opens a new Windows Terminal tab and closes current by default
### PARAMETERS
    -DontCloseThisTab [<SwitchParameter>]
        Keeps current tab open
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Search-Spotify
````PowerShell
Search-Spotify                       --> fm, sm
````
### SYNOPSIS
    Performs a spotify search and returns the search results
### SYNTAX
````PowerShell
Search-Spotify [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    Performs a spotify search and returns the search results
### PARAMETERS
    -Queries <String[]>
        The search phrase
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -SearchType <String[]>
        Optionally, the type of item to search for
        Required?                    false
        Position?                    named
        Default value                @("Track")
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Search-SpotifyAndPlay
````PowerShell
Search-SpotifyAndPlay                --> fmp, smp
````
### SYNOPSIS
    Performs a spotify search and plays the first found item
### SYNTAX
````PowerShell
Search-SpotifyAndPlay [-Queries] <String[]> [-SearchType <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    Performs a spotify search and plays the first found item on the active device
### PARAMETERS
    -Queries <String[]>
        The search phrase
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -SearchType <String[]>
        Optionally, the type of item to search for
        Required?                    false
        Position?                    named
        Default value                @("Track")
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-LocationParent
````PowerShell
Set-LocationParent                   --> ..
````
### SYNOPSIS
    Provides the .. alias to go one directory up
### SYNTAX
````PowerShell
Set-LocationParent [<CommonParameters>]
````
### DESCRIPTION
    Provides the .. alias to go one directory up
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-LocationParent2
````PowerShell
Set-LocationParent2                  --> ...
````
### SYNOPSIS
    Provides the ... alias to go two directory up
### SYNTAX
````PowerShell
Set-LocationParent2 [<CommonParameters>]
````
### DESCRIPTION
    Provides the ... alias to go two directory up
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-LocationParent3
````PowerShell
Set-LocationParent3                  --> ....
````
### SYNOPSIS
    Provides the .... alias to go three directory up
### SYNTAX
````PowerShell
Set-LocationParent3 [<CommonParameters>]
````
### DESCRIPTION
    Provides the .... alias to go three directory up
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-LocationParent4
````PowerShell
Set-LocationParent4                  --> .....
````
### SYNOPSIS
    Provides the ..... alias to go four directory up
### SYNTAX
````PowerShell
Set-LocationParent4 [<CommonParameters>]
````
### DESCRIPTION
    Provides the ..... alias to go four directory up
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-LocationParent5
````PowerShell
Set-LocationParent5                  --> ......
````
### SYNOPSIS
    Provides the ...... alias to go five directory up
### SYNTAX
````PowerShell
Set-LocationParent5 [<CommonParameters>]
````
### DESCRIPTION
    Provides the ...... alias to go five directory up
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-MonitorPowerOff
````PowerShell
Set-MonitorPowerOff
````
### SYNOPSIS
    Turns the monitor power off
### SYNTAX
````PowerShell
Set-MonitorPowerOff [<CommonParameters>]
````
### DESCRIPTION
    Turns the monitor power off
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-MonitorPowerOn
````PowerShell
Set-MonitorPowerOn
````
### SYNOPSIS
    Turns the monitor power on
### SYNTAX
````PowerShell
Set-MonitorPowerOn [<CommonParameters>]
````
### DESCRIPTION
    Turns the monitor power on
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyApiToken
````PowerShell
Set-SpotifyApiToken
````
### SYNOPSIS
    Caches an Spotify API-token for later use
### SYNTAX
````PowerShell
Set-SpotifyApiToken [-ApiToken] <String> [<CommonParameters>]
````
### DESCRIPTION
    Caches an Spotify API-token for later use
### PARAMETERS
    -ApiToken <String>
        The API-token to cache
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyNext
````PowerShell
Set-SpotifyNext                      --> next, skip
````
### SYNOPSIS
    Skips to next track on Spotify
### SYNTAX
````PowerShell
Set-SpotifyNext [<CommonParameters>]
````
### DESCRIPTION
    Skips to next track on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyPause
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
    Pauses playback on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyPrevious
````PowerShell
Set-SpotifyPrevious                  --> prev, previous
````
### SYNOPSIS
    Skips to previous track on Spotify
### SYNTAX
````PowerShell
Set-SpotifyPrevious [<CommonParameters>]
````
### DESCRIPTION
    Skips to previous track on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyRepeatContext
````PowerShell
Set-SpotifyRepeatContext             --> repeat
````
### SYNOPSIS
    Enables Spotify playlist-repeat
### SYNTAX
````PowerShell
Set-SpotifyRepeatContext [<CommonParameters>]
````
### DESCRIPTION
    Enables playlist-repeat on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyRepeatOff
````PowerShell
Set-SpotifyRepeatOff                 --> norepeat, repeatoff
````
### SYNOPSIS
    Disables Spotify repeat
### SYNTAX
````PowerShell
Set-SpotifyRepeatOff [<CommonParameters>]
````
### DESCRIPTION
    Disables repeat on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyRepeatSong
````PowerShell
Set-SpotifyRepeatSong                --> repeatsong
````
### SYNOPSIS
    Enables Spotify song-repeat
### SYNTAX
````PowerShell
Set-SpotifyRepeatSong [<CommonParameters>]
````
### DESCRIPTION
    Enables song-repeat on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyShuffleOff
````PowerShell
Set-SpotifyShuffleOff                --> noshuffle, shuffleoff
````
### SYNOPSIS
    Disables Spotify song-shuffle
### SYNTAX
````PowerShell
Set-SpotifyShuffleOff [<CommonParameters>]
````
### DESCRIPTION
    Disables song-shuffle on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyShuffleOn
````PowerShell
Set-SpotifyShuffleOn                 --> shuffle, shuffleon
````
### SYNOPSIS
    Enables Spotify song-shuffle
### SYNTAX
````PowerShell
Set-SpotifyShuffleOn [<CommonParameters>]
````
### DESCRIPTION
    Enables song-shuffle on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyStart
````PowerShell
Set-SpotifyStart                     --> play, Start-Music
````
### SYNOPSIS
    Starts Spotify playback
### SYNTAX
````PowerShell
Set-SpotifyStart [<CommonParameters>]
````
### DESCRIPTION
    Starts playback on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Set-SpotifyStop
````PowerShell
Set-SpotifyStop                      --> stop, Stop-Music
````
### SYNOPSIS
    Stops Spotify playback
### SYNTAX
````PowerShell
Set-SpotifyStop [<CommonParameters>]
````
### DESCRIPTION
    Stops playback on the device that is active on Spotify
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Show-GenXDevCmdLets
````PowerShell
Show-GenXDevCmdLets                  --> cmds
````
### SYNOPSIS
    Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases
### SYNTAX
````PowerShell
Show-GenXDevCmdLets [[-Filter] <String>] [-ModuleName <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases
### PARAMETERS
    -Filter <String>
        Allows you to search for cmdLets by providing searchstrings, with or without wildcards
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -ModuleName <String[]>
        Required?                    false
        Position?                    named
        Default value                @("GenXdev.*")
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Show-Verb
````PowerShell
Show-Verb
````
### SYNOPSIS
    Shows a short alphabetical list of all PowerShell verbs
### SYNTAX
````PowerShell
Show-Verb [[-Verb] <String[]>] [<CommonParameters>]
````
### DESCRIPTION
    Shows a short alphabetical list of all PowerShell verbs
### PARAMETERS
    -Verb <String[]>
        Required?                    false
        Position?                    1
        Default value                @()
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
<br/><hr/><hr/><br/>
## Start-TextToSpeech
````PowerShell
Start-TextToSpeech                   --> say
````
### SYNOPSIS
    Will use the text-to-speech engine to speak out text
### SYNTAX
````PowerShell
Start-TextToSpeech -lines <String[]> [-wait] [<CommonParameters>]
````
### DESCRIPTION
    Will use the text-to-speech engine to speak out text
### PARAMETERS
    -lines <String[]>
        Required?                    true
        Position?                    named
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  false
    -wait [<SwitchParameter>]
        Will wait until all text is spoken
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
### NOTES
````PowerShell
    See also: Stop-TextToSpeech -> sst, and Skip-TextToSpeech -> sstSkip
-------------------------- EXAMPLE 1 --------------------------
PS C:\> say "Good morning"
PS C:\> "Good morning" | Start-TextToSpeech
````
<br/><hr/><hr/><br/>
## Stop-TextToSpeech
````PowerShell
Stop-TextToSpeech                    --> sst
````
### SYNOPSIS
    Will stop the text-to-speech engine from saying anything else
### SYNTAX
````PowerShell
Stop-TextToSpeech [<CommonParameters>]
````
### DESCRIPTION
    Will stop the text-to-speech engine from saying anything else
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 
### NOTES
````PowerShell
    See also: Start-TextToSpeech -> say, and Skip-TextToSpeech -> sstSkip
-------------------------- EXAMPLE 1 --------------------------
PS C:\> say "Good morning"; say "Good evening"; Stop-TextToSpeech; # -> "G.."
````
<br/><hr/><hr/><br/>