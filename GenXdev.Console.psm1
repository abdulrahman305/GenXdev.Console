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

    try {
        [GenXdev.Helpers.Misc]::Speech.SpeakAsyncCancelAll();
    }
    catch {

    }
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
        [string[]] $lines,

        [Parameter(Mandatory = $False)]
        [switch] $wait
    )

    Begin {

    }

    Process {

        @($lines) | ForEach-Object -Process {

            $txt = $PSItem

            if ($txt -isnot [string]) {

                $txt = "$txt"
            }
            try {

                if ($wait -eq $true) {

                    [GenXdev.Helpers.Misc]::Speech.Speak($txt.Replace('\-[\r\n]*', ' ').Replace( '[\r\n]*', ' ')) | Out-Null
                }
                else {
                    [GenXdev.Helpers.Misc]::Speech.SpeakAsync($txt.Replace('\-[\r\n]*', ' ').Replace( '[\r\n]*', ' ')) | Out-Null
                }
            }
            catch {

                $txt | Out-Host
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
Allows you to search for Cmdlets by providing searchstrings, with or without wildcards

.PARAMETER $ModuleName
Retreives all Cmdlets of provided modulename(s)

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Get-GenXDevCmdlets {

    [CmdletBinding()]

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
        [string[]] $ModuleName = @("*")
    )

    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    $ModuleName = $ModuleName.Replace("GenXdev.", "")

    $results = Get-Module "GenXdev.$ModuleName" -All |  ForEach-Object -Process {

        $Module = $PSItem;

        $PSItem.ExportedCommands.Values | ForEach-Object -ErrorAction SilentlyContinue {

            if (($PSItem.Name -like $Filter) -and (($PSItem.Module.Name -eq $Module.Name) -or ($PSItem.Module.Name -like "$($Module.Name).*"))) {

                if ($PSItem.CommandType -eq "Function") {

                    $aliases = ((Get-Alias -Definition $PSItem.Name -ErrorAction SilentlyContinue | ForEach-Object Name) -Join ", ").Trim();

                    $nameAndAliases = ""

                    if ([string]::IsNullOrWhiteSpace($aliases) -eq $false) {

                        $nameAndAliases = "$($PSItem.Name) --> $aliases"
                    }
                    else {
                        $nameAndAliases = $PSItem.Name
                    }

                    $desc = "";
                    try {
                        $desc = (Get-Help $PSItem.Name -Detailed).Description.Text;

                        if ([string]::IsNullOrWhiteSpace($desc)) {

                            try {
                                $desc = (Select-String "#\s*DESCRIPTION\s+$($PSItem.Name):([^`r`n]*)" -input "$((Get-Command "$($PSItem.Name)").ScriptBlock)".Replace("`u{00A0}", " ") -AllMatches | ForEach-Object { $_.matches.Groups[1].Value }).Trim();
                            }
                            catch {
                                # Write-Warning $_.Exception
                                $desc = "";
                            }
                        }
                    }
                    catch {
                        $desc = "";
                    }

                    $result = @{
                        NameAndAliases = $nameAndAliases;
                        Name           = $PSItem.Name;
                        Aliases        = $aliases;
                        Description    = $desc;
                        ModuleName     = $PSItem.Module.Name;
                        Position       = "$($PSItem.Module.Name)_$($Module.Definition.IndexOf("function $($PSItem.Name)").ToString().PadLeft(10,"0"))"
                    }

                    $result
                }
            }
        }
    }

    $results | Sort-Object -Property Position
}

###############################################################################

<#
.SYNOPSIS
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.DESCRIPTION
Shows a list of all installed GenXdev modules and their Cmdlets and corresponding aliases

.PARAMETER Filter
Allows you to search for Cmdlets by providing searchstrings, with or without wildcards

.EXAMPLE
PS d:\documents\PowerShell> cmds

#>
function Show-GenXDevCmdlets {

    [CmdletBinding()]
    [Alias("cmds")]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Filter = "*",

        [Alias("m")]
        [parameter(
            ParameterSetName = "ModuleFilter",
            Mandatory = $false
        )]
        [string[]] $ModuleName = @("*"),

        [parameter(
            Mandatory = $false
        )]
        [switch] $Online
    )


    if (!$Filter.Contains("*")) {

        $Filter = "*$Filter*"
    }

    $ModuleName = $ModuleName.Replace("GenXdev.", "")

    $modules = Get-Module "GenXdev.$ModuleName" -All;
    $modules | ForEach-Object -Process {

        if ($Online -eq $true -and ($PSItem.Name -notin @("GenXdev.Local", "GenXdev.Git", "GenXdev.*.*"))) {

            Open-Webbrowser -Url "https://github.com/genXdev/$($PSItem.Name)/blob/main/README.md#cmdlet-index" -Monitor -1
            return;
        }
        else {
            if ($Online -eq $true) {

                return;
            }
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

            if ([string]::IsNullOrWhiteSpace($result) -eq $false) {

                $result;
            }
        }
    }
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
            (Get-PowershellMainWindow).SetForeground();

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

function Get-GenXDevModuleInfo {

    [CmdletBinding()]

    param(
        [Alias("Name", "Module")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )] [string[]] $ModuleName = @()
    )

    begin {
        [System.IO.FileSystemInfo[]] $AllModules = @(Get-GenXDevModules);

        if ("GenXdev.Local" -in $ModuleName) {

            throw "Can not publish GenXdev.Local"
        }

    }

    process {

        if ($ModuleName.Count -gt 0) {

            foreach ($currentModuleName in $ModuleName) {

                foreach ($currentModule in $AllModules) {

                    if ($currentModule.Parent.Name -ne $currentModuleName) {

                        continue;
                    }

                    $configPath = "$($currentModule.FullName)\$currentModuleName.psd1"
                    $configText = [IO.File]::ReadAllText($configPath)

                    $config = Invoke-Expression -Command ($configText)

                    $currentVersion = [Version]::new($config.ModuleVersion);
                    $newVersion = [Version]::new($currentVersion.Major, $currentVersion.Minor + 1, $currentVersion.Build).ToString();

                    @{
                        ModulePath     = $currentModule.FullName;
                        ModuleName     = $currentModuleName;
                        ConfigPath     = $configPath;
                        ConfigText     = $configText
                        Config         = $config;
                        CurrentVersion = $currentVersion;
                        NewVersion     = $newVersion;
                        HasREADME      = [IO.File]::Exists("$($currentModule.FullName)\README.md");
                        HasLICENSE     = [IO.File]::Exists("$($currentModule.FullName)\LICENSE") -and [IO.File]::Exists("$($currentModule.FullName)\license.txt");
                    }
                }
            }
            return;
        }

        foreach ($currentModule in $AllModules) {

            $currentModuleName = $currentModule.Parent.Name;
            $configPath = "$($currentModule.FullName)\$currentModuleName.psd1"
            $configText = [IO.File]::ReadAllText($configPath)

            $config = Invoke-Expression -Command ($configText)

            $currentVersion = [Version]::new($config.ModuleVersion);
            $newVersion = [Version]::new($currentVersion.Major, $currentVersion.Minor + 1, $currentVersion.Build).ToString();

            @{
                ModulePath     = $currentModule.FullName;
                ModuleName     = $currentModuleName;
                ConfigPath     = $configPath;
                ConfigText     = $configText
                Config         = $config;
                CurrentVersion = $currentVersion;
                NewVersion     = $newVersion;
                HasREADME      = [IO.File]::Exists("$($currentModule.FullName)\README.md");
                HasLICENSE     = [IO.File]::Exists("$($currentModule.FullName)\LICENSE") -and [IO.File]::Exists("$($currentModule.FullName)\license.txt");
            }
        }
    }
}

###############################################################################

function SayTime() {

    $d = Get-Date
    $h = $d.Hour
    $m = $d.Minute
    say ("The time is " + $h.ToString("0") + " hours and " + $m.ToString("0") + " minutes")
}

function SayDate() {

    say ("It is " + [DateTime]::Now.ToString("dddd, MMMM d yyyy"))
}


###############################################################################

function Now() {

    [CmdletBinding()]
    [OutputType("System.DateTime")]

    param()

    return [DateTime]::Now
}

###############################################################################

function UtcNow() {

    [CmdletBinding()]
    [OutputType("System.DateTime")]

    param()

    return [DateTime]::UtcNow
}

################################################################################
################################################################################
################################################################################
