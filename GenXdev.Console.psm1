if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Console\Enable-Screensaver.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Get-IsSpeaking.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\New-MicrosoftShellTab.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Now.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Open-MediaFile.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\SayDate.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\SayTime.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-LocationParent.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-LocationParent2.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-LocationParent3.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-LocationParent4.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-LocationParent5.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-MonitorPowerOff.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-MonitorPowerOn.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Set-VLCPlayerFocused.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Start-TextToSpeech.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Stop-TextToSpeech.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\UtcNow.ps1"
