<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Move-SpotifyLikedTracksToPlaylist.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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