################################################################################
<#
.SYNOPSIS
Returns all currently available Spotify devices for current user.

.DESCRIPTION
Retrieves a list of all Spotify devices that are currently available for the
authenticated user. This includes any active or recently active devices such as
smartphones, computers, speakers, and other Spotify-enabled devices.

.EXAMPLE
Get-SpotifyDevice

This command returns all available Spotify devices for the current user.

.NOTES
Requires valid Spotify authentication token to function. The token is automatically
retrieved using Get-SpotifyApiToken.
#>
function Get-SpotifyDevice {

    [CmdletBinding()]
    [Alias("Get-SpotifyDevices")]
    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.Device]])]
    param()

    begin {

        # retrieve the spotify api authentication token for subsequent api calls
        Write-Verbose "Retrieving Spotify API authentication token..."
        $apiToken = Get-SpotifyApiToken
    }

    process {

        # query spotify api for all available devices using helper class
        Write-Verbose "Querying Spotify API for available devices..."
        [GenXdev.Helpers.Spotify]::GetDevices($apiToken)
    }

    end {
    }
}
################################################################################