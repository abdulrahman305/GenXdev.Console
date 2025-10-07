<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyTrackAudioFeatures.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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