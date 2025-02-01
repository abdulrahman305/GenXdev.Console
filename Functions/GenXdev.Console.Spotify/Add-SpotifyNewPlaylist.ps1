###############################################################################

<#
.SYNOPSIS
Creates a new Spotify playlist

.DESCRIPTION
Creates a new Spotify playlist

.PARAMETER Name
The name for the new playlist

.PARAMETER Description
The description for the new playlist

.PARAMETER Public
Make this a public playlist

.PARAMETER Collabrative
Allow others to make changes
#>
function Add-SpotifyNewPlaylist {

    [CmdletBinding()]
    [Alias("newplaylist")]

    param(

        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The name for the new playlist"
        )]
        [string] $Name,
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "The description for the new playlist"
        )]
        [string] $Description = "",
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make this a public playlist"
        )]
        [switch] $Public,
        [parameter(
            Mandatory = $false,
            HelpMessage = "Allow others to make changes"
        )]
        [switch] $Collabrative
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        $result = [GenXdev.Helpers.Spotify]::NewPlaylist($apiToken, $Name, $Description, ($Public -eq $true), ($Collabrative -eq $true));

        if ($Global:SpotifyPlaylistCache -is [System.Collections.Generic.List[object]]) {

            $Global:SpotifyPlaylistCache.Insert(0, $result);
            $filePath = Expand-Path "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json"
            $Global:SpotifyPlaylistCache | ConvertTo-Json -Depth 100 | Out-File $filePath -Force
        }

        $result
    }

    end {


    }
}
