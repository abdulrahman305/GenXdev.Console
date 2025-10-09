<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyUserPlaylists.ps1
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
Returns a collection of Spotify playlists owned by the current user.

.DESCRIPTION
Retrieves all playlists owned by the current Spotify user, with optional
filtering. Results are cached for 12 hours to improve performance unless Force is
specified.

.PARAMETER Filter
Specifies a wildcard pattern to filter playlists by name. Accepts pipeline input.
Multiple patterns can be provided.

.PARAMETER Force
Forces retrieval of fresh data from Spotify API instead of using cached results.

.EXAMPLE
Get-SpotifyUserPlaylists -Filter "Rock*" -Force

.EXAMPLE
"*Metal*" | gupl
#>
function Get-SpotifyUserPlaylists {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('gupl')]

    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'Wildcard pattern to filter playlists by name'
        )]
        [Alias('Uri', 'Id', 'Name')]
        [string[]] $Filter = @('*'),
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Force fresh data retrieval instead of using cache'
        )]
        [switch] $Force
        ########################################################################
    )

    begin {
        # get spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken

        # determine cache file location
        $filePath = GenXdev.FileSystem\Expand-Path `
            "$($Env:LOCALAPPDATA)\GenXdev.PowerShell\Spotify.Playlists.json"

        Microsoft.PowerShell.Utility\Write-Verbose "Cache file: $filePath"
    }


    process {

        # initialize playlist cache list
        [System.Collections.Generic.List[Object]] $SpotifyPlaylistCache = $null

        # check if we should try using cached data
        if ($Force -ne $true) {

            # check if global cache is empty
            if ($null -eq $Script:SpotifyPlaylistCache) {

                Microsoft.PowerShell.Utility\Write-Verbose 'Global cache empty, checking file cache'

                # create file info object for cache file
                $playlistCache = [System.IO.FileInfo]::new($filePath)

                # check if cache file exists and is less than 12 hours old
                if ($playlistCache.Exists -and `
                    ([datetime]::Now - $playlistCache.LastWriteTime -lt `
                            [System.TimeSpan]::FromHours(12))) {

                    Microsoft.PowerShell.Utility\Write-Verbose 'Loading playlists from cache file'

                    # load cached data from file
                    $SpotifyPlaylistCache = $playlistCache.OpenText().ReadToEnd() `
                    | Microsoft.PowerShell.Utility\ConvertFrom-Json -Depth 100

                    # store in global cache
                    Microsoft.PowerShell.Utility\Set-Variable -Name SpotifyPlaylistCache `
                        -Value $SpotifyPlaylistCache -Scope Global -Force
                }
            }
        }

        # check if we need to fetch fresh data
        if (($Force -eq $true) -or ($null -eq $Script:SpotifyPlaylistCache) -or `
            ($Script:SpotifyPlaylistCache.Count -eq 0)) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving fresh playlist data from Spotify API'

            # get playlists from spotify api
            $SpotifyPlaylistCache = `
                [GenXdev.Helpers.Spotify]::GetUserPlaylists($apiToken, '*')

            # update global cache
            Microsoft.PowerShell.Utility\Set-Variable -Name SpotifyPlaylistCache `
                -Value $SpotifyPlaylistCache -Scope Global -Force

            # save to cache file
            $SpotifyPlaylistCache | Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 100 `
            | Microsoft.PowerShell.Utility\Out-File $filePath -Force
        }

        # filter and return playlists matching pattern
        $Script:SpotifyPlaylistCache `
        | Microsoft.PowerShell.Core\ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.Name -like $Filter) {

                $PSItem
            }
        }
    }

    end {
    }
}