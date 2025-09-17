<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyPlaylistIdsByName.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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