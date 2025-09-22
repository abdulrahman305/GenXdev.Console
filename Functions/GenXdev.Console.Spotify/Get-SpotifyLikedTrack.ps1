<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyLikedTrack.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.280.2025
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
Retrieves all tracks saved in the user's Spotify Library.

.DESCRIPTION
This function authenticates with Spotify using an API token and retrieves all
tracks that the user has saved (liked) in their Spotify library. The tracks are
returned as collection of track objects containing metadata like title, artist,
and album information.

.EXAMPLE
Get-SpotifyLikedTrack

.EXAMPLE
liked
#>
function Get-SpotifyLikedTrack {

    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.SavedTrack]])]

    [CmdletBinding()]
    [Alias('liked')]

    param()

    begin {

        # retrieve authentication token for spotify api access
        $apiToken = GenXdev.Console\Get-SpotifyApiToken

        # log api authentication attempt
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API authentication token'
    }


    process {

        # fetch all tracks from user's spotify library using helper class
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving saved tracks from Spotify library...'
        [GenXdev.Helpers.Spotify]::GetLibraryTracks($apiToken)
    }

    end {
    }
}