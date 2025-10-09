<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyPlaylistTrack.ps1
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
Returns all tracks from a Spotify playlist.

.DESCRIPTION
Retrieves all tracks from a Spotify playlist by either playlist name or ID. When
using playlist name, it will fetch the first matching playlist's ID and then
retrieve its tracks using the Spotify API.

.PARAMETER PlaylistName
The name of the Spotify playlist to retrieve tracks from. Will match the first
playlist found with this name.

.PARAMETER PlaylistId
The unique Spotify ID of the playlist to retrieve tracks from.

.EXAMPLE
Get-SpotifyPlaylistTrack -PlaylistName "My Favorite Songs"

.EXAMPLE
Get-SpotifyPlaylistTrack -PlaylistId "37i9dQZF1DXcBWIGoYBM5M"

.EXAMPLE
"My Workout Mix" | getplaylist
#>
function Get-SpotifyPlaylistTrack {

    [CmdletBinding(DefaultParameterSetName = 'ByName')]
    [Alias('getplaylist')]
    [OutputType([System.Collections.Generic.List`1[SpotifyAPI.Web.PlaylistTrack`1[SpotifyAPI.Web.IPlayableItem]]])]

    param(
        ########################################################################
        [Alias('Name')]
        [parameter(
            ParameterSetName = 'ByName',
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The Spotify playlist to return tracks for',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string] $PlaylistName,
        ########################################################################
        [Alias('Id')]
        [parameter(
            ParameterSetName = 'ById',
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The Spotify playlist to return tracks for',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string] $PlaylistId
        ########################################################################
    )

    begin {

        # get spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken

        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API token'

        # if playlist name provided, get its ID
        if ([string]::IsNullOrWhiteSpace($PlaylistName) -eq $false) {

            Microsoft.PowerShell.Utility\Write-Verbose "Looking up playlist ID for name: $PlaylistName"

            $PlaylistId = @(GenXdev.Console\Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName)) |
                Microsoft.PowerShell.Utility\Select-Object -First 1

            Microsoft.PowerShell.Utility\Write-Verbose "Found playlist ID: $PlaylistId"
        }
    }


    process {

        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving tracks for playlist ID: $PlaylistId"

        # call spotify api to get playlist tracks
        [GenXdev.Helpers.Spotify]::GetPlaylistTracks($apiToken, $PlaylistId)
    }

    end {
    }
}