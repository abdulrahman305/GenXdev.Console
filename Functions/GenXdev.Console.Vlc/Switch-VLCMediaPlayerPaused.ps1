################################################################################
<#
.SYNOPSIS
Toggles the pause/play state of the VLC Media Player.

.DESCRIPTION
This function sends a space key to VLC Media Player to toggle between paused
and playing states. It automatically restores focus to the original window
after sending the key command.

.EXAMPLE
Switch-VLCMediaPlayerPaused

Toggles the pause/play state of VLC Media Player.

.EXAMPLE
vlcpause

Uses the alias to toggle the pause/play state.

.EXAMPLE
vlcplay

Uses the alternate alias to toggle the pause/play state.
#>
function Switch-VLCMediaPlayerPaused {

    [CmdletBinding()]
    [Alias('vlcpause', 'vlcplay')]

    param (
    )

    begin {

    }

    process {

        # send space key to vlc media player to toggle pause/play state
        Microsoft.PowerShell.Utility\Write-Verbose "Toggling VLC Media Player pause/play state"

        # send the space key command and restore focus to original window
        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend ' ' -RestoreFocus
    }

    end {

    }
}
################################################################################