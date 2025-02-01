###############################################################################
<#
.SYNOPSIS
Returns all currently active Spotify devices for current user

.DESCRIPTION
Returns all currently active Spotify devices for current user
#>

function Get-SpotifyActiveDevice {

    [CmdletBinding()]


    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetDevices($apiToken) | Where-Object { $PSItem.IsActive }
    }

    end {


    }
}
