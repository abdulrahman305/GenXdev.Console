<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-SpotifyAndEnqueue.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.278.2025
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
Searches Spotify and adds the first matching item to the playback queue.

.DESCRIPTION
Performs a search on Spotify using specified criteria and automatically adds the
first matching result to the current playback queue. Supports searching for
tracks, albums, artists, playlists, shows, and episodes.

.PARAMETER Queries
One or more search phrases to find content on Spotify. Each query is processed
sequentially and the first match for each is added to the queue.

.PARAMETER SearchType
Specifies the type(s) of content to search for. Valid options are:
- Track (default)
- Album
- Artist
- Playlist
- Show
- Episode
- All

.EXAMPLE
Search-SpotifyAndEnqueue -Queries "Rage against the machine" -SearchType Track

.EXAMPLE
fmq "Dire Straits You and your friend"
#>
function Search-SpotifyAndEnqueue {

    [CmdletBinding()]
    [Alias('smq', 'fmq')]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to perform'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,
        ########################################################################
        [Alias('t')]
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'The type of content to search for'
        )]
        [SpotifyAPI.Web.SearchRequest+Types]  $SearchType = [SpotifyAPI.Web.SearchRequest+Types]::Track
        ########################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Initialized search type mask: $SearchType"
    }


    process {

        foreach ($Query in $Queries) {

            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # search spotify and add first matching result to queue
            [GenXdev.Helpers.Spotify]::SearchAndAdd(
                            (GenXdev.Console\Get-SpotifyApiToken),
                $Query,
                $SearchType
            ) |
                Microsoft.PowerShell.Core\ForEach-Object {
                    if ($null -ne $PSItem) {
                        $PSItem
                    }
                } -ErrorAction SilentlyContinue
        }
    }

    end {
    }
}