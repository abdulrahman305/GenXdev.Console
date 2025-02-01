###############################################################################

function Get-SpotifyPlaylistIdsByName {

    [CmdletBinding()]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistName = @()
    )

    process {

        $results = @(Get-SpotifyUserPlaylists -Filter $PlaylistName)

        if ($results.Length -eq 0) {

            $filePath = Expand-Path -FilePath "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify.Playlists.json" -CreateDirectory
            $playlistCache = [System.IO.FileInfo]::new($filePath);

            if (!$playlistCache.Exists -or ([datetime]::Now - $playlistCache.LastWriteTime -ge [timespan]::FromHours(12))) {

                $results = @(Get-SpotifyUserPlaylists -Force -Filter $PlaylistName)
            }
        }

        if ($results.Length -eq 0) {

            throw "Playlist not found"
        }

        $results | ForEach-Object Id
    }
}
