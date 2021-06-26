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
        [string] $Filter = "*"
    )

    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    Clear-Host

    Get-Module "GenXdev.*" |
    ForEach-Object -Process {

        $module = $PSItem
        $first = $true;

        $result = [string]::Join(", ", @(
                $PSItem.ExportedCommands.Values | ForEach-Object -Process {

                    if ($PSItem.Name -like $Filter) {

                        if ($first) {

                            $first = $false;
                            "
" + $module.Name.SubString("GenXdev.".Length) + ":" | Write-Host -ForegroundColor "Yellow"
                        }

                        if ($PSItem.CommandType -eq "Alias") {

                            $alias = Get-Alias $PSItem.Name;

                            "$($alias.Name) -> $($alias.Definition)"
                        }
                        else {

                            $PSItem.Name
                        }
                    }
                }
            )).Trim()

        if (!$first) {

            $result
        }
    }

    "
-------------" | Write-Host -ForegroundColor "DarkGreen"
}

######################################################################################################################################################
######################################################################################################################################################

function Convert-JsonToXml {

    PARAM([Parameter(ValueFromPipeline = $true)][string[]]$json)

    BEGIN {
        Add-Type -AssemblyName System.ServiceModel.Web, System.Runtime.Serialization

        $mStream = New-Object System.IO.MemoryStream
    }

    PROCESS {
        $json | Write-String -stream $mStream
    }

    END {
        $mStream.Position = 0
        try {
            $jsonReader = [System.Runtime.Serialization.Json.JsonReaderWriterFactory]::CreateJsonReader($mStream, [System.Xml.XmlDictionaryReaderQuotas]::Max)
            $xml = New-Object Xml.XmlDocument
            $xml.Load($jsonReader)
            $xml
        }
        finally {
            $jsonReader.Close()
            $mStream.Dispose()
        }
    }
}

######################################################################################################################################################

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
PS D:\downloads> Fasti

.NOTES
You need 7z installed
#>
function Fasti {

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
function Get-SpotifyApiToken {

    param()

    $path = "$PSScriptRoot\..\GenXdev.Local\Spotify_Auth.json";

    if ([IO.File]::Exists($path)) {

        $ApiToken = [IO.File]::ReadAllText($path);
    }
    else {

        $ApiToken = Request-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }

    try {

        [GenXdev.Console.Spotify]::GetActiveDevices($ApiToken) | Out-Null
    }
    catch {

        $ApiToken = Request-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }

    $ApiToken
}

######################################################################################################################################################
function Set-SpotifyApiToken {

    param(

        [parameter(
            Mandatory = $true,
            Position = 0
        )] [string] $ApiToken
    )

    $dir = "$PSScriptRoot\..\GenXdev.Local";
    $path = "$dir\Spotify_Auth.json";

    if ([IO.Directory]::Exists($dir)) {

        [IO.Directory]::CreateDirectory($dir);
    }

    [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "));
}

######################################################################################################################################################
function Request-SpotifyApiToken {

    param()

    Write-Warning "Spotify access token expired, requisting new.."

    $url = [GenXdev.Console.Spotify]::RequestAuthenticationUri(5642);

    [System.Diagnostics.Process] $process = Open-Webbrowser -ReturnProcess -ApplicationMode -NewWindow -Width 1000 -Height 800 -Centered -Monitor 0 -Url $url

    [GenXdev.Console.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

    if ((!!$process -and $process -is [System.Diagnostics.Process]) -and (!$process.HasExited)) {

        $process.CloseMainWindow() | Out-Null
    }
}

######################################################################################################################################################

function Set-SpotifyStop {

    [Alias("stop", "Stop-Music")]
    param()
    [GenXdev.Console.Spotify]::Stop((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyStart {

    [Alias("play", "Start-Music")]
    param()

    [GenXdev.Console.Spotify]::Start((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyPause {

    [Alias("pausemusic", "Resume-Music")]
    param()

    [GenXdev.Console.Spotify]::Pause((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyPrevious {

    [Alias("previous", "prev")]
    param()

    [GenXdev.Console.Spotify]::Previous((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyNext {

    [Alias("next", "skip")]
    param()

    [GenXdev.Console.Spotify]::Next((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyRepeatSong {

    [Alias("repeatsong")]
    param()

    [GenXdev.Console.Spotify]::RepeatSong((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyRepeatContext {

    [Alias("repeat")]
    param()

    [GenXdev.Console.Spotify]::RepeatContext((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyRepeatOff {

    [Alias("norepeat", "repeatoff")]
    param()

    [GenXdev.Console.Spotify]::RepeatOff((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyShuffleOn {

    [Alias("shuffle", "shuffleon")]
    param()

    [GenXdev.Console.Spotify]::ShuffleOn((Get-SpotifyApiToken));
}
######################################################################################################################################################
function Set-SpotifyShuffleOff {

    [Alias("noshuffle", "shuffleoff")]
    param()

    [GenXdev.Console.Spotify]::ShuffleOff((Get-SpotifyApiToken));
}
######################################################################################################################################################
