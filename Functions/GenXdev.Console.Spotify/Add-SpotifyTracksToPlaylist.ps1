<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Add-SpotifyTracksToPlaylist.ps1
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