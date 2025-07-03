###############################################################################
<#
.SYNOPSIS
Skips to next track on Spotify.

.DESCRIPTION
Advances playback to the next track in the current playlist or album on the
currently active Spotify device. This function requires a valid Spotify API token
and an active playback session.

.EXAMPLE
Set-SpotifyNext

.EXAMPLE
next

.EXAMPLE
skip
        ###############################################################################>
function Set-SpotifyNext {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("next", "skip")]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Set-SpotifyNext operation"
    }


process {

        # retrieve the current spotify api token
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving Spotify API token"
        $token = GenXdev.Console\Get-SpotifyApiToken

        # skip to the next track using the spotify api
        if ($PSCmdlet.ShouldProcess("Spotify", "Skip to next track")) {

            Microsoft.PowerShell.Utility\Write-Verbose "Sending next track command to Spotify"
            [GenXdev.Helpers.Spotify]::Next($token)
        }
    }

    end {
    }
}
        ###############################################################################