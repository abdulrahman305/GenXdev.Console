################################################################################
<#
.SYNOPSIS
Sets the active Spotify playback device.

.DESCRIPTION
Transfers playback to the specified Spotify device using the Spotify Web API.

.PARAMETER DeviceId
The Spotify device ID to transfer playback to. This can be obtained from
Get-SpotifyDevices.

.EXAMPLE
Set-SpotifyActiveDevice -DeviceId "1234567890abcdef"

.EXAMPLE
"1234567890abcdef" | Set-SpotifyActiveDevice
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

        # get spotify api authentication token
        $apiToken = Get-SpotifyApiToken
        Write-Verbose "Retrieved Spotify API token"
    }

    process {

        # transfer playback to specified device
        Write-Verbose "Transferring playback to device: $DeviceId"
        [GenXdev.Helpers.Spotify]::SetActiveDevice($apiToken, $DeviceId)
    }

    end {
    }
}
################################################################################
