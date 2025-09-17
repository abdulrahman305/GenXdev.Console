<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Add-SpotifyTracksToPlaylist.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.274.2025
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
Adds tracks to a Spotify playlist.

.DESCRIPTION
Adds one or more tracks to either a named Spotify playlist or a playlist
specified by its ID. Supports pipeline input for track URIs.

.PARAMETER PlaylistName
The name(s) of the Spotify playlist(s) to add tracks to.

.PARAMETER PlaylistId
The Spotify playlist ID(s) to add tracks to.

.PARAMETER Uri
The Spotify track URIs that should be added to the playlist.

.EXAMPLE
Add-SpotifyTracksToPlaylist -PlaylistName "My Favorites" `
    -Uri "spotify:track:1234567890"

.EXAMPLE
"spotify:track:1234567890" | addtoplaylist "My Playlist"
#>
function Add-SpotifyTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = 'ByName')]
    [Alias('addtoplaylist')]

    param(
        ########################################################################
        [Alias('Name')]
        [parameter(
            ParameterSetName = 'ByName',
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The Spotify playlist to add tracks to'
        )]
        [string[]] $PlaylistName,
        ########################################################################
        [parameter(
            ParameterSetName = 'ById',
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The Spotify playlist to add tracks to'
        )]
        [string[]] $PlaylistId,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The Spotify tracks that should be added to the playlist'
        )]
        [string[]] $Uri = @()
        ########################################################################
    )

    begin {
        # get the spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API token'

        # if playlist names were provided, convert them to playlist ids
        if ($PlaylistName.Length -gt 0) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Converting playlist names to IDs'
            $PlaylistId = @(GenXdev.Console\Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName))
            Microsoft.PowerShell.Utility\Write-Verbose "Found $($PlaylistId.Length) matching playlists"
        }
    }


    process {

        # add provided tracks to each specified playlist
        foreach ($Id in $PlaylistId) {

            Microsoft.PowerShell.Utility\Write-Verbose "Adding $($Uri.Length) tracks to playlist $Id"
            [GenXdev.Helpers.Spotify]::AddToPlaylist($apiToken, $Id, $Uri)
        }
    }

    end {
    }
}