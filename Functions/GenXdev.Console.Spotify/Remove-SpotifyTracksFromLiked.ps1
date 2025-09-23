<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Remove-SpotifyTracksFromLiked.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
Removes tracks from the user's Spotify Library (Liked Songs).

.DESCRIPTION
Removes one or more tracks from the user's Spotify Liked Songs collection.
If no track ID is provided, removes the currently playing track.

.PARAMETER TrackId
One or more Spotify track IDs to remove from the Liked Songs collection.
If omitted, the currently playing track will be removed.

.EXAMPLE
Remove-SpotifyTracksFromLiked -TrackId "1234567890abcdef"

.EXAMPLE
dislike "1234567890abcdef"
#>
function Remove-SpotifyTracksFromLiked {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('dislike')]
    param(
        ########################################################################
        [Alias('Id')]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The Spotify track IDs to remove from Liked Songs'
        )]
        [string[]] $TrackId = @()
        ########################################################################
    )

    begin {
        # retrieve the spotify api access token for authentication
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # if no track ids were provided, handle currently playing track
        if ($TrackId.Length -eq 0) {

                # get information about the currently playing track
                $CurrentlyPlaying = GenXdev.Console\Get-SpotifyCurrentlyPlaying

            # verify there is a track currently playing
            if ($null -eq $CurrentlyPlaying -or
                $CurrentlyPlaying.CurrentlyPlayingType -ne 'track') {

                Microsoft.PowerShell.Utility\Write-Warning 'There are no tracks playing at this time'
                return
            }

            Microsoft.PowerShell.Utility\Write-Verbose 'Removing currently playing track from Liked Songs'

                # recursively call this function with the current track's id
                GenXdev.Console\Remove-SpotifyTracksFromLiked -TrackId ($CurrentlyPlaying.Item.Id)

            # return the track that was removed
            $CurrentlyPlaying.Item
        }
        else {

            Microsoft.PowerShell.Utility\Write-Verbose "Removing $($TrackId.Count) track(s) from Liked Songs"

            # use shouldprocess to confirm the operation
            if ($PSCmdlet.ShouldProcess(
                    "Remove $($TrackId.Count) track(s) from Liked Songs",
                    'Are you sure you want to remove these tracks from your Liked Songs?',
                    'Removing tracks from Liked Songs')) {

                # remove the specified tracks from liked songs using the spotify api
                [GenXdev.Helpers.Spotify]::RemoveFromLiked($apiToken, $TrackId)
            }
        }
    }

    end {
    }
}