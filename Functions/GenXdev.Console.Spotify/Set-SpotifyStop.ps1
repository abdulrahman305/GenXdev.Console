################################################################################
<#
.SYNOPSIS
Stops Spotify playback on the active device.

.DESCRIPTION
Stops the currently playing music on the active Spotify device by calling the
Spotify Web API. Requires a valid authentication token.

.EXAMPLE
Set-SpotifyStop

.EXAMPLE
stop

.EXAMPLE
Stop-Music
#>
function Set-SpotifyStop {

    [CmdletBinding()]
    [Alias("stop", "Stop-Music")]
    param()

    begin {
        # output verbose information about stopping playback
        Write-Verbose "Attempting to stop Spotify playback on active device"
    }

    process {
        # retrieve the current spotify api authentication token
        Write-Verbose "Retrieving Spotify API token"
        $token = Get-SpotifyApiToken

        # call spotify api to stop playback
        Write-Verbose "Sending stop command to Spotify"
        [GenXdev.Helpers.Spotify]::Stop($token)
    }

    end {
    }
}
################################################################################
