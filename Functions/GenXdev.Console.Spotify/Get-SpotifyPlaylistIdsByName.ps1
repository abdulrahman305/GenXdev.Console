<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyPlaylistIdsByName.ps1
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
Retrieves Spotify playlist IDs by their names.

.DESCRIPTION
This function searches for Spotify playlists by name and returns their
corresponding IDs. It follows a three-step process:
1. Searches in the current session's playlists
2. Checks a local cache file if no results found
3. Forces a fresh fetch if cache is outdated or missing

The function returns all playlist IDs that match the provided names.

.PARAMETER PlaylistName
An array of playlist names to search for. The function will match these names
against your Spotify playlists and return the IDs of matching playlists.

.EXAMPLE
Get-SpotifyPlaylistIdsByName -PlaylistName "My Favorites", "Workout Mix"

.EXAMPLE
"Chill Vibes" | Get-SpotifyPlaylistIdsByName
#>
function Get-SpotifyPlaylistIdsByName {

    [CmdletBinding()]
    param(
        ########################################################################
        [Alias('Name')]
        [parameter(
            ParameterSetName = 'ByName',
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'One or more Spotify playlist names to search for'
        )]
        [string[]] $PlaylistName
        ########################################################################
    )

    begin {
        # log the start of playlist lookup with provided names
        Microsoft.PowerShell.Utility\Write-Verbose "Starting playlist ID lookup for: $($PlaylistName -join ', ')"
    }


    process {

        # attempt to find playlists in current session
        $Results = @(GenXdev.Console\Get-SpotifyUserPlaylists -Filter $PlaylistName)

        # handle case when no playlists found in current session
        if ($Results.Length -eq 0) {

            Microsoft.PowerShell.Utility\Write-Verbose 'No playlists found in session, checking local cache...'

            # construct path to cache file
            $FilePath = GenXdev.FileSystem\Expand-Path `
                -FilePath "$($Env:LOCALAPPDATA)\GenXdev.PowerShell\Spotify.Playlists.json" `
                -CreateDirectory

            # get cache file info
            $PlaylistCache = [System.IO.FileInfo]::new($FilePath)

            # refresh if cache is outdated (>12 hours) or missing
            if (!$PlaylistCache.Exists -or
                ([datetime]::Now - $PlaylistCache.LastWriteTime -ge [System.TimeSpan]::FromHours(12))) {

                Microsoft.PowerShell.Utility\Write-Verbose 'Cache missing or expired, forcing playlist refresh...'
                $Results = @(GenXdev.Console\Get-SpotifyUserPlaylists -Force -Filter $PlaylistName)
            }
        }

        # throw error if no matching playlists found
        if ($Results.Length -eq 0) {
            throw 'Playlist not found'
        }

        # return the IDs of matching playlists
        $Results | Microsoft.PowerShell.Core\ForEach-Object Id
    }

    end {
    }
}