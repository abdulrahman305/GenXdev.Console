<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyActiveDevice.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Sets the active Spotify playback device.

.DESCRIPTION
Transfers playback to the specified Spotify device using the Spotify Web API.
This cmdlet requires an authenticated Spotify session and a valid device ID.
The device ID can be obtained using the Get-SpotifyDevice cmdlet.

.PARAMETER DeviceId
The Spotify device ID to transfer playback to. This is a unique identifier
assigned by Spotify to each playback device (speakers, computers, phones, etc.).
Use Get-SpotifyDevice to get a list of available device IDs.

.EXAMPLE
Set-SpotifyActiveDevice -DeviceId "1234567890abcdef"
Transfers playback to the device with ID "1234567890abcdef"

.EXAMPLE
"1234567890abcdef" | Set-SpotifyActiveDevice
Same as above but using pipeline input
#>
function Set-SpotifyActiveDevice {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.Device]])]

    param(
        ########################################################################
        [Alias('Id')]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Spotify deviceId to transfer playback to'
        )]
        [string] $DeviceId
        ########################################################################
    )

    begin {

        # retrieve authentication token from spotify api for subsequent requests
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API token for authentication'
    }


    process {

        # use spotify api to transfer playback to the specified device
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to transfer playback to device ID: $DeviceId"

        if ($PSCmdlet.ShouldProcess("device $DeviceId", 'Transfer Spotify playback')) {

            [GenXdev.Helpers.Spotify]::SetActiveDevice($apiToken, $DeviceId)
        }
    }

    end {
    }
}