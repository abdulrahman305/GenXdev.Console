###############################################################################

<#
.SYNOPSIS
Skips to next track on Spotify

.DESCRIPTION
Skips to next track on the device that is active on Spotify
#>
function Set-SpotifyNext {

    [Alias("next", "skip")]
    param()

    [GenXdev.Helpers.Spotify]::Next((Get-SpotifyApiToken));
}
