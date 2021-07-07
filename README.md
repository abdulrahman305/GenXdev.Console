<hr/>

<img src="powershell.jpg" alt="drawing" width="50%"/>

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

<br/><hr/><hr/><hr/><hr/><br/>
# Cmdlets
### NAME
````PowerShell
Set-SpotifyStart                     --> play, Start-Music
````

<hr/>

### NAME
````PowerShell
Set-SpotifyPause                     --> pausemusic, Resume-Music
````

<hr/>

### NAME
````PowerShell
Set-SpotifyStop                      --> Stop-Music
````

<hr/>


### NAME
````PowerShell
Set-SpotifyNext                      --> skip, next
````
<hr/>


### NAME
````PowerShell
Set-SpotifyPrevious                  --> prev, previous
````

<hr/>

### NAME
````PowerShell
Set-SpotifyRepeatContext             --> repeat
````

<hr/>

### NAME
````PowerShell
Set-SpotifyRepeatOff                 --> norepeat, repeatoff
````

<hr/>

### NAME
````PowerShell
Set-SpotifyRepeatSong                --> repeatsong
````

<hr/>

### NAME
````PowerShell
Set-SpotifyShuffleOff                --> noshuffle, shuffleoff
````

<hr/>

### NAME
````PowerShell
Set-SpotifyShuffleOn                 --> shuffle, shuffleon
````

<br/><hr/><hr/><hr/><hr/><br/>

### NAME
````PowerShell
    Set-LocationParent                   --> ..
````

<hr/>

### NAME
````PowerShell
    Set-LocationParent2                  --> ...
````

<hr/>

### NAME
````PowerShell
    Set-LocationParent3                  --> ....
````

<hr/>

### NAME
````PowerShell
    Set-LocationParent4                  --> .....
````

<hr/>

### NAME
````PowerShell
    Set-LocationParent5                  --> ......
````

<hr/>

### NAME
````PowerShell
    Enable-Screensaver
````

<hr/>

### NAME
````PowerShell
    Set-MonitorPowerOff
````

<hr/>

### NAME
````PowerShell
    Set-MonitorPowerOff
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Show-GenXDevCmdLets -> cmds
### SYNOPSIS
    Shows a list of all installed GenXdev modules and their Cmdlets and
    corresponding aliases
### SYNTAX
````PowerShell
Show-GenXDevCmdLets [[-Filter] <String>] [<CommonParameters>]
````
### DESCRIPTION
    Shows a list of all installed GenXdev modules and their Cmdlets and
    corresponding aliases
### PARAMETERS
    -Filter <String>
        Allows you to search for cmdLets by providing searchstrings, with or
        without wildcards
        Required?                    false
        Position?                    1
        Default value                *
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
-------------------------- EXAMPLE 1 --------------------------
PS C:\> cmds
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Invoke-Fasti
### SYNOPSIS
    Will extract all archive files (zip, 7z, tar, etc) found in current
    directory and then DELETE them
### SYNTAX
````PowerShell
Invoke-Fasti [<CommonParameters>]
````
### DESCRIPTION
    Will extract all archive files (zip, 7z, tar, etc) found in current
    directory and then DELETE them.
    Each archive file is extracted into their own directory with the same name
    as the file
### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    You need 7z installed

    Supported archive types:

    *.7z, *.xz, *.bzip2, *.gzip, *.tar, *.zip, *.wim, *.ar, *.arj, *.cab, *.chm, *.cpio, *.cramfs,
    *.dmg, *.ext, *.fat, *.gpt, *.hfs, *.ihex, *.iso, *.lzh, *.lzma, *.mbr, *.msi, *.nsis, *.ntfs,
    *.qcow2, *.rar, *.rpm, *.squashfs, *.udf, *.uefi, *.vdi, *.vhd, *.vmdk, *.wim, *.xar, *.z

-------------------------- EXAMPLE 1 --------------------------

PS D:\downloads> Invoke-Fasti
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    New-MicrosoftShellTab
### SYNTAX
````PowerShell
New-MicrosoftShellTab [-DontCloseThisTab] [<CommonParameters>]
````
### PARAMETERS
    -DontCloseThisTab
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Start-TextToSpeech
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    See also: Stop-TextToSpeech -> sst, and Skip-TextToSpeech -> sstSkip

-------------------------- EXAMPLE 1 --------------------------

PS C:\> say "Good morning"

PS C:\> "Good morning" | Start-TextToSpeech
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Stop-TextToSpeech
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    See also: Start-TextToSpeech -> say, and Skip-TextToSpeech -> sstSkip
-------------------------- EXAMPLE 1 --------------------------
PS C:\> say "Good morning"; say "Good evening"; Stop-TextToSpeech; # -> "G.."
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Convert-JsonToXml
### SYNTAX
````PowerShell
Convert-JsonToXml [[-json] <string[]>] [<CommonParameters>]
````
### PARAMETERS
    -json <string[]>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (ByValue)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><hr/><hr/><br/>