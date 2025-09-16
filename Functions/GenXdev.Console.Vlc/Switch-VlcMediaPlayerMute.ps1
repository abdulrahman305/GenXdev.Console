<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Switch-VlcMediaPlayerMute.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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