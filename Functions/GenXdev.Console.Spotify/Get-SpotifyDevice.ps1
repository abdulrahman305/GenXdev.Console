<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyDevice.ps1
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
    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.Device]])]
    param()

    begin {

        # retrieve the spotify api authentication token for subsequent api calls
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API authentication token...'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # query spotify api for all available devices using helper class
        Microsoft.PowerShell.Utility\Write-Verbose 'Querying Spotify API for available devices...'
        [GenXdev.Helpers.Spotify]::GetDevices($apiToken)
    }

    end {
    }
}