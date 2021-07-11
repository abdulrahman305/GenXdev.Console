######################################################################################################################################################
######################################################################################################################################################

<#
.SYNOPSIS
Will stop the text-to-speech engine from saying anything else

.DESCRIPTION
Will stop the text-to-speech engine from saying anything else

.EXAMPLE
PS C:\> say "Good morning"; say "Good evening"; Stop-TextToSpeech; # -> "G.."

.NOTES
See also: Start-TextToSpeech -> say, and Skip-TextToSpeech -> sstSkip
#>
function Stop-TextToSpeech {

    [Alias("sst")]
    param()

    if ($null -eq $Global:SpeechSynthesizer) {

        $Global:SpeechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer
    }

    $Global:SpeechSynthesizer.SpeakAsyncCancelAll();
}


######################################################################################################################################################
<#
.SYNOPSIS
Will use the text-to-speech engine to speak out text

.DESCRIPTION
Will use the text-to-speech engine to speak out text

.PARAMETER input
The text to speak

.PARAMETER wait
Will wait until all text is spoken

.EXAMPLE
PS C:\> say "Good morning"

PS C:\> "Good morning" | Start-TextToSpeech

.NOTES
See also: Stop-TextToSpeech -> sst, and Skip-TextToSpeech -> sstSkip
#>
function Start-TextToSpeech {

    [Alias("say")]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromRemainingArguments = $true, ParameterSetName = "strings")]
        [string[]] $lines = $null,

        [Parameter(Mandatory = $False)]
        [switch] $wait
    )

    Begin {

        if ($null -eq $Global:SpeechSynthesizer) {

            $Global:SpeechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer
        }
    }

    Process {

        @($lines) | ForEach-Object -Process {

            $txt = $PSItem

            if ($txt -isnot [string]) {

                $txt = "$txt"
            }

            if ($wait -eq $true) {

                $Global:SpeechSynthesizer.Speak((($txt -replace '\-[\r]*\n', ' ') -replace '[\r]*\n', ' ')) | Out-Null
            }
            else {
                $Global:SpeechSynthesizer.SpeakAsync((($txt -replace '\-[\r]*\n', ' ') -replace '[\r]*\n', ' ')) | Out-Null
            }
        }
    }
}

######################################################################################################################################################
<#
.SYNOPSIS
Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.DESCRIPTION
Retreives a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.PARAMETER Filter
Allows you to search for cmdLets by providing searchstrings, with or without wildcards

.PARAMETER $ModuleName
Retreives all Cmdlets of provided modulename(s)

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Get-GenXDevCmdLets {

    [CmdletBinding()]
    [Alias("cmds")]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Filter = "*",

        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false
        )]
        [string[]] $ModuleName = @("GenXdev.*")
    )

    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    Get-Module $ModuleName |
    ForEach-Object -Process {

        $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.Name -like $Filter) {

                if ($PSItem.CommandType -eq "Function") {

                    $aliases = ((Get-Alias -Definition $PSItem.Name -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();

                    $nameAndAliases = ""

                    if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {

                        $nameAndAliases = "$($PSItem.Name) --> $aliases"
                    }
                    else {
                        $nameAndAliases = $PSItem.Name
                    }

                    $desc = (Get-Help $PSItem.Name -Detailed).Description.Text;

                    if ([string]::IsNullOrWhiteSpace($desc)) {

                        try {
                            $desc = Select-String "#\s*DESCRIPTION\s+$($PSItem.Name): ([^`r`n]*)" -input "$((Get-Command "$($PSItem.Name)").ScriptBlock)" -AllMatches | ForEach-Object { $_.matches.Groups[1].Value }
                        }
                        catch {
                            Write-Warning $_.Exception
                        }
                    }

                    $result = @{
                        NameAndAliases = $nameAndAliases;
                        Name           = $PSItem.Name;
                        Aliases        = $aliases;
                        Description    = $desc;
                    }

                    $result
                }
            }
        }
    }
}

######################################################################################################################################################
<#
.SYNOPSIS
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.DESCRIPTION
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.PARAMETER Filter
Allows you to search for cmdLets by providing searchstrings, with or without wildcards

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Show-GenXDevCmdLets {

    [CmdletBinding()]
    [Alias("cmds")]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Filter = "*",

        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false
        )]
        [string[]] $ModuleName = @("GenXdev.*")
    )

    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }


    Clear-Host

    Get-Module $ModuleName |
    ForEach-Object -Process {

        $module = $PSItem
        $first = $true;

        $result = [string]::Join(", ", @(
                $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

                    if ($PSItem.Name -like $Filter) {

                        if ($first) {

                            "`r`n" + $module.Name.SubString("GenXdev.".Length) + ":" | Write-Host -ForegroundColor "Yellow"
                        }

                        $first = $false;

                        if ($PSItem.CommandType -eq "Function") {

                            $aliases = ((Get-Alias -Definition $PSItem.Name -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();

                            if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {

                                "$($PSItem.Name) --> $aliases"
                            }
                            else {
                                $PSItem.Name
                            }
                        }
                    }
                }
            )
        ).Trim("`r`n ".ToCharArray())

        $result
    }
    "
-------------" | Write-Host -ForegroundColor "DarkGreen"
}

