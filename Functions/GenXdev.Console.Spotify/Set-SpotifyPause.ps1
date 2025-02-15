################################################################################

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
#>
function Set-SpotifyPause {

    [CmdletBinding()]
    [Alias("pausemusic", "Resume-Music")]
    param()

    begin {

        # output verbose information about the action
        Write-Verbose "Attempting to pause/resume Spotify playback"
    }

    process {

        # call spotify api to toggle pause state using the current auth token
        [GenXdev.Helpers.Spotify]::Pause((Get-SpotifyApiToken))
    }

    end {
    }
}
################################################################################
