###############################################################################

<#
.SYNOPSIS
Removes tracks from the users own Spotify Library

.DESCRIPTION
Removes tracks from the users own Spotify Library

.PARAMETER TrackId
The Spotify track Ids of the songs that should be removed from liked"
#>

function Remove-SpotifyTracksFromLiked {

    [CmdletBinding()]
    [Alias("dislike")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify track Uris of the songs that should be added to the playlist"
        )]
        [string[]] $TrackId = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        if ($TrackId.Length -eq 0) {

            $CurrentlyPlaying = Get-SpotifyCurrentlyPlaying

            if ($null -eq $CurrentlyPlaying -or $CurrentlyPlaying.CurrentlyPlayingType -ne "track") {

                Write-Warning "There are no tracks playing at this time"

                return;
            }

            Remove-SpotifyTracksFromLiked -TrackId ($CurrentlyPlaying.Item.Id)

            $CurrentlyPlaying.Item
        }
        else {

            [GenXdev.Helpers.Spotify]::RemoveFromLiked($apiToken, $TrackId);
        }
    }

    end {


    }
}
