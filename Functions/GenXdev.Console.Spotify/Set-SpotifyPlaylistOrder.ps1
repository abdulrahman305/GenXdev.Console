###############################################################################

<#
.SYNOPSIS
Reorders a range of tracks inside a Spotify playlist

.DESCRIPTION
Reorders a range of tracks inside a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to perform the re-ordering on

.PARAMETER RangeStart
The position of the first item to be reordered

.PARAMETER InsertBefore
The position where the items should be inserted. To reorder the items to the
end of the playlist, simply set insert_before to the position after the last
item. Examples: To reorder the first item to the last position in a playlist
with 10 items, set range_start to 0, and insert_before to 10. To reorder the
last item in a playlist with 10 items to the start of the playlist, set range_start
to 9, and insert_before to 0.

.PARAMETER RangeLength
The amount of items to be reordered. Defaults to 1 if not set. The range of items
to be reordered begins from the range_start position, and includes the range_length
subsequent items. Example: To move the items at index 9-10 to the start of the
playlist, range_start is set to 9, and range_length is set to 2.

#>
function Set-SpotifyPlaylistOrder {

    [CmdletBinding()]
    [Alias("")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to perform the re-ordering on"
        )]
        [string] $PlaylistId,

        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The position of the first item to be reordered"
        )]
        [int] $RangeStart,

        [parameter(
            Mandatory,
            Position = 1,
            HelpMessage = "The position where the items should be inserted. To reorder the items to the
            end of the playlist, simply set insert_before to the position after the last
            item. Examples: To reorder the first item to the last position in a playlist
            with 10 items, set range_start to 0, and insert_before to 10. To reorder the
            last item in a playlist with 10 items to the start of the playlist, set range_start
            to 9, and insert_before to 0."
        )]
        [int] $InsertBefore,

        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The amount of items to be reordered. Defaults to 1 if not set. The range of items
            to be reordered begins from the range_start position, and includes the range_length
            subsequent items. Example: To move the items at index 9-10 to the start of the
            playlist, range_start is set to 9, and range_length is set to 2."
        )]
        [System.Nullable[int]] $RangeLength = $null
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::ReorderPlaylist($apiToken, $PlaylistId, $RangeStart, $InsertBefore, $RangeLength);
    }

    end {

    }
}
