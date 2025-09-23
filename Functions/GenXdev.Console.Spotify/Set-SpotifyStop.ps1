<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyStop.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
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
Stops Spotify playback on the active device.

.DESCRIPTION
Stops the currently playing music on the active Spotify device by calling the
Spotify Web API. Requires a valid authentication token.

.EXAMPLE
Set-SpotifyStop

.EXAMPLE
stop

.EXAMPLE
Stop-Music
#>
function Set-SpotifyStop {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('stop')]
    param()

    begin {
        # output verbose information about stopping playback
        Microsoft.PowerShell.Utility\Write-Verbose 'Attempting to stop Spotify playback on active device'
    }


    process {
        # retrieve the current spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API token'
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with stopping playback
        if ($PSCmdlet.ShouldProcess('Spotify', 'Stop playback')) {
            # call spotify api to stop playback
            Microsoft.PowerShell.Utility\Write-Verbose 'Sending stop command to Spotify'
            [GenXdev.Helpers.Spotify]::Stop($token)
        }
    }

    end {
    }
}