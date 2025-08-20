if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Add-SpotifyNewPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Add-SpotifyTracksToLiked.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Add-SpotifyTracksToPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Connect-SpotifyApiToken.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyActiveDevice.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyApiToken.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyCurrentlyPlaying.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyDevice.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyLikedTrack.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyLyrics.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyPlaylistIdsByName.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyPlaylistTrack.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyTrackAudioFeatures.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyTrackById.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Get-SpotifyUserPlaylists.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Move-SpotifyLikedTracksToPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Remove-SpotifyTracksFromLiked.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Remove-SpotifyTracksFromPlaylist.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Search-Spotify.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Search-SpotifyAndEnqueue.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Search-SpotifyAndPlay.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyActiveDevice.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyApiToken.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyNext.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyPause.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyPlaylistDetails.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyPlaylistOrder.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyPrevious.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyRepeatContext.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyRepeatOff.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyRepeatSong.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyShuffleOff.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyShuffleOn.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyStart.ps1"
. "$PSScriptRoot\Functions\GenXdev.Console.Spotify\Set-SpotifyStop.ps1"
