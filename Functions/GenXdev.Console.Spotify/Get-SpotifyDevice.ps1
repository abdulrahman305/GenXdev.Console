<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyDevice.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
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