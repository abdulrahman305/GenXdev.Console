################################################################################

<#
.SYNOPSIS
Enables Spotify song-shuffle mode.

.DESCRIPTION
Enables shuffle mode on the currently active Spotify playback device. This
function requires a valid Spotify API token and an active playback session.

.EXAMPLE
Set-SpotifyShuffleOn

.EXAMPLE
shuffle
#>
function Set-SpotifyShuffleOn {

    [CmdletBinding()]
    [Alias("shuffle", "shuffleon")]
    param()

    begin {

        # output verbose information about the operation
        Write-Verbose "Enabling shuffle mode on active Spotify device"
    }

    process {

        # retrieve the current spotify api token
        $token = Get-SpotifyApiToken

        # enable shuffle mode using the spotify api
        [GenXdev.Helpers.Spotify]::ShuffleOn($token)
    }

    end {
    }
}
################################################################################
