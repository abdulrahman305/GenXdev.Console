################################################################################
<#
.SYNOPSIS
Moves all liked tracks from your Spotify library to specified playlist(s)

.DESCRIPTION
This function retrieves all tracks from your Spotify liked songs library and moves
them to one or more specified playlists. After successfully adding the tracks to
the target playlist(s), it removes them from your liked songs.

.PARAMETER PlaylistName
The name(s) of the Spotify playlist(s) where liked tracks should be moved to.
Multiple playlist names can be specified.

.PARAMETER PlaylistId
The Spotify ID(s) of the playlist(s) where liked tracks should be moved to.
Multiple playlist IDs can be specified.

.EXAMPLE
Move-SpotifyLikedTracksToPlaylist -PlaylistName "My Archived Likes"

.EXAMPLE
moveliked "My Archived Likes"
#>
function Move-SpotifyLikedTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("moveliked")]

    param(
        ########################################################################
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistName,
        ########################################################################
        [Alias("Id")]
        [parameter(
            ParameterSetName = "ById",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist ID where all liked tracks should move to"
        )]
        [string[]] $PlaylistId
        ########################################################################
    )

    begin {

        # if playlist names were provided, convert them to playlist IDs
        if ($PlaylistName.Length -gt 0) {

            Write-Verbose "Converting playlist names to IDs"
            $PlaylistId = Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName
        }
    }

    process {

        # exit if no valid playlist IDs were found
        if ($PlaylistId.Length -eq 0) {

            Write-Verbose "No valid playlist IDs found, exiting"
            return
        }

        # retrieve all liked tracks from the user's library
        Write-Verbose "Retrieving liked tracks from library"
        $likedTracks = Get-SpotifyLikedTracks

        # track whether we successfully added tracks to at least one playlist
        [bool] $done = $false

        # attempt to add tracks to each specified playlist
        foreach ($Id in $PlaylistId) {

            Write-Verbose "Adding tracks to playlist with ID: $Id"
            Add-SpotifyTracksToPlaylist -PlaylistId $Id -Uri @($likedTracks.Track.Uri)
            $done = $true
        }

        # if tracks were added successfully, remove them from liked songs
        if ($done) {

            Write-Verbose "Removing tracks from liked songs"
            Remove-SpotifyTracksFromLiked -TrackId @($likedTracks.Track.Id)

            # return the tracks that were moved
            $likedTracks
        }
    }

    end {
    }
}
################################################################################
