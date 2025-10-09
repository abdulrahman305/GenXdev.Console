<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyCurrentlyPlaying.ps1
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
Returns information about the currently playing track on Spotify.

.DESCRIPTION
Retrieves detailed information about the track currently playing on Spotify,
including track name, artist, album, and playback status using the Spotify Web
API.

.EXAMPLE
PS C:\> Get-SpotifyCurrentlyPlaying
Returns the full currently playing track information object.

.EXAMPLE
PS C:\> gcp
Uses the alias to get the currently playing track information.

.EXAMPLE
PS C:\> (Get-SpotifyCurrentlyPlaying).Item.Name
Returns just the name of the currently playing track.
#>
function Get-SpotifyCurrentlyPlaying {

    [CmdletBinding()]
    [Alias('gcp')]
    [OutputType([SpotifyAPI.Web.CurrentlyPlaying])]

    param()

    begin {

        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Getting Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # query the spotify api for currently playing track information
        Microsoft.PowerShell.Utility\Write-Verbose 'Querying Spotify API for currently playing track'
        [GenXdev.Helpers.Spotify]::GetCurrentlyPlaying($apiToken)
    }

    end {
    }
}