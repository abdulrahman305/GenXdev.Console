################################################################################
<#
.SYNOPSIS
Retrieves audio feature information for one or more Spotify tracks.

.DESCRIPTION
This function connects to the Spotify API to fetch detailed audio features for the
specified tracks. Audio features include characteristics like danceability,
energy, key, loudness, mode, speechiness, acousticness, instrumentalness,
liveness, valence, tempo, and time signature.

.PARAMETER TrackId
One or more Spotify track IDs to analyze. These must be valid Spotify track
identifiers.

.EXAMPLE
Get-SpotifyTrackAudioFeatures -TrackId "1301WleyT98MSxVHPZCA6M"

.EXAMPLE
audiofeatures "1301WleyT98MSxVHPZCA6M", "6rqhFgbbKwnb9MLmUQDhG6"
#>
function Get-SpotifyTrackAudioFeatures {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "Get-SpotifyTrackAudioFeatures")]
    [Alias("audiofeatures")]

    param(
        ########################################################################
        [Alias("Id")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track to return audio features for"
        )]
        [string[]] $TrackId
        ########################################################################
    )

    begin {
        # obtain the spotify api authentication token for subsequent requests
        Write-Verbose "Acquiring Spotify API authentication token"
        $apiToken = Get-SpotifyApiToken
    }

    process {

        # fetch audio features for the specified tracks using the spotify api
        Write-Verbose "Retrieving audio features for $($TrackId.Count) tracks"
        [GenXdev.Helpers.Spotify]::GetSeveralAudioFeatures($apiToken, $TrackId)
    }

    end {
    }
}
################################################################################