<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyShuffleOff.ps1
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
Disables Spotify song-shuffle mode on the active device.

.DESCRIPTION
Disables the shuffle playback mode on the currently active Spotify device. This
function uses the Spotify Web API to modify the shuffle state of the playback.

.EXAMPLE
Set-SpotifyShuffleOff

.EXAMPLE
noshuffle

.EXAMPLE
shuffleoff
#>
function Set-SpotifyShuffleOff {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('noshuffle', 'shuffleoff')]
    param()

    begin {

        # output information about the operation being performed
        Microsoft.PowerShell.Utility\Write-Verbose 'Disabling shuffle mode on active Spotify device...'
    }


    process {

        # only perform the action if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess('Spotify', 'Disable shuffle mode')) {

            # retrieve the current api token for spotify authentication
            # and disable shuffle mode using the spotify helper class
                [GenXdev.Helpers.Spotify]::ShuffleOff((GenXdev.Console\Get-SpotifyApiToken))
        }
    }

    end {
    }
}