###############################################################################

<#
.SYNOPSIS
Returns all tracks saved in users own Spotify Library

.DESCRIPTION
Returns all tracks saved in users own Spotify Library

#>
function Get-SpotifyLikedTracks {

    [CmdletBinding()]
    [Alias("liked")]

    param(
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetLibraryTracks($apiToken);
    }

    end {

    }
}
