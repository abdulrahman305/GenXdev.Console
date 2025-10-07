<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Add-SpotifyTracksToLiked.ps1
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
Adds tracks to the user's Spotify liked songs library.

.DESCRIPTION
This function allows you to add one or more tracks to your Spotify liked songs
library. If no track IDs are provided, it will attempt to like the currently
playing track.

.PARAMETER TrackId
An array of Spotify track IDs that should be added to your liked songs. If not
provided, the currently playing track will be liked instead.

.EXAMPLE
Add-SpotifyTracksToLiked -TrackId "spotify:track:123456789"

.EXAMPLE
like "spotify:track:123456789"

.EXAMPLE
Get-SpotifyCurrentlyPlaying | Add-SpotifyTracksToLiked
#>
function Add-SpotifyTracksToLiked {

    [CmdletBinding()]
    [Alias('like')]

    param(
        ########################################################################
        [Alias('Id')]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify track IDs to add to liked songs'
        )]
        [string[]] $TrackId = @()
        ########################################################################
    )

    begin {
        # retrieve spotify api authentication token for subsequent requests
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API token'
    }


    process {

        if ($TrackId.Length -eq 0) {

            # if no track specified, get the currently playing track
            Microsoft.PowerShell.Utility\Write-Verbose 'No track ID provided, checking currently playing track'
            $CurrentlyPlaying = GenXdev.Console\Get-SpotifyCurrentlyPlaying

            if ($null -eq $CurrentlyPlaying -or
                $CurrentlyPlaying.CurrentlyPlayingType -ne 'track') {

                Microsoft.PowerShell.Utility\Write-Warning 'There are no tracks playing at this time'
                return
            }

            # add the currently playing track to liked songs
            Microsoft.PowerShell.Utility\Write-Verbose 'Adding currently playing track to liked songs'
            GenXdev.Console\Add-SpotifyTracksToLiked -TrackId ($CurrentlyPlaying.Item.Id)

            # return the track that was liked
            $CurrentlyPlaying.Item
        }
        else {

            # add the specified tracks to liked songs
            Microsoft.PowerShell.Utility\Write-Verbose "Adding $($TrackId.Length) track(s) to liked songs"
            [GenXdev.Helpers.Spotify]::AddToLiked($apiToken, $TrackId)
        }
    }

    end {
    }
}