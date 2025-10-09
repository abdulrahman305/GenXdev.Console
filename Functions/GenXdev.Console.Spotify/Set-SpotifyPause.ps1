<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyPause.ps1
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
Pauses Spotify playback

.DESCRIPTION
Controls Spotify playback by pausing the currently playing track on the active
device. If playback is already paused, this command will resume playback.

.EXAMPLE
Set-SpotifyPause

.EXAMPLE
pausemusic
#>
function Set-SpotifyPause {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('togglepausemusic', 'pausemusic')]
    param()

    begin {
        # output verbose information about the action
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to pause/resume Spotify playback'
    }


    process {

        # check if we should proceed with the operation
        if ($PSCmdlet.ShouldProcess('Spotify', 'Pause/Resume playback')) {

            # call spotify api to toggle pause state using the current auth token
            [GenXdev.Helpers.Spotify]::Pause((GenXdev.Console\Get-SpotifyApiToken))
        }
    }

    end {
    }
}