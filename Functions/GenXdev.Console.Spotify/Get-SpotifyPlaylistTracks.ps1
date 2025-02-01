###############################################################################

<#
.SYNOPSIS
Returns all tracks of a Spotify playlist

.DESCRIPTION
Returns all tracks of a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to return tracks for

#>
function Get-SpotifyPlaylistTracks {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("getplaylist")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to return tracks for",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string] $PlaylistName,

        [Alias("Id")]
        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to return tracks for",
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string] $PlaylistId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ([string]::IsNullOrWhiteSpace($PlaylistName) -eq $false) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName)) | Select-Object -First 1
        }
    }

    process {

        [GenXdev.Helpers.Spotify]::GetPlaylistTracks($apiToken, $PlaylistId);
    }

    end {

    }
}
