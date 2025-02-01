###############################################################################

<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Pauses playback on the device that is active on Spotify
#>
function Set-SpotifyPause {

    [Alias("pausemusic", "Resume-Music")]
    param()

    [GenXdev.Helpers.Spotify]::Pause((Get-SpotifyApiToken));
}
