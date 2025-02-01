###############################################################################

<#
.SYNOPSIS
Returns the currently on Spotify playing track

.DESCRIPTION
Returns the currently on Spotify playing track

.EXAMPLE
PS C:\> Get-SpotifyCurrentlyPlaying

.EXAMPLE
PS C:\> (gcp).Item

#>
function Get-SpotifyCurrentlyPlaying {

    [CmdletBinding()]
    [Alias("gcp")]

    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetCurrentlyPlaying($apiToken);
    }

    end {


    }
}
