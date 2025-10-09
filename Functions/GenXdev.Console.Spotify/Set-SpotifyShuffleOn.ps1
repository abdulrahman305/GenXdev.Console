<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyShuffleOn.ps1
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
Enables Spotify song-shuffle mode.

.DESCRIPTION
Enables shuffle mode on the currently active Spotify playback device. This
function requires a valid Spotify API token and an active playback session.

.EXAMPLE
Set-SpotifyShuffleOn

.EXAMPLE
shuffle
#>
function Set-SpotifyShuffleOn {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('shuffle', 'shuffleon')]
    param()

    begin {

        # output verbose information about the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Enabling shuffle mode on active Spotify device'
    }


    process {

        # retrieve the current spotify api token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with enabling shuffle mode
        if ($PSCmdlet.ShouldProcess('active Spotify device', 'Enable shuffle mode')) {

            # enable shuffle mode using the spotify api
            [GenXdev.Helpers.Spotify]::ShuffleOn($token)
        }
    }

    end {
    }
}