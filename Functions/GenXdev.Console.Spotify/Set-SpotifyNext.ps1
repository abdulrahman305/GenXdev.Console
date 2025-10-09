<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyNext.ps1
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
Skips to next track on Spotify.

.DESCRIPTION
Advances playback to the next track in the current playlist or album on the
currently active Spotify device. This function requires a valid Spotify API token
and an active playback session.

.EXAMPLE
Set-SpotifyNext

.EXAMPLE
next

.EXAMPLE
skip
#>
function Set-SpotifyNext {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('next', 'skip')]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Set-SpotifyNext operation'
    }


    process {

        # retrieve the current spotify api token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API token'
    $token = GenXdev.Console\Get-SpotifyApiToken

        # skip to the next track using the spotify api
        if ($PSCmdlet.ShouldProcess('Spotify', 'Skip to next track')) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Sending next track command to Spotify'
            [GenXdev.Helpers.Spotify]::Next($token)
        }
    }

    end {
    }
}