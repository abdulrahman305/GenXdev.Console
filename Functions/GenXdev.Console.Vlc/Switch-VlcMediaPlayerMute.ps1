################################################################################
<#
.SYNOPSIS
Toggles the mute state of the VLC Media Player.

.DESCRIPTION
This function sends the 'm' key to VLC Media Player to toggle between muted
and unmuted audio states. The function focuses VLC, sends the mute/unmute
command, and then restores focus to the previously active window.

.EXAMPLE
Switch-VlcMediaPlayerMute

Toggles the mute state of VLC Media Player using the full function name.

.EXAMPLE
vlcmute

Toggles the mute state of VLC Media Player using the short alias.
#>
function Switch-VlcMediaPlayerMute {

    [CmdletBinding()]
    [Alias('vlcmute', 'vlcunmute')]

    param (
    )

    begin {

    }

    process {

        # send the 'm' key to vlc media player to toggle mute state
        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend 'm' -RestoreFocus
    }

    end {

    }
}
################################################################################