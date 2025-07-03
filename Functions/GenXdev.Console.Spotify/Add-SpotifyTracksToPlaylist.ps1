###############################################################################
<#
.SYNOPSIS
Adds tracks to a Spotify playlist.

.DESCRIPTION
Adds one or more tracks to either a named Spotify playlist or a playlist
specified by its ID. Supports pipeline input for track URIs.

.PARAMETER PlaylistName
The name(s) of the Spotify playlist(s) to add tracks to.

.PARAMETER PlaylistId
The Spotify playlist ID(s) to add tracks to.

.PARAMETER Uri
The Spotify track URIs that should be added to the playlist.

.EXAMPLE
Add-SpotifyTracksToPlaylist -PlaylistName "My Favorites" `
    -Uri "spotify:track:1234567890"

.EXAMPLE
"spotify:track:1234567890" | addtoplaylist "My Playlist"
        ###############################################################################>
function Add-SpotifyTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("addtoplaylist")]

    param(
        ########################################################################
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistName,
        ########################################################################
        [parameter(
            ParameterSetName = "ById",
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistId,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify tracks that should be added to the playlist"
        )]
        [string[]] $Uri = @()
        ########################################################################
    )

    begin {
        # get the spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieved Spotify API token"

        # if playlist names were provided, convert them to playlist ids
        if ($PlaylistName.Length -gt 0) {

            Microsoft.PowerShell.Utility\Write-Verbose "Converting playlist names to IDs"
            $PlaylistId = @(GenXdev.Console\Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName))
            Microsoft.PowerShell.Utility\Write-Verbose "Found $($PlaylistId.Length) matching playlists"
        }
    }


process {

        # add provided tracks to each specified playlist
        foreach ($Id in $PlaylistId) {

            Microsoft.PowerShell.Utility\Write-Verbose "Adding $($Uri.Length) tracks to playlist $Id"
            [GenXdev.Helpers.Spotify]::AddToPlaylist($apiToken, $Id, $Uri)
        }
    }

    end {
    }
}
        ###############################################################################