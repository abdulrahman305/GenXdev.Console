        ###############################################################################

<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Controls Spotify playback by pausing the currently playing track on the active
device. If playback is already paused, this command will resume playback.

.EXAMPLE
Set-SpotifyPause

.EXAMPLE
pausemusic
        ###############################################################################>
function Set-SpotifyPause {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("pausemusic", "Resume-Music")]
    param()

    begin {

        # output verbose information about the action
        Microsoft.PowerShell.Utility\Write-Verbose "Attempting to pause/resume Spotify playback"
    }


process {

        # check if we should proceed with the operation
        if ($PSCmdlet.ShouldProcess("Spotify", "Pause/Resume playback")) {

            # call spotify api to toggle pause state using the current auth token
            [GenXdev.Helpers.Spotify]::Pause((GenXdev.Console\Get-SpotifyApiToken))
        }
    }

    end {
    }
}
        ###############################################################################