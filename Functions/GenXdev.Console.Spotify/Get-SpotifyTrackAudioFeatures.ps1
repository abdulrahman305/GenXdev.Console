###############################################################################

<#
.SYNOPSIS
Returns Spotify track audio feature information

.DESCRIPTION
Returns Spotify track audio feature information

.PARAMETER Id
The Spotify track to return audio features for
#>

function Get-SpotifyTrackAudioFeatures {

    [CmdletBinding()]
    [Alias("audiofeatures")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify track to return audio features for"
        )]
        [string[]] $TrackId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetSeveralAudioFeatures($apiToken, $TrackId);
    }

    end {

    }
}
