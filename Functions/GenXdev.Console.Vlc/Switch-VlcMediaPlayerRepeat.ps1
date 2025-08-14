################################################################################
<#
.SYNOPSIS
Toggles the repeat mode in VLC Media Player.

.DESCRIPTION
This function sends the 'r' key command to VLC Media Player to toggle between
different repeat modes (no repeat, repeat current, repeat all). The function
opens VLC if it's not already running and restores focus to the previous
window after sending the command.

.EXAMPLE
Switch-VlcMediaPlayerRepeat

.EXAMPLE
vlcrepeat
#>
function Switch-VlcMediaPlayerRepeat {

    [CmdletBinding()]
    [Alias('vlcrepeat')]

    param(
    )

    begin {

    }

    process {

        # send the repeat toggle key ('r') to vlc media player
        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend 'r' -RestoreFocus
    }

    end {

    }
}
################################################################################