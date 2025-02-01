###############################################################################

<#
.SYNOPSIS
Moves all tracks from the users own Spotify Library to specified playlist

.DESCRIPTION
Moves all tracks from the users own Spotify Library to specified playlist

.PARAMETER PlaylistId
The Spotify playlist where all liked tracks should move to"
#>

function Move-SpotifyLikedTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("moveliked")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistName,

        [Alias("Id")]
        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistId
    )

    begin {

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName
        }
    }

    process {

        if ($PlaylistId.Length -eq 0) {

            return;
        }

        $likedTracks = Get-SpotifyLikedTracks
        [bool] $done = $false

        foreach ($Id in $PlaylistId) {

            Add-SpotifyTracksToPlaylist -PlaylistId $Id -Uri @($likedTracks.Track.Uri)
            $done = $true
        }

        if ($done) {

            Remove-SpotifyTracksFromLiked -TrackId @($likedTracks.Track.Id)

            $likedTracks
        }
    }

    end {


    }
}
