<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyStart.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
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
Starts Spotify playback on the currently active device.

.DESCRIPTION
This function initiates playback on the device that is currently active in
Spotify. It uses the Spotify API token to authenticate the request and control
playback.

.EXAMPLE
Set-SpotifyStart

.EXAMPLE
play
#>
function Set-SpotifyStart {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('play', 'startmusic')]
    param()

    begin {

        # output verbose information about starting playback
        Microsoft.PowerShell.Utility\Write-Verbose 'Initiating Spotify playback on active device'
    }


    process {

        # retrieve the current spotify api token for authentication
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with starting playback
        if ($PSCmdlet.ShouldProcess('active Spotify device', 'Start playback')) {

            # use the spotify helper class to start playback
            [GenXdev.Helpers.Spotify]::Start($token)
        }
    }

    end {
    }
}