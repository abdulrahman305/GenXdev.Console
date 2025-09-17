<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyShuffleOn.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
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
Enables Spotify song-shuffle mode.

.DESCRIPTION
Enables shuffle mode on the currently active Spotify playback device. This
function requires a valid Spotify API token and an active playback session.

.EXAMPLE
Set-SpotifyShuffleOn

.EXAMPLE
shuffle
#>
function Set-SpotifyShuffleOn {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('shuffle', 'shuffleon')]
    param()

    begin {

        # output verbose information about the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Enabling shuffle mode on active Spotify device'
    }


    process {

        # retrieve the current spotify api token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with enabling shuffle mode
        if ($PSCmdlet.ShouldProcess('active Spotify device', 'Enable shuffle mode')) {

            # enable shuffle mode using the spotify api
            [GenXdev.Helpers.Spotify]::ShuffleOn($token)
        }
    }

    end {
    }
}