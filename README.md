<hr/>

![](https://genxdev.net/Powershell.jpg)

<hr/>

## NAME

    GenXdev.Console

## SYNOPSIS

    A collection of silly cmdlets to -speed up- or -improve on- certain commandline related tasks
## TYPE
    PowerShell Module

## INSTALLATION
````Powershell

    Install-Module "GenXdev.Console" -Force
    Import-Module "GenXdev.Console"

````

<br/><hr/><hr/><hr/><hr/><br/>
# Cmdlets
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
    Fasti
### SYNOPSIS
    Will extract all archive files (zip, 7z, tar, etc) found in current
    directory and then DELETE them
### SYNTAX
````PowerShell
Fasti [<CommonParameters>]
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

PS D:\downloads> Fasti
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
### NAME
    Set-LocationParent
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-LocationParent2
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-LocationParent3
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-LocationParent4
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Set-LocationParent5
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
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>