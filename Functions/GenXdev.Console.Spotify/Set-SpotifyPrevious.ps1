###############################################################################

<#
.SYNOPSIS
Skips to previous track on Spotify

.DESCRIPTION
Skips to previous track on the device that is active on Spotify
#>
function Set-SpotifyPrevious {

    [Alias("previous", "prev")]
    param()

    [GenXdev.Helpers.Spotify]::Previous((Get-SpotifyApiToken));
}
