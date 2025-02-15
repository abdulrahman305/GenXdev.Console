################################################################################
<#
.SYNOPSIS
Sets the active Spotify playback device.

.DESCRIPTION
Transfers playback to the specified Spotify device using the Spotify Web API.
This cmdlet requires an authenticated Spotify session and a valid device ID.
The device ID can be obtained using the Get-SpotifyDevices cmdlet.

.PARAMETER DeviceId
The Spotify device ID to transfer playback to. This is a unique identifier
assigned by Spotify to each playback device (speakers, computers, phones, etc.).
Use Get-SpotifyDevices to get a list of available device IDs.

.EXAMPLE
Set-SpotifyActiveDevice -DeviceId "1234567890abcdef"
Transfers playback to the device with ID "1234567890abcdef"

.EXAMPLE
"1234567890abcdef" | Set-SpotifyActiveDevice
Same as above but using pipeline input
#>
function Set-SpotifyActiveDevice {

    [CmdletBinding()]
    [Alias("Set-SpotifyDevice")]

    param(
        ########################################################################
        [Alias("Id")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify deviceId to transfer playback to"
        )]
        [string] $DeviceId
        ########################################################################
    )

    begin {

        # retrieve authentication token from spotify api for subsequent requests
        $apiToken = Get-SpotifyApiToken
        Write-Verbose "Retrieved Spotify API token for authentication"
    }

    process {

        # use spotify api to transfer playback to the specified device
        Write-Verbose "Attempting to transfer playback to device ID: $DeviceId"
        [GenXdev.Helpers.Spotify]::SetActiveDevice($apiToken, $DeviceId)
    }

    end {
    }
}
################################################################################
