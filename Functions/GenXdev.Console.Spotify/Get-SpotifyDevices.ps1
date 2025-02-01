###############################################################################

<#
.SYNOPSIS
Returns all currently available Spotify devices for current user

.DESCRIPTION
Returns all currently available Spotify devices for current user
#>

function Get-SpotifyDevices {

    [CmdletBinding()]


    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;

    }

    process {

        [GenXdev.Helpers.Spotify]::GetDevices($apiToken);
    }

    end {
    }
}
