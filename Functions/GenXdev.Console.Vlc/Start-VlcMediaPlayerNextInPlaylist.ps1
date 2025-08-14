################################################################################
<#
.SYNOPSIS
Advances VLC Media Player to the next item in the current playlist.

.DESCRIPTION
This function sends the 'n' keystroke to VLC Media Player to skip to the next
track or media item in the currently loaded playlist. It focuses the VLC window,
sends the next command, and restores focus to the PowerShell console. The
function includes ShouldProcess support for confirmation prompts when needed.

.EXAMPLE
Start-VlcMediaPlayerNextInPlaylist

.EXAMPLE
vlcnext
#>
function Start-VlcMediaPlayerNextInPlaylist {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('vlcnext')]

    param(
    )

    begin {

        # check if shouldprocess is enabled and user wants to proceed
        Microsoft.PowerShell.Utility\Write-Verbose `
            'Preparing to advance VLC Media Player to next playlist item'
    }

    process {

        # verify user confirmation before sending next command to vlc
        if ($PSCmdlet.ShouldProcess('VLC Media Player', 'Next in playlist')) {

            Microsoft.PowerShell.Utility\Write-Verbose `
                'Sending next command to VLC Media Player'

            # send the 'n' key to vlc to advance to next playlist item
            # restore focus ensures powershell regains control after command
            GenXdev.Console\Open-VlcMediaPlayer -KeysToSend 'n' -RestoreFocus

            Microsoft.PowerShell.Utility\Write-Verbose `
                'Successfully sent next command to VLC Media Player'
        }
    }

    end {
    }
}
################################################################################