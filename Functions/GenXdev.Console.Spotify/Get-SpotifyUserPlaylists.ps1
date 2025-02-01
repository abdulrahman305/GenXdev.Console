###############################################################################

<#
.SYNOPSIS
Returns a fully populated collection of Spotify playlists owned by current user

.DESCRIPTION
Returns a fully populated collection of Spotify playlists owned by current user

.EXAMPLE
PS C:\> $playLists = Get-SpotifyUserPlaylists; $playLists.Tracks.Items.Track.Name

.EXAMPLE
PS C:\> (upl).Tracks.Items.Track.Name
#>
function Get-SpotifyUserPlaylists {

    [CmdletBinding()]
    [Alias("gupl")]

    param(
        [Alias("Uri", "Id", "Name")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string[]] $Filter = @("*"),

        [switch] $Force
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
        $filePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json"
    }

    process {

        [System.Collections.Generic.List[Object]] $SpotifyPlaylistCache = $null;

        if ($Force -ne $true) {

            if ($null -eq $Global:SpotifyPlaylistCache) {

                $filePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json"
                $playlistCache = [System.IO.FileInfo]::new($filePath);

                if ($playlistCache.Exists -and ([datetime]::Now - $playlistCache.LastWriteTime -lt [timespan]::FromHours(12))) {

                    $SpotifyPlaylistCache = $playlistCache.OpenText().ReadToEnd() | ConvertFrom-Json -Depth 100
                    Set-Variable -Name SpotifyPlaylistCache -Value $SpotifyPlaylistCache -Scope Global -Force
                }
            }
        }

        if (($Force -eq $true) -or ($null -eq $Global:SpotifyPlaylistCache) -or ( $Global:SpotifyPlaylistCache.Count -eq 0)) {

            $SpotifyPlaylistCache = [GenXdev.Helpers.Spotify]::GetUserPlaylists($apiToken, "*");
            Set-Variable -Name SpotifyPlaylistCache -Value $SpotifyPlaylistCache -Scope Global -Force
            $SpotifyPlaylistCache | ConvertTo-Json -Depth 100 | Out-File $filePath -Force
        }

        $Global:SpotifyPlaylistCache | ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.Name -like $Filter) {

                $PSItem
            }
        }
    }

    end {

    }
}
