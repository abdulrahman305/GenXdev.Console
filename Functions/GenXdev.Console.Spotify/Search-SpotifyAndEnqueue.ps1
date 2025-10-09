<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-SpotifyAndEnqueue.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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