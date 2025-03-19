################################################################################
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
    [Alias("like")]

    param(
        ########################################################################
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track IDs to add to liked songs"
        )]
        [string[]] $TrackId = @()
        ########################################################################
    )

    begin {
        # retrieve spotify api authentication token for subsequent requests
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieved Spotify API token"
    }

    process {

        if ($TrackId.Length -eq 0) {

            # if no track specified, get the currently playing track
            Microsoft.PowerShell.Utility\Write-Verbose "No track ID provided, checking currently playing track"
            $CurrentlyPlaying = GenXdev.Console\Get-SpotifyCurrentlyPlaying

            if ($null -eq $CurrentlyPlaying -or
                $CurrentlyPlaying.CurrentlyPlayingType -ne "track") {

                Microsoft.PowerShell.Utility\Write-Warning "There are no tracks playing at this time"
                return
            }

            # add the currently playing track to liked songs
            Microsoft.PowerShell.Utility\Write-Verbose "Adding currently playing track to liked songs"
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
################################################################################