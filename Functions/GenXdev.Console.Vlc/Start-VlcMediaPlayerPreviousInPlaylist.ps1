<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Start-VlcMediaPlayerPreviousInPlaylist.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
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