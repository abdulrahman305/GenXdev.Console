<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Switch-VlcMediaPlayerRepeat.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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