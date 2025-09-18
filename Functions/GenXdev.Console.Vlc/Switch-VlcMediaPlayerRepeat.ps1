<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Switch-VlcMediaPlayerRepeat.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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