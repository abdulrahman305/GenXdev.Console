<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyActiveDevice.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.278.2025
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