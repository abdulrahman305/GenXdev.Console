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
        ###############################################################################>
function Search-SpotifyAndPlay {

    [CmdletBinding()]
    [Alias("smp", "fmp")]

    param (
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "One or more search phrases to look for on Spotify"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "The type of content to search for"
        )]
        [Alias("t")]
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
        ###############################################################################