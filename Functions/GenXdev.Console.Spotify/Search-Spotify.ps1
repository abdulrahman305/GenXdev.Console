<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-Spotify.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
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