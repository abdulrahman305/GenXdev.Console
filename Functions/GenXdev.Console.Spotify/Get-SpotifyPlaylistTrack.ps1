<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyPlaylistTrack.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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