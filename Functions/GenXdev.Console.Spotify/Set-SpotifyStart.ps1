###############################################################################

<#
.SYNOPSIS
Starts Spotify playback

.DESCRIPTION
Starts playback on the device that is active on Spotify
#>
function Set-SpotifyStart {

    [Alias("play", "Start-Music")]
    param()

    [GenXdev.Helpers.Spotify]::Start((Get-SpotifyApiToken));
}
