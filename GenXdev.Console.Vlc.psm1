if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Open-VlcMediaPlayer.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Open-VlcMediaPlayerLyrics.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Start-VlcMediaPlayerNextInPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Start-VlcMediaPlayerPreviousInPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Switch-VlcMediaPlayerMute.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Switch-VLCMediaPlayerPaused.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Vlc\Switch-VlcMediaPlayerRepeat.ps1"
