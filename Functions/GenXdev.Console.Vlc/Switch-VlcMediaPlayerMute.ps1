<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Switch-VlcMediaPlayerMute.ps1
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