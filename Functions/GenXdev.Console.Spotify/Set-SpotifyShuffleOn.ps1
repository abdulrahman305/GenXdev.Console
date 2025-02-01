###############################################################################

<#
.SYNOPSIS
Enables Spotify song-shuffle

.DESCRIPTION
Enables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOn {

    [Alias("shuffle", "shuffleon")]
    param()

    [GenXdev.Helpers.Spotify]::ShuffleOn((Get-SpotifyApiToken));
}
