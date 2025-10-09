<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Move-SpotifyLikedTracksToPlaylist.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
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

    [CmdletBinding(DefaultParameterSetName = 'ByName')]
    [Alias('moveliked')]

    param(
        ########################################################################
        [Alias('Name')]
        [parameter(
            ParameterSetName = 'ByName',
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify playlist where all liked tracks should move to'
        )]
        [string[]] $PlaylistName,
        ########################################################################
        [Alias('Id')]
        [parameter(
            ParameterSetName = 'ById',
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify playlist ID where all liked tracks should move to'
        )]
        [string[]] $PlaylistId
        ########################################################################
    )

    begin {
        # if playlist names were provided, convert them to playlist IDs
        if ($PlaylistName.Length -gt 0) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Converting playlist names to IDs'
            $PlaylistId = GenXdev.Console\Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName
        }
    }


    process {

        # exit if no valid playlist IDs were found
        if ($PlaylistId.Length -eq 0) {

            Microsoft.PowerShell.Utility\Write-Verbose 'No valid playlist IDs found, exiting'
            return
        }

        # retrieve all liked tracks from the user's library
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving liked tracks from library'
        $likedTracks = GenXdev.Console\Get-SpotifyLikedTrack

        # track whether we successfully added tracks to at least one playlist
        [bool] $done = $false

        # attempt to add tracks to each specified playlist
        foreach ($Id in $PlaylistId) {

            Microsoft.PowerShell.Utility\Write-Verbose "Adding tracks to playlist with ID: $Id"
            GenXdev.Console\Add-SpotifyTracksToPlaylist -PlaylistId $Id -Uri @($likedTracks.Track.Uri)
            $done = $true
        }

        # if tracks were added successfully, remove them from liked songs
        if ($done) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Removing tracks from liked songs'
            GenXdev.Console\Remove-SpotifyTracksFromLiked -TrackId @($likedTracks.Track.Id)

            # return the tracks that were moved
            $likedTracks
        }
    }

    end {
    }
}