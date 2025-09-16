<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyActiveDevice.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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