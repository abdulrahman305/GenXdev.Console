<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyNext.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
Skips to next track on Spotify.

.DESCRIPTION
Advances playback to the next track in the current playlist or album on the
currently active Spotify device. This function requires a valid Spotify API token
and an active playback session.

.EXAMPLE
Set-SpotifyNext

.EXAMPLE
next

.EXAMPLE
skip
#>
function Set-SpotifyNext {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('next', 'skip')]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Set-SpotifyNext operation'
    }


    process {

        # retrieve the current spotify api token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API token'
    $token = GenXdev.Console\Get-SpotifyApiToken

        # skip to the next track using the spotify api
        if ($PSCmdlet.ShouldProcess('Spotify', 'Skip to next track')) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Sending next track command to Spotify'
            [GenXdev.Helpers.Spotify]::Next($token)
        }
    }

    end {
    }
}