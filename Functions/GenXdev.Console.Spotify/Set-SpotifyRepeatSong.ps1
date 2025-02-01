###############################################################################

<#
.SYNOPSIS
Enables Spotify song-repeat

.DESCRIPTION
Enables song-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatSong {

    [CmdletBinding()]
    [Alias("repeatsong")]

    param()

    [GenXdev.Helpers.Spotify]::RepeatSong((Get-SpotifyApiToken));
}
