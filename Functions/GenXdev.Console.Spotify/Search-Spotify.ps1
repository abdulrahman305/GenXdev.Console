<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-Spotify.ps1
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
Performs a Spotify search and returns matching items.

.DESCRIPTION
Searches Spotify's catalog for items matching the provided search query. Can
search for tracks, albums, artists, playlists, shows, and episodes. Results are
returned through the pipeline.

.PARAMETER Queries
One or more search phrases to look up in Spotify's catalog. Multiple queries will
be processed sequentially.

.PARAMETER SearchType
The type(s) of items to search for. Valid values are: Album, Artist, Playlist,
Track, Show, Episode, or All. Default is Track.

.EXAMPLE
Search-Spotify -Queries "Rage against the machine" -SearchType Track

.EXAMPLE
Using alias and positional parameter
fm "Dire Straits"
#>
function Search-Spotify {

    [CmdletBinding()]
    [Alias('sm', 'fm')]

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
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'Type of content to search for'
        )]
        [Alias('t')]
        [SpotifyAPI.Web.SearchRequest+Types] $SearchType = [SpotifyAPI.Web.SearchRequest+Types]::Track
        ########################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Search type bit mask: $SearchType"
    }


    process {

        foreach ($Query in $Queries) {

            Microsoft.PowerShell.Utility\Write-Verbose "Searching Spotify for: $Query"

            # perform the search using the helper class and emit results
            [GenXdev.Helpers.Spotify]::Search(
                (GenXdev.Console\Get-SpotifyApiToken),
                $Query,
                $SearchType) |
                Microsoft.PowerShell.Core\ForEach-Object { $PSItem } -ErrorAction SilentlyContinue
        }
    }
}