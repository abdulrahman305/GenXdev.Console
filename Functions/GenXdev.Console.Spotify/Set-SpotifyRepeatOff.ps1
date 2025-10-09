<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatOff.ps1
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
Disables Spotify repeat mode for the currently active device.

.DESCRIPTION
This function disables the repeat mode on the currently active Spotify device
using the Spotify Web API. It requires a valid Spotify API token which is
automatically retrieved using Get-SpotifyApiToken.

.EXAMPLE
Set-SpotifyRepeatOff

.EXAMPLE
norepeat

.EXAMPLE
repeatoff
#>
function Set-SpotifyRepeatOff {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('norepeat', 'repeatoff')]
    param()

    begin {

        # output verbose information about disabling repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose 'Disabling Spotify repeat mode on active device...'
    }


    process {

        # get the current spotify api authentication token
    $token = GenXdev.Console\Get-SpotifyApiToken

        # use ShouldProcess to confirm the operation
        if ($PSCmdlet.ShouldProcess('Spotify active device', 'Turn off repeat mode')) {

            # call the spotify api to disable repeat mode
            [GenXdev.Helpers.Spotify]::RepeatOff($token)
        }
    }

    end {
    }
}