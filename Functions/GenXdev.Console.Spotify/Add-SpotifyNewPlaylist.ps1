<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Add-SpotifyNewPlaylist.ps1
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
##############################################################################

<#
.SYNOPSIS
Creates a new Spotify playlist with customizable settings.

.DESCRIPTION
Creates a new Spotify playlist with the specified name, description, and privacy
settings. The function authenticates with Spotify, creates the playlist, and
updates the local playlist cache.

.PARAMETER Name
The name for the new playlist. This will be visible to users who can access the
playlist.

.PARAMETER Description
An optional description for the playlist that provides additional context about
its contents or purpose.

.PARAMETER Public
When specified, makes the playlist publicly visible to other Spotify users.

.PARAMETER Collabrative
When specified, allows other users to modify the playlist contents.

.EXAMPLE
Add-SpotifyNewPlaylist -Name "My Awesome Mix" -Description "Best songs of 2023" -Public

.EXAMPLE
newplaylist "Road Trip Songs" -Collabrative
#>
function Add-SpotifyNewPlaylist {

    [CmdletBinding()]
    [OutputType([SpotifyAPI.Web.FullPlaylist])]
    [Alias('newplaylist')]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The name for the new playlist'
        )]
        [string] $Name,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The description for the new playlist'
        )]
        [string] $Description = '',
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Make this a public playlist'
        )]
        [switch] $Public,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Allow others to make changes'
        )]
        [switch] $Collabrative
        ########################################################################
    )

    begin {

        # retrieve spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # create new playlist using spotify api helper
        Microsoft.PowerShell.Utility\Write-Verbose "Creating new Spotify playlist '$Name'"
        $result = [GenXdev.Helpers.Spotify]::NewPlaylist(
            $apiToken,
            $Name,
            $Description,
            ($Public -eq $true),
            ($Collabrative -eq $true))

        # update local playlist cache if it exists
        if ($Script:SpotifyPlaylistCache -is [System.Collections.Generic.List[object]]) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Updating local playlist cache'
            $null = $Script:SpotifyPlaylistCache.Insert(0, $result)

            # save updated cache to json file
            $filePath = GenXdev.FileSystem\Expand-Path "$($Env:LOCALAPPDATA)\GenXdev.PowerShell\Spotify.Playlists.json"
            $Script:SpotifyPlaylistCache |
                Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 100 |
                Microsoft.PowerShell.Utility\Out-File $filePath -Force
        }

        # return the newly created playlist
        $result
    }

    end {
    }
}