######################################################################################################################################################

<#
.SYNOPSIS
Opens a new Windows Terminal tab

.DESCRIPTION
Opens a new Windows Terminal tab and closes current by default

.PARAMETER DontCloseThisTab
Keeps current tab open
#>
function New-MicrosoftShellTab {

    [CmdletBinding()]
    [Alias("x")]

    param(

        [switch] $DontCloseThisTab
    )
    Begin {

        try {
            $helper = New-Object -ComObject WScript.Shell;
            $helper.sendKeys("^+t");

            if ($DontCloseThisTab -ne $true) {
                Start-Sleep 3
                exit
            }
        }
        catch {

        }
    }
}

######################################################################################################################################################

<#
.SYNOPSIS
Will extract all archive files (zip, 7z, tar, etc) found in current directory and then DELETE them

.DESCRIPTION
Will extract all archive files (zip, 7z, tar, etc) found in current directory and then DELETE them.
Each archive file is extracted into their own directory with the same name as the file

.EXAMPLE
PS D:\downloads> Invoke-Fasti

.NOTES
You need 7z installed
#>
function Invoke-Fasti {

    [Alias("Fasti")]
    param()

    Get-ChildItem @("*.7z", "*.xz", "*.bzip2", "*.gzip", "*.tar", "*.zip", "*.wim", "*.ar", "*.arj", "*.cab", "*.chm", "*.cpio", "*.cramfs", "*.dmg", "*.ext", "*.fat", "*.gpt", "*.hfs", "*.ihex", "*.iso", "*.lzh", "*.lzma", "*.mbr", "*.msi", "*.nsis", "*.ntfs", "*.qcow2", "*.rar", "*.rpm", "*.squashfs", "*.udf", "*.uefi", "*.vdi", "*.vhd", "*.vmdk", "*.wim", "*.xar", "*.z") -File -ErrorAction SilentlyContinue  | ForEach-Object {

        $7z = "7z"
        $zip = $_.fullname;
        $n = [system.IO.Path]::GetFileNameWithoutExtension($zip);
        $p = [System.IO.Path]::GetDirectoryName($zip);
        $r = [system.Io.Path]::Combine($p, $n);

        if ([System.IO.Directory]::exists($r) -eq $false) {

            [System.IO.Directory]::CreateDirectory($r)
        }

        if ((Get-Command $7z -ErrorAction SilentlyContinue).Length -eq 0) {

            $7z = "C:\Program Files\7-Zip\7z.exe";

            if (![IO.File]::Exists($7z)) {

                if ((Get-Command winget -ErrorAction SilentlyContinue).Length -eq 0) {

                    throw "You need to install 7zip or winget first";
                }

                winget install 7zip

                if (![IO.File]::Exists($7z)) {

                    throw "You need to install 7-zip";
                }
            }
        }

        & $7z x -y "-o$r" $zip;

        if ($?) {

            try {
                Remove-Item "$zip" -Force -ErrorAction silentlycontinue
            }
            catch {
            }
        }
    }
}

######################################################################################################################################################
<#
.SYNOPSIS
Provides the .. alias to go one directory up

.DESCRIPTION
Provides the .. alias to go one directory up
#>
Function Set-LocationParent {

    [Alias("..")]
    param (

    )

    Set-Location ..
    Get-ChildItem
}
######################################################################################################################################################
<#
.SYNOPSIS
Provides the ... alias to go two directory up

