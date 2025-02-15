################################################################################
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
    [Alias("gupl")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Wildcard pattern to filter playlists by name"
        )]
        [Alias("Uri", "Id", "Name")]
        [string[]] $Filter = @("*"),
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Force fresh data retrieval instead of using cache"
        )]
        [switch] $Force
        ########################################################################
    )

    begin {

        # get spotify api authentication token
        $apiToken = Get-SpotifyApiToken

        # determine cache file location
        $filePath = Expand-Path `
            "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json"

        Write-Verbose "Cache file: $filePath"
    }

    process {

        # initialize playlist cache list
        [System.Collections.Generic.List[Object]] $SpotifyPlaylistCache = $null

        # check if we should try using cached data
        if ($Force -ne $true) {

            # check if global cache is empty
            if ($null -eq $Global:SpotifyPlaylistCache) {

                Write-Verbose "Global cache empty, checking file cache"

                # create file info object for cache file
                $playlistCache = [System.IO.FileInfo]::new($filePath)

                # check if cache file exists and is less than 12 hours old
                if ($playlistCache.Exists -and `
                    ([datetime]::Now - $playlistCache.LastWriteTime -lt `
                            [timespan]::FromHours(12))) {

                    Write-Verbose "Loading playlists from cache file"

                    # load cached data from file
                    $SpotifyPlaylistCache = $playlistCache.OpenText().ReadToEnd() `
                    | ConvertFrom-Json -Depth 100

                    # store in global cache
                    Set-Variable -Name SpotifyPlaylistCache `
                        -Value $SpotifyPlaylistCache -Scope Global -Force
                }
            }
        }

        # check if we need to fetch fresh data
        if (($Force -eq $true) -or ($null -eq $Global:SpotifyPlaylistCache) -or `
            ($Global:SpotifyPlaylistCache.Count -eq 0)) {

            Write-Verbose "Retrieving fresh playlist data from Spotify API"

            # get playlists from spotify api
            $SpotifyPlaylistCache = `
                [GenXdev.Helpers.Spotify]::GetUserPlaylists($apiToken, "*")

            # update global cache
            Set-Variable -Name SpotifyPlaylistCache `
                -Value $SpotifyPlaylistCache -Scope Global -Force

            # save to cache file
            $SpotifyPlaylistCache | ConvertTo-Json -Depth 100 `
            | Out-File $filePath -Force
        }

        # filter and return playlists matching pattern
        $Global:SpotifyPlaylistCache `
        | ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.Name -like $Filter) {

                $PSItem
            }
        }
    }

    end {
    }
}
################################################################################
