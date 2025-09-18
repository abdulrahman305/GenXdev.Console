<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyCurrentlyPlaying.ps1
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
Returns information about the currently playing track on Spotify.

.DESCRIPTION
Retrieves detailed information about the track currently playing on Spotify,
including track name, artist, album, and playback status using the Spotify Web
API.

.EXAMPLE
PS C:\> Get-SpotifyCurrentlyPlaying
Returns the full currently playing track information object.

.EXAMPLE
PS C:\> gcp
Uses the alias to get the currently playing track information.

.EXAMPLE
PS C:\> (Get-SpotifyCurrentlyPlaying).Item.Name
Returns just the name of the currently playing track.
#>
function Get-SpotifyCurrentlyPlaying {

    [CmdletBinding()]
    [Alias('gcp')]
    [OutputType([SpotifyAPI.Web.CurrentlyPlaying])]

    param()

    begin {

        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Getting Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # query the spotify api for currently playing track information
        Microsoft.PowerShell.Utility\Write-Verbose 'Querying Spotify API for currently playing track'
        [GenXdev.Helpers.Spotify]::GetCurrentlyPlaying($apiToken)
    }

    end {
    }
}