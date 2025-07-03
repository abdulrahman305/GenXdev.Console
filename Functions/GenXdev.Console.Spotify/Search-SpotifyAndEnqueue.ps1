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
        ###############################################################################>
function Search-SpotifyAndEnqueue {

    [CmdletBinding()]
    [Alias("smq", "fmq")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
        [string[]] $Queries,
        ########################################################################
        [Alias("t")]
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "The type of content to search for"
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

        ###############################################################################