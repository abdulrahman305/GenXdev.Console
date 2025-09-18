<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyTrackById.ps1
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
Retrieves detailed track information from Spotify using a track ID.

.DESCRIPTION
Uses the Spotify Web API to fetch comprehensive track information including
artist, album, duration, popularity, and other metadata for a specific track
identified by its Spotify track ID.

.PARAMETER TrackId
The unique Spotify track identifier. This is typically a 22-character string
that can be found in the Spotify track URL or through the Spotify client.

.EXAMPLE
Get-SpotifyTrackById -TrackId "3n3Ppam7vgaVa1iaRUc9Lp"
Returns full track details for "Mr. Brightside" by The Killers

.EXAMPLE
gettrack "3n3Ppam7vgaVa1iaRUc9Lp"
#>
function Get-SpotifyTrackById {

    [CmdletBinding()]
    [OutputType([SpotifyAPI.Web.FullTrack])]
    [Alias('gettrack')]

    param(
        #######################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify track ID to lookup track information for'
        )]
        [Alias('Id')]
        [string] $TrackId
        #######################################################################
    )

    begin {

        # get authentication token for spotify api access
        Microsoft.PowerShell.Utility\Write-Verbose 'Acquiring Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # fetch track information using the spotify api helper class
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving track information for ID: $TrackId"
        [GenXdev.Helpers.Spotify]::GetTrackById($apiToken, $TrackId)
    }

    end {
    }
}