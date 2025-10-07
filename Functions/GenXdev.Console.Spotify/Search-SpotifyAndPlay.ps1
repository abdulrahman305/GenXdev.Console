<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-SpotifyAndPlay.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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
Performs a Spotify search and plays the first found item.

.DESCRIPTION
Searches Spotify using the provided query string and automatically plays the first
matching item on the currently active Spotify device. Can search for different
types of content including tracks, albums, artists, playlists, shows and episodes.

.PARAMETER Queries
One or more search phrases to look for on Spotify. Each query will be processed
in sequence.

.PARAMETER SearchType
The type of content to search for. Valid options are:
- Track (default)
- Album
- Artist
- Playlist
- Show
- Episode
- All

.EXAMPLE
Search-SpotifyAndPlay -Queries "Rage against the machine" -SearchType Track

.EXAMPLE
fmp "Dire Straits You and your friend"
#>
function Search-SpotifyAndPlay {

    [CmdletBinding()]
    [Alias('smp', 'fmp')]

    param (
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'One or more search phrases to look for on Spotify'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'The type of content to search for'
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

            # search spotify and play the first matching item
            [GenXdev.Helpers.Spotify]::SearchAndPlay(
                            (GenXdev.Console\Get-SpotifyApiToken),
                $Query,
                $SearchType) |
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