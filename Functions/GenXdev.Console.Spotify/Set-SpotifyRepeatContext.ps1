<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatContext.ps1
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
###############################################################################
<#
.SYNOPSIS
Enables playlist repeat mode for Spotify playback.

.DESCRIPTION
Sets the current Spotify context (playlist, album, etc.) to repeat mode on the
active device. This affects the entire playback queue rather than a single track.

.EXAMPLE
Set-SpotifyRepeatContext

.EXAMPLE
repeat

.NOTES
This cmdlet supports ShouldProcess, allowing use of -WhatIf and -Confirm parameters
to control execution of state-changing operations.
#>
function Set-SpotifyRepeatContext {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('repeat')]

    param()

    begin {

        # output information about enabling repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose 'Enabling repeat mode for current Spotify context'
    }


    process {

        # get the current api token for authentication
        $token = GenXdev.Console\Get-SpotifyApiToken

        # enable repeat mode for the current context using the spotify helper
        # only if ShouldProcess confirms the action
        if ($PSCmdlet.ShouldProcess('Current Spotify context', 'Enable repeat mode')) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Setting repeat mode to context'
            [GenXdev.Helpers.Spotify]::RepeatContext($token)
        }
    }

    end {
    }
}