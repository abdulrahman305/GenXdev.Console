################################################################################
<#
.SYNOPSIS
Skips to the previous track in Spotify playback.

.DESCRIPTION
Controls Spotify playback by skipping to the previous track on the currently
active device. Requires valid Spotify API authentication token.

.EXAMPLE
Set-SpotifyPrevious

.EXAMPLE
previous

.EXAMPLE
prev
#>
function Set-SpotifyPrevious {

    [CmdletBinding()]
    [Alias("previous", "prev")]
    param()

    begin {

        # output information about the operation
        Write-Verbose "Attempting to skip to previous track in Spotify"
    }

    process {

        # retrieve the current spotify api authentication token
        $token = Get-SpotifyApiToken

        # call spotify api to skip to previous track
        [GenXdev.Helpers.Spotify]::Previous($token)
    }

    end {
    }
}
################################################################################
