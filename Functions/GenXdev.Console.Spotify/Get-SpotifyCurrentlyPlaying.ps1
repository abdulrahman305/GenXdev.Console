################################################################################
<#
.SYNOPSIS
Returns information about the currently playing track on Spotify.

.DESCRIPTION
Retrieves detailed information about the track currently playing on Spotify,
including track name, artist, album, and playback status using the Spotify Web
API.

.EXAMPLE
PS C:\> Get-SpotifyCurrentlyPlaying
Returns the full currently playing track information object.

.EXAMPLE
PS C:\> gcp
Uses the alias to get the currently playing track information.

.EXAMPLE
PS C:\> (Get-SpotifyCurrentlyPlaying).Item.Name
Returns just the name of the currently playing track.
#>
function Get-SpotifyCurrentlyPlaying {

    [CmdletBinding()]
    [Alias("gcp")]
    [OutputType([SpotifyAPI.Web.CurrentlyPlaying])]

    param()

    begin {

        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose "Getting Spotify API authentication token"
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }

    process {

        # query the spotify api for currently playing track information
        Microsoft.PowerShell.Utility\Write-Verbose "Querying Spotify API for currently playing track"
        [GenXdev.Helpers.Spotify]::GetCurrentlyPlaying($apiToken)
    }

    end {
    }
}
################################################################################