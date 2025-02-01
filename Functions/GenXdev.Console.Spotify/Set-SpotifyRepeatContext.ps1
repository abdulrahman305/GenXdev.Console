###############################################################################

<#
.SYNOPSIS
Enables Spotify playlist-repeat

.DESCRIPTION
Enables playlist-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatContext {

    [CmdletBinding()]
    [Alias("repeat")]

    param()

    [GenXdev.Helpers.Spotify]::RepeatContext((Get-SpotifyApiToken));
}
