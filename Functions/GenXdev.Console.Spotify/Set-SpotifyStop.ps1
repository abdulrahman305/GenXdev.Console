###############################################################################

<#
.SYNOPSIS
Stops Spotify playback

.DESCRIPTION
Stops playback on the device that is active on Spotify
#>
function Set-SpotifyStop {

    [Alias("stop", "Stop-Music")]
    param()
    [GenXdev.Helpers.Spotify]::Stop((Get-SpotifyApiToken));
}
