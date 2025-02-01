###############################################################################

<#
.SYNOPSIS
Disables Spotify song-shuffle

.DESCRIPTION
Disables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOff {

    [Alias("noshuffle", "shuffleoff")]
    param()

    [GenXdev.Helpers.Spotify]::ShuffleOff((Get-SpotifyApiToken));
}
