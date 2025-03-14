################################################################################
<#
.SYNOPSIS
Retrieves all tracks saved in the user's Spotify Library.

.DESCRIPTION
This function authenticates with Spotify using an API token and retrieves all
tracks that the user has saved (liked) in their Spotify library. The tracks are
returned as collection of track objects containing metadata like title, artist,
and album information.

.EXAMPLE
Get-SpotifyLikedTrack

.EXAMPLE
liked
#>
function Get-SpotifyLikedTrack {

    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.SavedTrack]])]

    [CmdletBinding()]
    [Alias("liked")]

    param()

    begin {

        # retrieve authentication token for spotify api access
        $apiToken = Get-SpotifyApiToken

        # log api authentication attempt
        Write-Verbose "Retrieved Spotify API authentication token"
    }

    process {

        # fetch all tracks from user's spotify library using helper class
        Write-Verbose "Retrieving saved tracks from Spotify library..."
        [GenXdev.Helpers.Spotify]::GetLibraryTracks($apiToken)
    }

    end {
    }
}
################################################################################