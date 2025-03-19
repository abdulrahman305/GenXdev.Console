################################################################################
<#
.SYNOPSIS
Returns all currently active Spotify devices for the current user.

.DESCRIPTION
Retrieves a list of Spotify devices that are currently marked as active for the
authenticated user's account. This includes devices like phones, computers,
speakers, etc. that are currently available to play music.

.EXAMPLE
Get-SpotifyActiveDevice

Returns all active Spotify devices for the current user, displaying properties
like name, type, and volume.
#>
function Get-SpotifyActiveDevice {

    [CmdletBinding()]

    param(
        ########################################################################
    )

    begin {

        # retrieve the spotify api authentication token for subsequent requests
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving Spotify API authentication token"
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }

    process {

        # get all devices and filter only active ones
        Microsoft.PowerShell.Utility\Write-Verbose "Fetching active Spotify devices"
        [GenXdev.Helpers.Spotify]::GetDevices($apiToken) |
        Microsoft.PowerShell.Core\Where-Object {
            $PSItem.IsActive
        }
    }

    end {
    }
}
################################################################################