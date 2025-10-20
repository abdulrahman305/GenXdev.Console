if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Console\New-MicrosoftShellTab.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Now.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Open-MediaFile.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\SayDate.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\SayTime.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\Start-SnakeGame.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console\UtcNow.ps1"
