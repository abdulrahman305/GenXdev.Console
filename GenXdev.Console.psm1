###############################################################################

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

    [CmdletBinding()]
    [Alias("sst")]

    param()

    if ($null -eq $Global:SpeechSynthesizer) {

        $Global:SpeechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer
    }

    $Global:SpeechSynthesizer.SpeakAsyncCancelAll();
}

###############################################################################

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

    [CmdletBinding()]
    [Alias("say")]

    param(
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

###############################################################################

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

###############################################################################

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

    $modules = Get-Module $ModuleName
    $modules |
    ForEach-Object -Process {

        $module = $PSItem
        $name = $module.Name.SubString("GenXdev.".Length);
        $first = $true;
        [System.Collections.Generic.List[string]] $commandFilter = [System.Collections.Generic.List[string]]::new();

        if ($name.Contains(".") -eq $false) {

            foreach ($otherModule in $modules) {

                if ($otherModule.Name -like "GenXdev.$name.*") {

                    foreach ($filteredCommand in $otherModule.ExportedCommands.Values) {

                        if ($commandFilter.Contains($filteredCommand.Name)) { continue; }

                        $commandFilter.Add($filteredCommand.Name);
                    }
                }
            }
        }

        $result = [string]::Join(", ", @(
                $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

                    $exportedCommand = $PSItem;

                    if ($exportedCommand.Name -in $commandFilter) { return }

                    if ($exportedCommand.Name -like $Filter) {

                        if ($first) {

                            "`r`n" + $name + ":" | Write-Host -ForegroundColor "Yellow"
                        }

                        $first = $false;

                        if ($exportedCommand.CommandType -eq "Function") {

                            $aliases = ((Get-Alias -Definition $exportedCommand.Name -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();

                            if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {

                                "$($exportedCommand.Name) --> $aliases"
                            }
                            else {
                                $exportedCommand.Name
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

###############################################################################

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

###############################################################################

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

    [CmdletBinding()]
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

###############################################################################

<#
.SYNOPSIS
Provides the .. alias to go one directory up

.DESCRIPTION
Provides the .. alias to go one directory up
#>
function Set-LocationParent {

    [CmdletBinding()]
    [Alias("..")]

    param (

    )

    Set-Location ..
    Get-ChildItem
}
###############################################################################

<#
.SYNOPSIS
Provides the ... alias to go two directory up

.DESCRIPTION
Provides the ... alias to go two directory up
#>
function Set-LocationParent2 {

    [CmdletBinding()]
    [Alias("...")]

    param (

    )

    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
###############################################################################

<#
.SYNOPSIS
Provides the .... alias to go three directory up

.DESCRIPTION
Provides the .... alias to go three directory up
#>
function Set-LocationParent3 {

    [CmdletBinding()]
    [Alias("....")]

    param (

    )

    Set-Location ..
    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
###############################################################################

<#
.SYNOPSIS
Provides the ..... alias to go four directory up

.DESCRIPTION
Provides the ..... alias to go four directory up
#>
function Set-LocationParent4 {

    [CmdletBinding()]
    [Alias(".....")]

    param (

    )

    Set-Location ..
    Set-Location ..
    Set-Location ..
    Set-Location ..
    Get-ChildItem
}
###############################################################################

<#
.SYNOPSIS
Provides the ...... alias to go five directory up

.DESCRIPTION
Provides the ...... alias to go five directory up
#>
function Set-LocationParent5 {

    [CmdletBinding()]
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

###############################################################################

<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Pauses playback on the device that is active on Spotify
#>
function Invoke-Repeated {

    [CmdletBinding()]
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

###############################################################################

<#
.SYNOPSIS
Starts the configured Windows screensaver

.DESCRIPTION
Starts the configured Windows screensaver

#>
function Enable-Screensaver {

    [CmdletBinding()]

    param()

    & "$ENV:SystemRoot\system32\scrnsave.scr" / s
}

###############################################################################

<#
.SYNOPSIS
Turns the monitor power off

.DESCRIPTION
Turns the monitor power off
#>
function Set-MonitorPowerOff {

    [CmdletBinding()]

    param()

    Start-Sleep 2

    [GenXdev.Helpers.WindowObj]::SleepMonitor();
}

###############################################################################

<#
.SYNOPSIS
Turns the monitor power on

.DESCRIPTION
Turns the monitor power on
#>
function Set-MonitorPowerOn {

    [CmdletBinding()]

    param()

    [GenXdev.Helpers.WindowObj]::WakeMonitor();
}

###############################################################################

<#
.SYNOPSIS
Shows a short alphabetical list of all PowerShell verbs

.DESCRIPTION
Shows a short alphabetical list of all PowerShell verbs
#>
function Show-Verb {

    [CmdletBinding()]

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

###############################################################################
