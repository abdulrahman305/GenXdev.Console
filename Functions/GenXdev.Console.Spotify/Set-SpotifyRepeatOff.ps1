###############################################################################

<#
.SYNOPSIS
Disables Spotify repeat

.DESCRIPTION
Disables repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatOff {

    [Alias("norepeat", "repeatoff")]
    param()

    [GenXdev.Helpers.Spotify]::RepeatOff((Get-SpotifyApiToken));
}
