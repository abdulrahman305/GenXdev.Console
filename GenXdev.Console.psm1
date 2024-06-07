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

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBNMFcTrKJ7hlu9
# 8FnlPFyUzC2ZxCF22JLzG4Elmc916KCCFhswggMOMIIB9qADAgECAhBwxOfTiuon
# hU3SZf3YwpWAMA0GCSqGSIb3DQEBCwUAMB8xHTAbBgNVBAMMFEdlblhkZXYgQXV0
# aGVudGljb2RlMB4XDTI0MDUwNTIwMzEzOFoXDTM0MDUwNTE4NDEzOFowHzEdMBsG
# A1UEAwwUR2VuWGRldiBBdXRoZW50aWNvZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQDAD4JXwna5uBAYw54JXXscQPSos9pMeeyV99hvQPs6IcQ/wIXs
# zQ0xdkMGlzo1Nvldyqwa6+OXMyHsZM2D6QA1WjRoTzjT432hlGJT3VrP3R9cvOfg
# sAnVLpZy+4uty2fh5o8NEk4tmULOXDPZBT6NOoRjRCyt+KwCL8yioCFWa/7pqpG0
# niyJka8rhOVQLg8sZ+n5DrSihs1o3PyN28mZLendSbL9Y06cbqadL0J6sn31sw6e
# tpLOToIj1DXQbID0ejeafONHYJ3cKBrQ0TG7aoK8dte4X+iQQuDgA/l7ATxCjC7V
# 18vKRQXzSjvBQvNuWSw6DX2b7sc7dzC9v2T1AgMBAAGjRjBEMA4GA1UdDwEB/wQE
# AwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUf8ZHrsKtJB9RD6z2
# x2Txu7wQ1/4wDQYJKoZIhvcNAQELBQADggEBAK/GgNjLVhQkhbFMrJUt3nFfYa2a
# iP/+U2vapwtqeyNBreMiTYwtqkULEPotRlRCMZ+k8kwRhv1bsR82MXK1H74DKcTM
# 0gu62RxOMXz8ij0BjXW9axEWqYGAbbP0EoNyoBzqiLYqXkwCXqIFsywuDZO4QY3D
# 1c+NEKVnPnhf/gufOUrlugklExh9i4QagCSlUObYAa9yBhcoxOHzN0v6mN+I7EjM
# sVsydPsk3NshubldpNSavFUcF477l21eM5F1bFXGTJGgGq9k1/drpILe5e4oLy9w
# sxmdnqpyvbwtPe2+LZx0XSlR5vCfYFih6eV8fNcgvMmAKAcuIuKxKwJkAscwggWN
# MIIEdaADAgECAhAOmxiO+dAt5+/bUOIIQBhaMA0GCSqGSIb3DQEBDAUAMGUxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBD
# QTAeFw0yMjA4MDEwMDAwMDBaFw0zMTExMDkyMzU5NTlaMGIxCzAJBgNVBAYTAlVT
# MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
# b20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK
# 2FnC4SmnPVirdprNrnsbhA3EMB/zG6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/G
# nhWlfr6fqVcWWVVyr2iTcMKyunWZanMylNEQRBAu34LzB4TmdDttceItDBvuINXJ
# IB1jKS3O7F5OyJP4IWGbNOsFxl7sWxq868nPzaw0QF+xembud8hIqGZXV59UWI4M
# K7dPpzDZVu7Ke13jrclPXuU15zHL2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN
# 2NQ3pC4FfYj1gj4QkXCrVYJBMtfbBHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I
# 11pJpMLmqaBn3aQnvKFPObURWBf3JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KIS
# G2aadMreSx7nDmOu5tTvkpI6nj3cAORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9
# HJXDj/chsrIRt7t/8tWMcCxBYKqxYxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4
# pncB4Q+UDCEdslQpJYls5Q5SUUd0viastkF13nqsX40/ybzTQRESW+UQUOsxxcpy
# FiIJ33xMdT9j7CFfxCBRa2+xq4aLT8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS31
# 2amyHeUbAgMBAAGjggE6MIIBNjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTs
# 1+OC0nFdZEzfLmc/57qYrhwPTzAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd
# 823IDzAOBgNVHQ8BAf8EBAMCAYYweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzAB
# hhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9j
# YWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQw
# RQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZI
# hvcNAQEMBQADggEBAHCgv0NcVec4X6CjdBs9thbX979XB72arKGHLOyFXqkauyL4
# hxppVCLtpIh3bb0aFPQTSnovLbc47/T/gLn4offyct4kvFIDyE7QKt76LVbP+fT3
# rDB6mouyXtTP0UNEm0Mh65ZyoUi0mcudT6cGAxN3J0TU53/oWajwvy8LpunyNDzs
# 9wPHh6jSTEAZNUZqaVSwuKFWjuyk1T3osdz9HNj0d1pcVIxv76FQPfx2CWiEn2/K
# 2yCNNWAcAgPLILCsWKAOQGPFmCLBsln1VWvPJ6tsds5vIy30fnFqI2si/xK4VC0n
# ftg62fC2h5b9W9FcrBjDTZ9ztwGpn1eqXijiuZQwggauMIIElqADAgECAhAHNje3
# JFR82Ees/ShmKl5bMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYD
# VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAf
# BgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMjAzMjMwMDAwMDBa
# Fw0zNzAzMjIyMzU5NTlaMGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2Vy
# dCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNI
# QTI1NiBUaW1lU3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDGhjUGSbPBPXJJUVXHJQPE8pE3qZdRodbSg9GeTKJtoLDMg/la9hGhRBVC
# X6SI82j6ffOciQt/nR+eDzMfUBMLJnOWbfhXqAJ9/UO0hNoR8XOxs+4rgISKIhjf
# 69o9xBd/qxkrPkLcZ47qUT3w1lbU5ygt69OxtXXnHwZljZQp09nsad/ZkIdGAHvb
# REGJ3HxqV3rwN3mfXazL6IRktFLydkf3YYMZ3V+0VAshaG43IbtArF+y3kp9zvU5
# EmfvDqVjbOSmxR3NNg1c1eYbqMFkdECnwHLFuk4fsbVYTXn+149zk6wsOeKlSNbw
# sDETqVcplicu9Yemj052FVUmcJgmf6AaRyBD40NjgHt1biclkJg6OBGz9vae5jtb
# 7IHeIhTZgirHkr+g3uM+onP65x9abJTyUpURK1h0QCirc0PO30qhHGs4xSnzyqqW
# c0Jon7ZGs506o9UD4L/wojzKQtwYSH8UNM/STKvvmz3+DrhkKvp1KCRB7UK/BZxm
# SVJQ9FHzNklNiyDSLFc1eSuo80VgvCONWPfcYd6T/jnA+bIwpUzX6ZhKWD7TA4j+
# s4/TXkt2ElGTyYwMO1uKIqjBJgj5FBASA31fI7tk42PgpuE+9sJ0sj8eCXbsq11G
# deJgo1gJASgADoRU7s7pXcheMBK9Rp6103a50g5rmQzSM7TNsQIDAQABo4IBXTCC
# AVkwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUuhbZbU2FL3MpdpovdYxq
# II+eyG8wHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/
# BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggr
# BgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVo
# dHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0
# LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjAL
# BglghkgBhv1sBwEwDQYJKoZIhvcNAQELBQADggIBAH1ZjsCTtm+YqUQiAX5m1tgh
# QuGwGC4QTRPPMFPOvxj7x1Bd4ksp+3CKDaopafxpwc8dB+k+YMjYC+VcW9dth/qE
# ICU0MWfNthKWb8RQTGIdDAiCqBa9qVbPFXONASIlzpVpP0d3+3J0FNf/q0+KLHqr
# hc1DX+1gtqpPkWaeLJ7giqzl/Yy8ZCaHbJK9nXzQcAp876i8dU+6WvepELJd6f8o
# VInw1YpxdmXazPByoyP6wCeCRK6ZJxurJB4mwbfeKuv2nrF5mYGjVoarCkXJ38SN
# oOeY+/umnXKvxMfBwWpx2cYTgAnEtp/Nh4cku0+jSbl3ZpHxcpzpSwJSpzd+k1Os
# Ox0ISQ+UzTl63f8lY5knLD0/a6fxZsNBzU+2QJshIUDQtxMkzdwdeDrknq3lNHGS
# 1yZr5Dhzq6YBT70/O3itTK37xJV77QpfMzmHQXh6OOmc4d0j/R0o08f56PGYX/sr
# 2H7yRp11LB4nLCbbbxV7HhmLNriT1ObyF5lZynDwN7+YAN8gFk8n+2BnFqFmut1V
# wDophrCYoCvtlUG3OtUVmDG0YgkPCr2B2RP+v6TR81fZvAT6gt4y3wSJ8ADNXcL5
# 0CN/AAvkdgIm2fBldkKmKYcJRyvmfxqkhQ/8mJb2VVQrH4D6wPIOK+XW+6kvRBVK
# 5xMOHds3OBqhK/bt1nz8MIIGwjCCBKqgAwIBAgIQBUSv85SdCDmmv9s/X+VhFjAN
# BgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
# IEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEy
# NTYgVGltZVN0YW1waW5nIENBMB4XDTIzMDcxNDAwMDAwMFoXDTM0MTAxMzIzNTk1
# OVowSDELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMSAwHgYD
# VQQDExdEaWdpQ2VydCBUaW1lc3RhbXAgMjAyMzCCAiIwDQYJKoZIhvcNAQEBBQAD
# ggIPADCCAgoCggIBAKNTRYcdg45brD5UsyPgz5/X5dLnXaEOCdwvSKOXejsqnGfc
# YhVYwamTEafNqrJq3RApih5iY2nTWJw1cb86l+uUUI8cIOrHmjsvlmbjaedp/lvD
# 1isgHMGXlLSlUIHyz8sHpjBoyoNC2vx/CSSUpIIa2mq62DvKXd4ZGIX7ReoNYWyd
# /nFexAaaPPDFLnkPG2ZS48jWPl/aQ9OE9dDH9kgtXkV1lnX+3RChG4PBuOZSlbVH
# 13gpOWvgeFmX40QrStWVzu8IF+qCZE3/I+PKhu60pCFkcOvV5aDaY7Mu6QXuqvYk
# 9R28mxyyt1/f8O52fTGZZUdVnUokL6wrl76f5P17cz4y7lI0+9S769SgLDSb495u
# ZBkHNwGRDxy1Uc2qTGaDiGhiu7xBG3gZbeTZD+BYQfvYsSzhUa+0rRUGFOpiCBPT
# aR58ZE2dD9/O0V6MqqtQFcmzyrzXxDtoRKOlO0L9c33u3Qr/eTQQfqZcClhMAD6F
# aXXHg2TWdc2PEnZWpST618RrIbroHzSYLzrqawGw9/sqhux7UjipmAmhcbJsca8+
# uG+W1eEQE/5hRwqM/vC2x9XH3mwk8L9CgsqgcT2ckpMEtGlwJw1Pt7U20clfCKRw
# o+wK8REuZODLIivK8SgTIUlRfgZm0zu++uuRONhRB8qUt+JQofM604qDy0B7AgMB
# AAGjggGLMIIBhzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUB
# Af8EDDAKBggrBgEFBQcDCDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1s
# BwEwHwYDVR0jBBgwFoAUuhbZbU2FL3MpdpovdYxqII+eyG8wHQYDVR0OBBYEFKW2
# 7xPn783QZKHVVqllMaPe1eNJMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1l
# U3RhbXBpbmdDQS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wWAYIKwYBBQUHMAKGTGh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZU
# aW1lU3RhbXBpbmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAIEa1t6gqbWYF7xw
# jU+KPGic2CX/yyzkzepdIpLsjCICqbjPgKjZ5+PF7SaCinEvGN1Ott5s1+FgnCvt
# 7T1IjrhrunxdvcJhN2hJd6PrkKoS1yeF844ektrCQDifXcigLiV4JZ0qBXqEKZi2
# V3mP2yZWK7Dzp703DNiYdk9WuVLCtp04qYHnbUFcjGnRuSvExnvPnPp44pMadqJp
# ddNQ5EQSviANnqlE0PjlSXcIWiHFtM+YlRpUurm8wWkZus8W8oM3NG6wQSbd3lqX
# TzON1I13fXVFoaVYJmoDRd7ZULVQjK9WvUzF4UbFKNOt50MAcN7MmJ4ZiQPq1JE3
# 701S88lgIcRWR+3aEUuMMsOI5ljitts++V+wQtaP4xeR0arAVeOGv6wnLEHQmjNK
# qDbUuXKWfpd5OEhfysLcPTLfddY2Z1qJ+Panx+VPNTwAvb6cKmx5AdzaROY63jg7
# B145WPR8czFVoIARyxQMfq68/qTreWWqaNYiyjvrmoI1VygWy2nyMpqy0tg6uLFG
# hmu6F/3Ed2wVbK6rr3M66ElGt9V/zLY4wNjsHPW2obhDLN9OTH0eaHDAdwrUAuBc
# YLso/zjlUlrWrBciI0707NMX+1Br/wd3H3GXREHJuEbTbDJ8WC9nR2XlG3O2mflr
# LAZG70Ee8PBf4NvZrZCARK+AEEGKMYIFCTCCBQUCAQEwMzAfMR0wGwYDVQQDDBRH
# ZW5YZGV2IEF1dGhlbnRpY29kZQIQcMTn04rqJ4VN0mX92MKVgDANBglghkgBZQME
# AgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqG
# SIb3DQEJBDEiBCCYZ+nzut1HeKIu7RqUI8qglfk8H5470x/A+qzPeBkVsDANBgkq
# hkiG9w0BAQEFAASCAQCzjprPwvk/9CWRnISOzDUZdJNl0Gso/oX64jnVP6Gd5nEz
# zvljZ7buK94qMqOPXwqSStd+bK9puXarnYVgOIvVQaYr7Ae4heMX8tBEz3IaLJ2g
# QQxeoVkZY/dKE8YGTSLn0eCSsfvx4XIp0X4zUm956o9UwQpVj1mJxlv8CyZXiD11
# gi8m2FXsoJlvC5Xh2HYUVNNhXTKFRnSEqbqmCXW/6p9G0D+I8TkM26jKKC8AiWim
# uyuVx8p+yUVKdKaBr0GIqiTLyWjSfEd2e6Dfkz7xtY0DO++CmA56nGY71cbSQvOT
# bPGUyl+7hBc3xVrQx0JPj5FnYSJzPL21fqbNSaDGoYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDYwNzA5MjA0MFowLwYJKoZIhvcNAQkEMSIEIDiOUHTs8rDT2Xx4WmAOkSvb
# l4vEa6aTeo4nFHTpcyyfMA0GCSqGSIb3DQEBAQUABIICAAJy518SXF6YE8zIioun
# MKBX2S5NGzX19/GC50V2owWLcGaEXo6EMXmUdbivund9f277LMHLNnq7jiPgNw4K
# UfQc16Ulp3UXyG4p3E1a8bWUubkrCyA7iDBololgOgOYkDz5V6jKN6RylGuKOrid
# eILzugBh9du7lH0MkVNdxEnyw3CTiWrOsTcsAO8/9rb2HbKEvxXi2ta7vugPkD+L
# R441Bj2/7h7/zJYs218XC1JRq1cco0+aHZqcSmIUfi1nd18gWLg1O20WRAccHZF3
# 9SUxh03d7+s6b9vMWrpj3flFcZdxJfxufKSdfUodiy6Z6++PeI2UuBaNmgc9Qd8h
# jk9vMuz5E9GzefX6p1lJHK04aec0oai7+1BsFIJLYmHO9nExkznKNpTvG5TBuI7W
# waV2Fz9DUhUbWQUEe7pxEyBddVrfHNFqb4KpoLMsXUC66Xx4ANcDGKu+G2t8Oa7x
# dJ24I3YeqDEN3d9sET2SDWRyd6KhVS6f97tA39yoxHggGyc14xTbfmy7d+GJOQMU
# IXggKSspk/o1MOh+ro4M/mRuZZjOur0/NnW69cNEv3w0NhPp2fLW1kCbSAxXs3XG
# Hb5Oh5SaKmbjQBPVhWSygHHevahztWp/6Mrp2A/GXLk8pW6UxDnhoe1O88aphb0w
# DU2KuYgQbyJIomlNDP7qwfCj
# SIG # End signature block