.DESCRIPTION
Provides the ... alias to go two directory up
#>
Function Set-LocationParent2 {

    [Alias("...")]
    param (

    )

    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
######################################################################################################################################################
<#
.SYNOPSIS
Provides the .... alias to go three directory up

.DESCRIPTION
Provides the .... alias to go three directory up
#>
Function Set-LocationParent3 {

    [Alias("....")]
    param (

    )

    Set-Location ..
    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
######################################################################################################################################################
<#
.SYNOPSIS
Provides the ..... alias to go four directory up

.DESCRIPTION
Provides the ..... alias to go four directory up
#>
Function Set-LocationParent4 {

    [Alias(".....")]
    param (

    )

    Set-Location ..
    Set-Location ..
    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
######################################################################################################################################################
<#
.SYNOPSIS
Provides the ...... alias to go five directory up

.DESCRIPTION
Provides the ...... alias to go five directory up
#>
Function Set-LocationParent5 {

    [Alias("......")]
    param (

    )

    Set-Location ..
    Set-Location ..
    Set-Location ..
    Set-Location ..
    Set-Location ..
    Get-ChildItem
}

######################################################################################################################################################
<#
.SYNOPSIS
Returns a ApiToken for spotify

.DESCRIPTION
Returns a ApiToken for spotify
#>
function Get-SpotifyApiToken {

    param()

    $path = "$PSScriptRoot\..\..\GenXdev.Local\Spotify_Auth.json";

    if ([IO.File]::Exists($path)) {

        $ApiToken = [IO.File]::ReadAllText($path);
    }
    else {

        $ApiToken = Connect-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }

    try {

        [GenXdev.Console.Spotify]::GetActiveDevices($ApiToken) | Out-Null
    }
    catch {

        $ApiToken = Connect-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }


    $ApiToken
}

######################################################################################################################################################
<#
.SYNOPSIS
Caches an Spotify API-token for later use

.DESCRIPTION
Caches an Spotify API-token for later use

.PARAMETER ApiToken
The API-token to cache
#>
function Set-SpotifyApiToken {

    param(

        [parameter(
            Mandatory = $true,
            Position = 0
        )] [string] $ApiToken
    )

    $dir = "$PSScriptRoot\..\..\GenXdev.Local";
    $path = "$dir\Spotify_Auth.json";

    if (![IO.Directory]::Exists($dir)) {

        [IO.Directory]::CreateDirectory($dir);
    }

    [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "));
}

######################################################################################################################################################
<#
.SYNOPSIS
Uses Spotify Open-Auth to request an access token

.DESCRIPTION
Uses Spotify Open-Auth to request an access token

#>
function Connect-SpotifyApiToken {

    Write-Warning "Spotify access token expired, requesting new.."

    $url = [GenXdev.Console.Spotify]::RequestAuthenticationUri(5642);

    [System.Diagnostics.Process] $process = Open-Webbrowser -PassThrough -ApplicationMode -NewWindow -Width 1000 -Height 800 -Centered -Monitor 0 -Url $url

    [GenXdev.Console.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

    if ((!!$process -and $process -is [System.Diagnostics.Process]) -and (!$process.HasExited)) {

        $process.CloseMainWindow() | Out-Null
    }
}

######################################################################################################################################################
<#
.SYNOPSIS
Stops Spotify playback

.DESCRIPTION
Stops playback on the device that is active on Spotify
#>
function Set-SpotifyStop {

    [Alias("stop", "Stop-Music")]
    param()
    [GenXdev.Console.Spotify]::Stop((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Starts Spotify playback

.DESCRIPTION
Starts playback on the device that is active on Spotify
#>
function Set-SpotifyStart {

    [Alias("play", "Start-Music")]
    param()

    [GenXdev.Console.Spotify]::Start((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Pauses playback on the device that is active on Spotify
#>
function Set-SpotifyPause {

    [Alias("pausemusic", "Resume-Music")]
    param()

    [GenXdev.Console.Spotify]::Pause((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Skips to previous track on Spotify

.DESCRIPTION
Skips to previous track on the device that is active on Spotify
#>
function Set-SpotifyPrevious {

    [Alias("previous", "prev")]
    param()

    [GenXdev.Console.Spotify]::Previous((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Skips to next track on Spotify

.DESCRIPTION
Skips to next track on the device that is active on Spotify
#>
function Set-SpotifyNext {

    [Alias("next", "skip")]
    param()

    [GenXdev.Console.Spotify]::Next((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Enables Spotify song-repeat

.DESCRIPTION
Enables song-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatSong {

    [Alias("repeatsong")]
    param()

    [GenXdev.Console.Spotify]::RepeatSong((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Enables Spotify playlist-repeat

.DESCRIPTION
Enables playlist-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatContext {

    [Alias("repeat")]
    param()

    [GenXdev.Console.Spotify]::RepeatContext((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Disables Spotify repeat

.DESCRIPTION
Disables repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatOff {

    [Alias("norepeat", "repeatoff")]
    param()

    [GenXdev.Console.Spotify]::RepeatOff((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Enables Spotify song-shuffle

.DESCRIPTION
Enables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOn {

    [Alias("shuffle", "shuffleon")]
    param()

    [GenXdev.Console.Spotify]::ShuffleOn((Get-SpotifyApiToken));
}
######################################################################################################################################################
<#
.SYNOPSIS
Disables Spotify song-shuffle

.DESCRIPTION
Disables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOff {

    [Alias("noshuffle", "shuffleoff")]
    param()

    [GenXdev.Console.Spotify]::ShuffleOff((Get-SpotifyApiToken));
}

######################################################################################################################################################

<#
.SYNOPSIS
Performs a spotify search and plays the first found item

.DESCRIPTION
Performs a spotify search and plays the first found item on the active device

.PARAMETER Queries
The search phrase

.PARAMETER SearchType
Optionally, the type of item to search for

.EXAMPLE
PS C:\> Search-SpotifyAndPlay Rage against the machine

.EXAMPLE
PS C:\> fmp Dire Straits You and your friend

#>
function Search-SpotifyAndPlay {

    [Alias("smp", "fmp")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,

        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        [int] $SearchTypeTypeId = 0;

        if ($SearchType -contains "Album") { $SearchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $SearchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $SearchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $SearchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $SearchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $SearchTypeTypeId += 32 }
        if ($SearchType -contains "All") { $SearchTypeTypeId += 63 }
    }

    process {

        foreach ($Query in $Queries) {

            [GenXdev.Console.Spotify]::SearchAndPlay((Get-SpotifyApiToken), $Query, $SearchTypeTypeId) | ForEach-Object { if ($null -ne $PSItem) { $PSItem } } -ErrorAction SilentlyContinue
        }
    }
}

######################################################################################################################################################


<#
.SYNOPSIS
Performs a spotify search and returns the search results

.DESCRIPTION
Performs a spotify search and returns the search results

.PARAMETER Queries
The search phrase

.PARAMETER SearchType
Optionally, the type of item to search for

.EXAMPLE
PS C:\> Search-Spotify Rage against the machine

.EXAMPLE
PS C:\> fm Dire Straits You and your friend

#>
function Search-Spotify {

    [Alias("sm", "fm")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,


        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        [int] $SearchTypeTypeId = 0;

        if ($SearchType -contains "Album") { $SearchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $SearchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $SearchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $SearchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $SearchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $SearchTypeTypeId += 32 }
        if ($SearchType -contains "All") { $SearchTypeTypeId += 63 }
    }

    process {

        foreach ($Query in $Queries) {

            [GenXdev.Console.Spotify]::Search((Get-SpotifyApiToken), $Query, $SearchTypeTypeId) | ForEach-Object { $PSItem } -ErrorAction SilentlyContinue
        }
    }
}

######################################################################################################################################################
<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Pauses playback on the device that is active on Spotify
#>
function Invoke-Repeated {

    [Alias("rpt")]

    param(
        [parameter(Position = 0, Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string] $script
    )

    "Press q to quit - any other key to continue" | Out-Host

    do {

        Invoke-Expression $script

        while ([Console]::KeyAvailable) {

            [Console]::ReadKey();
        }
    }     while ([Console]::ReadKey() -ne "q");
}

######################################################################################################################################################

<#
.SYNOPSIS
Starts the configured Windows screensaver

.DESCRIPTION
Starts the configured Windows screensaver

#>
function Enable-Screensaver {

    & "$ENV:SystemRoot\system32\scrnsave.scr" / s
}

######################################################################################################################################################
<#
.SYNOPSIS
Turns the monitor power off

.DESCRIPTION
Turns the monitor power off
#>
function Set-MonitorPowerOff {

    Start-Sleep 2

    [GenXdev.Helpers.WindowObj]::SleepMonitor();
}

######################################################################################################################################################
<#
.SYNOPSIS
Turns the monitor power on

.DESCRIPTION
Turns the monitor power on
#>
function Set-MonitorPowerOn {

    [GenXdev.Helpers.WindowObj]::WakeMonitor();
}

######################################################################################################################################################
<#
.SYNOPSIS
Shows a short alphabetical list of all PowerShell verbs

.DESCRIPTION
Shows a short alphabetical list of all PowerShell verbs
#>
function Show-Verb {

    param(

        [parameter(
            Position = 0,
            ValueFromPipeline = $True,
            ValueFromPipelineByPropertyName = $True,
            Mandatory = $False
        )] [string[]] $Verb = @()
    )

    process {

        if ($Verb.Length -eq 0) {

            $verbs = Get-Verb
        }
        else {
            $verbs = Get-Verb | ForEach-Object -ErrorAction SilentlyContinue {

                $existingVerb = $PSItem;

                foreach ($verb in $Verb) {

                    if ($existingVerb.Verb -like $verb) {

                        $existingVerb
                    }
                }
            }
        }

        ($verbs | Sort-Object { $PSItem.Verb } | ForEach-Object Verb -ErrorAction SilentlyContinue) -Join ", "
    }
}

######################################################################################################################################################
