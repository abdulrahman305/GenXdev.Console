<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyTrackAudioFeatures.ps1
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
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', 'Get-SpotifyTrackAudioFeatures')]
    [Alias('audiofeatures')]

    param(
        ########################################################################
        [Alias('Id')]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify track to return audio features for'
        )]
        [string[]] $TrackId
        ########################################################################
    )

    begin {
        # obtain the spotify api authentication token for subsequent requests
        Microsoft.PowerShell.Utility\Write-Verbose 'Acquiring Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # fetch audio features for the specified tracks using the spotify api
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving audio features for $($TrackId.Count) tracks"
        [GenXdev.Helpers.Spotify]::GetSeveralAudioFeatures($apiToken, $TrackId)
    }

    end {
    }
}