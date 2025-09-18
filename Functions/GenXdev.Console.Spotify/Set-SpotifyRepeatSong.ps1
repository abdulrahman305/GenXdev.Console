<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatSong.ps1
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
Enables song repeat mode in Spotify.

.DESCRIPTION
Sets the repeat mode to 'track' for the currently active Spotify device using the
Spotify Web API. This will make the current song play repeatedly until repeat
mode is disabled.

.EXAMPLE
Set-SpotifyRepeatSong

.EXAMPLE
repeatsong
#>
function Set-SpotifyRepeatSong {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('repeatsong')]

    param()

    begin {

        # inform user that we're about to enable repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to enable song repeat mode in Spotify...'
    }


    process {

        # get the current spotify api authentication token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # only proceed if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess('Spotify', "Set repeat mode to 'track'")) {

            # send api request to enable repeat mode for the current song
            [GenXdev.Helpers.Spotify]::RepeatSong($token)
        }
    }

    end {

        # inform user that the operation completed
        Microsoft.PowerShell.Utility\Write-Verbose "Spotify repeat mode has been set to 'track'"
    }
}