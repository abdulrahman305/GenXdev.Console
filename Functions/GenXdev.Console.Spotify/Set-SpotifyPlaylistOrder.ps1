<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyPlaylistOrder.ps1
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
Reorders tracks within a Spotify playlist by moving a range of items to a new
position.

.DESCRIPTION
Allows repositioning of one or more tracks within a Spotify playlist by
specifying the start position of items to move and their destination position.
Requires valid Spotify API authentication.

.PARAMETER PlaylistId
The unique identifier of the Spotify playlist to modify.

.PARAMETER RangeStart
The zero-based position index of the first track to be moved.

.PARAMETER InsertBefore
The zero-based position index where the moved tracks should be inserted.
For example, to move items to the end of a 10-track playlist, use 10.
To move items to the start, use 0.

.PARAMETER RangeLength
Optional. The number of consecutive tracks to move, starting from RangeStart.
Defaults to 1 if not specified.

.EXAMPLE
Set-SpotifyPlaylistOrder -PlaylistId "2v3iNvBX8Ay1Gt2uXtUKUT" `
                        -RangeStart 5 `
                        -InsertBefore 0 `
                        -RangeLength 2

.EXAMPLE
Set-SpotifyPlaylistOrder "2v3iNvBX8Ay1Gt2uXtUKUT" 9 0
#>
function Set-SpotifyPlaylistOrder {

    [CmdletBinding(SupportsShouldProcess = $true)]

    param(
        ###############################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The Spotify playlist identifier to modify'
        )]
        [string] $PlaylistId,
        ###############################################################################
        [parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = 'The position of the first track to move'
        )]
        [int] $RangeStart,
        ###############################################################################
        [parameter(
            Mandatory = $true,
            Position = 2,
            HelpMessage = 'The position where tracks should be inserted'
        )]
        [int] $InsertBefore,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = ('Number of consecutive tracks to move ' +
                          '(defaults to 1)')
        )]
        [System.Nullable[int]] $RangeLength = $null
        ###############################################################################
    )

    begin {

        # retrieve the current spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }

    process {

        # calculate the actual number of tracks to move
        $tracksToMove = $RangeLength ?? 1

        # prepare descriptive message for should process and verbose output
        $operationDescription = ("Moving ${tracksToMove} tracks from " +
                               "position ${RangeStart} to position ${InsertBefore}")

        $targetDescription = "Spotify playlist ${PlaylistId}"

        # output verbose information about the reordering operation
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Reordering ${targetDescription} - ${operationDescription}"
        )

        # check if the action should be performed based on whatif/confirm
        if ($PSCmdlet.ShouldProcess($targetDescription, $operationDescription)) {

            # call the spotify api to reorder the playlist tracks
            $null = [GenXdev.Helpers.Spotify]::ReorderPlaylist(
                $apiToken,
                $PlaylistId,
                $RangeStart,
                $InsertBefore,
                $RangeLength)
        }
    }

    end {
    }
}
###############################################################################