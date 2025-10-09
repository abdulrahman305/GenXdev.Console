<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyLikedTrack.ps1
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
Retrieves all tracks saved in the user's Spotify Library.

.DESCRIPTION
This function authenticates with Spotify using an API token and retrieves all
tracks that the user has saved (liked) in their Spotify library. The tracks are
returned as collection of track objects containing metadata like title, artist,
and album information.

.EXAMPLE
Get-SpotifyLikedTrack

.EXAMPLE
liked
#>
function Get-SpotifyLikedTrack {

    [OutputType([System.Collections.Generic.List[SpotifyAPI.Web.SavedTrack]])]

    [CmdletBinding()]
    [Alias('liked')]

    param()

    begin {

        # retrieve authentication token for spotify api access
        $apiToken = GenXdev.Console\Get-SpotifyApiToken

        # log api authentication attempt
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieved Spotify API authentication token'
    }


    process {

        # fetch all tracks from user's spotify library using helper class
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving saved tracks from Spotify library...'
        [GenXdev.Helpers.Spotify]::GetLibraryTracks($apiToken)
    }

    end {
    }
}