###############################################################################

<#
.SYNOPSIS
Adds tracks to a Spotify playlist

.DESCRIPTION
Adds tracks to a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to add tracks to

.PARAMETER Uri
The Spotify tracks that should be added to the playlist
#>

function Add-SpotifyTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("addtoplaylist")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistName,

        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistId,

        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify tracks that should be added to the playlist"
        )]
        [string[]] $Uri = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName))
        }
    }

    process {

        foreach ($Id in $PlaylistId) {

            [GenXdev.Helpers.Spotify]::AddToPlaylist($apiToken, $Id, $Uri);
        }
    }

    end {


    }
}
