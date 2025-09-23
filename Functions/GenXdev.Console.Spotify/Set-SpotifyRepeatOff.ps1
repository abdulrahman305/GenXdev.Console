<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyRepeatOff.ps1
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