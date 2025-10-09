<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyStart.ps1
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
Starts Spotify playback on the currently active device.

.DESCRIPTION
This function initiates playback on the device that is currently active in
Spotify. It uses the Spotify API token to authenticate the request and control
playback.

.EXAMPLE
Set-SpotifyStart

.EXAMPLE
play
#>
function Set-SpotifyStart {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('play', 'startmusic')]
    param()

    begin {

        # output verbose information about starting playback
        Microsoft.PowerShell.Utility\Write-Verbose 'Initiating Spotify playback on active device'
    }


    process {

        # retrieve the current spotify api token for authentication
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with starting playback
        if ($PSCmdlet.ShouldProcess('active Spotify device', 'Start playback')) {

            # use the spotify helper class to start playback
            [GenXdev.Helpers.Spotify]::Start($token)
        }
    }

    end {
    }
}