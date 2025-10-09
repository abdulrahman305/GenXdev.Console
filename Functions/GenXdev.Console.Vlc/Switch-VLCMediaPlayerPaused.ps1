<##############################################################################
Part of PowerShell module : GenXdev.Console.Vlc
Original cmdlet filename  : Switch-VLCMediaPlayerPaused.ps1
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