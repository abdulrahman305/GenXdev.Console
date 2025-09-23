<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyShuffleOff.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
Disables Spotify song-shuffle mode on the active device.

.DESCRIPTION
Disables the shuffle playback mode on the currently active Spotify device. This
function uses the Spotify Web API to modify the shuffle state of the playback.

.EXAMPLE
Set-SpotifyShuffleOff

.EXAMPLE
noshuffle

.EXAMPLE
shuffleoff
#>
function Set-SpotifyShuffleOff {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('noshuffle', 'shuffleoff')]
    param()

    begin {

        # output information about the operation being performed
        Microsoft.PowerShell.Utility\Write-Verbose 'Disabling shuffle mode on active Spotify device...'
    }


    process {

        # only perform the action if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess('Spotify', 'Disable shuffle mode')) {

            # retrieve the current api token for spotify authentication
            # and disable shuffle mode using the spotify helper class
                [GenXdev.Helpers.Spotify]::ShuffleOff((GenXdev.Console\Get-SpotifyApiToken))
        }
    }

    end {
    }
}