###############################################################################
<#
.SYNOPSIS
Stops Spotify playback on the active device.

.DESCRIPTION
Stops the currently playing music on the active Spotify device by calling the
Spotify Web API. Requires a valid authentication token.

.EXAMPLE
Set-SpotifyStop

.EXAMPLE
stop

.EXAMPLE
Stop-Music
        ###############################################################################>
function Set-SpotifyStop {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("stop")]
    param()

    begin {
        # output verbose information about stopping playback
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to stop Spotify playback on active device"
    }


process {
        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving Spotify API token"
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with stopping playback
        if ($PSCmdlet.ShouldProcess("Spotify", "Stop playback")) {
            # call spotify api to stop playback
            Microsoft.PowerShell.Utility\Write-Verbose "Sending stop command to Spotify"
            [GenXdev.Helpers.Spotify]::Stop($token)
        }
    }

    end {
    }
}
        ###############################################################################