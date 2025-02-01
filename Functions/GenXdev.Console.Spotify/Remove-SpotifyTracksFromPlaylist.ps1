###############################################################################

<#
.SYNOPSIS
Removes tracks from a Spotify playlist

.DESCRIPTION
Removes tracks from a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to delete tracks from

.PARAMETER Uri
The Spotify tracks that should be removed from the playlist
#>

function Remove-SpotifyTracksFromPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("removefromplaylist")]

    param(
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to delete tracks from"
        )]
        [string[]] $PlaylistName,

        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to delete tracks from"
        )]
        [string[]] $PlaylistId,

        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify tracks that should be removed from the playlist"
        )]
        [string[]] $Uri = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName)
        }
    }

    process {

        foreach ($Id in $PlaylistId) {

            [GenXdev.Helpers.Spotify]::RemoveFromPlaylist($apiToken, $Id, $Uri);
        }
    }

    end {

    }
}
