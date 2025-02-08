################################################################################
<#
.SYNOPSIS
Retrieves Spotify playlist IDs by their names.

.DESCRIPTION
This function searches for Spotify playlists by name and returns their
corresponding IDs. It first attempts to find playlists in the current session,
then falls back to a cached list if available, and finally forces a new fetch if
needed.

.PARAMETER PlaylistName
An array of playlist names to search for. The function will return IDs for all
matching playlists.

.EXAMPLE
Get-SpotifyPlaylistIdsByName -PlaylistName "My Favorites"

.EXAMPLE
"My Favorites" | Get-SpotifyPlaylistIdsByName
#>
function Get-SpotifyPlaylistIdsByName {

    [CmdletBinding()]
    param(
        ########################################################################
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist names to search for"
        )]
        [string[]] $PlaylistName = @()
        ########################################################################
    )

    begin {
        Write-Verbose "Starting playlist ID lookup for: $($PlaylistName -join ', ')"
    }

    process {
        # try to get playlists from current session
        $Results = @(Get-SpotifyUserPlaylists -Filter $PlaylistName)

        # if no results found, check cached playlists
        if ($Results.Length -eq 0) {
            Write-Verbose "No playlists found in current session, checking cache..."

            $FilePath = Expand-Path `
                -FilePath "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json" `
                -CreateDirectory

            $PlaylistCache = [System.IO.FileInfo]::new($FilePath)

            # if cache is old or doesn't exist, force refresh
            if (!$PlaylistCache.Exists -or
                ([datetime]::Now - $PlaylistCache.LastWriteTime -ge [timespan]::FromHours(12))) {

                Write-Verbose "Cache missing or expired, forcing playlist refresh..."
                $Results = @(Get-SpotifyUserPlaylists -Force -Filter $PlaylistName)
            }
        }

        # throw if no playlists found
        if ($Results.Length -eq 0) {
            throw "Playlist not found"
        }

        # return playlist IDs
        $Results | ForEach-Object Id
    }

    end {
    }
}
################################################################################
