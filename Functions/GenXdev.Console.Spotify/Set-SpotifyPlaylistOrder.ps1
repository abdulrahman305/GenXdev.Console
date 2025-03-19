################################################################################
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
# Move last track to start of playlist
Set-SpotifyPlaylistOrder "2v3iNvBX8Ay1Gt2uXtUKUT" 9 0
#>
function Set-SpotifyPlaylistOrder {

    [CmdletBinding(SupportsShouldProcess = $true)]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Spotify playlist identifier to modify"
        )]
        [string] $PlaylistId,
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "The position of the first track to move"
        )]
        [int] $RangeStart,
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 2,
            HelpMessage = "The position where tracks should be inserted"
        )]
        [int] $InsertBefore,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = "Number of consecutive tracks to move (defaults to 1)"
        )]
        [System.Nullable[int]] $RangeLength = $null
        ########################################################################
    )

    begin {

        # retrieve the current spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }

    process {

        # prepare message for should process and verbose output
        $operationDescription = "Moving $($RangeLength ?? 1) tracks from position $RangeStart to position $InsertBefore"
        $targetDescription = "Spotify playlist $PlaylistId"

        Microsoft.PowerShell.Utility\Write-Verbose "Reordering $targetDescription - $operationDescription"

        # check if the action should be performed
        if ($PSCmdlet.ShouldProcess($targetDescription, $operationDescription)) {

            # call the spotify api to reorder the playlist tracks
            [GenXdev.Helpers.Spotify]::ReorderPlaylist(
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
################################################################################