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