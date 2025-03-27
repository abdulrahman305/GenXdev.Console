################################################################################
<#
.SYNOPSIS
Retrieves detailed track information from Spotify using a track ID.

.DESCRIPTION
Uses the Spotify Web API to fetch comprehensive track information including
artist, album, duration, popularity, and other metadata for a specific track
identified by its Spotify track ID.

.PARAMETER TrackId
The unique Spotify track identifier. This is typically a 22-character string
that can be found in the Spotify track URL or through the Spotify client.

.EXAMPLE
Get-SpotifyTrackById -TrackId "3n3Ppam7vgaVa1iaRUc9Lp"
# Returns full track details for "Mr. Brightside" by The Killers

.EXAMPLE
gettrack "3n3Ppam7vgaVa1iaRUc9Lp"
#>
function Get-SpotifyTrackById {

    [CmdletBinding()]
    [OutputType([SpotifyAPI.Web.FullTrack])]
    [Alias("gettrack")]

    param(
        #######################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track ID to lookup track information for"
        )]
        [Alias("Id")]
        [string] $TrackId
        #######################################################################
    )

    begin {

        # get authentication token for spotify api access
        Microsoft.PowerShell.Utility\Write-Verbose "Acquiring Spotify API authentication token"
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


process {

        # fetch track information using the spotify api helper class
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving track information for ID: $TrackId"
        [GenXdev.Helpers.Spotify]::GetTrackById($apiToken, $TrackId)
    }

    end {
    }
}
################################################################################