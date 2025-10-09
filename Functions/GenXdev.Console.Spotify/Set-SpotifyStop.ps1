<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyStop.ps1
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
Stops Spotify playback on the active device.

.DESCRIPTION
Stops the currently playing music on the active Spotify device by calling the
Spotify Web API. Requires a valid authentication token.

.EXAMPLE
Set-SpotifyStop

.EXAMPLE
stop

.EXAMPLE
Stop-Music
#>
function Set-SpotifyStop {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('stop')]
    param()

    begin {
        # output verbose information about stopping playback
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to stop Spotify playback on active device'
    }


    process {
        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API token'
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with stopping playback
        if ($PSCmdlet.ShouldProcess('Spotify', 'Stop playback')) {
            # call spotify api to stop playback
            Microsoft.PowerShell.Utility\Write-Verbose 'Sending stop command to Spotify'
            [GenXdev.Helpers.Spotify]::Stop($token)
        }
    }

    end {
    }
}