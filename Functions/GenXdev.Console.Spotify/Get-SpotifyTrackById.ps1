###############################################################################

<#
.SYNOPSIS
Returns full Spotify track information by given TrackId

.DESCRIPTION
Returns full Spotify track information by given TrackId

.PARAMETER TrackId
The Spotify track id of the track to lookup
#>
function Get-SpotifyTrackById {

    [CmdletBinding()]
    [Alias("gettrack")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string] $TrackId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetTrackById($apiToken, $TrackId);
    }

    end {


    }
}
