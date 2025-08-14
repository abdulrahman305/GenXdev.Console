################################################################################
<#
.SYNOPSIS
Moves to the previous item in the VLC Media Player playlist.

.DESCRIPTION
This function sends the 'p' key command to VLC Media Player to navigate to the
previous item in the current playlist. The function supports WhatIf operations
and will restore focus after sending the command.

.EXAMPLE
Start-VlcMediaPlayerPreviousInPlaylist

.EXAMPLE
vlcprev

.EXAMPLE
vlcback
#>
function Start-VlcMediaPlayerPreviousInPlaylist {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('vlcprev', 'vlcback')]

    param (
    )

    begin {

    }

    process {

        # check if the user wants to proceed with the operation
        if ($PSCmdlet.ShouldProcess('VLC Media Player',
            'Go to previous item in playlist')) {

            # send the 'p' key to vlc media player to go to previous playlist item
            GenXdev.Console\Open-VlcMediaPlayer -KeysToSend 'p' -RestoreFocus
        }
    }

    end {

    }
}
################################################################################