<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Search-SpotifyAndPlay.ps1
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