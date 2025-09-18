<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatContext.ps1
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