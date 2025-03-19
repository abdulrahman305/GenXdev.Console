################################################################################
<#
.SYNOPSIS
Starts Spotify playback on the currently active device.

.DESCRIPTION
This function initiates playback on the device that is currently active in
Spotify. It uses the Spotify API token to authenticate the request and control
playback.

.EXAMPLE
Set-SpotifyStart

.EXAMPLE
play
#>
function Set-SpotifyStart {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("play", "Start-Music")]
    param()

    begin {

        # output verbose information about starting playback
        Microsoft.PowerShell.Utility\Write-Verbose "Initiating Spotify playback on active device"
    }

    process {

        # retrieve the current spotify api token for authentication
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with starting playback
        if ($PSCmdlet.ShouldProcess("active Spotify device", "Start playback")) {

            # use the spotify helper class to start playback
            [GenXdev.Helpers.Spotify]::Start($token)
        }
    }

    end {
    }
}
################################################################################