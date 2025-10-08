<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyPrevious.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.298.2025
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
Skips to the previous track in Spotify playback.

.DESCRIPTION
Controls Spotify playback by skipping to the previous track on the currently
active device. Requires valid Spotify API authentication token.

.EXAMPLE
Set-SpotifyPrevious

.EXAMPLE
previous

.EXAMPLE
prev
#>
function Set-SpotifyPrevious {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('previous', 'prev')]
    param()

    begin {

        # output information about the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to skip to previous track in Spotify'
    }


    process {

        # retrieve the current spotify api authentication token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if should process is supported and confirmed
        if ($PSCmdlet.ShouldProcess('Spotify', 'Skip to previous track')) {

            # call spotify api to skip to previous track
            [GenXdev.Helpers.Spotify]::Previous($token)
        }
    }

    end {
    }
}