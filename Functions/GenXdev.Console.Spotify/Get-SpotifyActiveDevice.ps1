<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyActiveDevice.ps1
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
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # get all devices and filter only active ones
        Microsoft.PowerShell.Utility\Write-Verbose 'Fetching active Spotify devices'
        [GenXdev.Helpers.Spotify]::GetDevices($apiToken) |
            Microsoft.PowerShell.Core\Where-Object {
                $PSItem.IsActive
            }
    }

    end {
    }
}