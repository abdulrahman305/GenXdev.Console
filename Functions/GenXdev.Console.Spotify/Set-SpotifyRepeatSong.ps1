<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatSong.ps1
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
Enables song repeat mode in Spotify.

.DESCRIPTION
Sets the repeat mode to 'track' for the currently active Spotify device using the
Spotify Web API. This will make the current song play repeatedly until repeat
mode is disabled.

.EXAMPLE
Set-SpotifyRepeatSong

.EXAMPLE
repeatsong
#>
function Set-SpotifyRepeatSong {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('repeatsong')]

    param()

    begin {

        # inform user that we're about to enable repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to enable song repeat mode in Spotify...'
    }


    process {

        # get the current spotify api authentication token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # only proceed if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess('Spotify', "Set repeat mode to 'track'")) {

            # send api request to enable repeat mode for the current song
            [GenXdev.Helpers.Spotify]::RepeatSong($token)
        }
    }

    end {

        # inform user that the operation completed
        Microsoft.PowerShell.Utility\Write-Verbose "Spotify repeat mode has been set to 'track'"
    }
}