################################################################################
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
# Using alias and positional parameter
fm "Dire Straits"
#>
function Search-Spotify {

    [CmdletBinding()]
    [Alias("sm", "fm")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = "Type of content to search for"
        )]
        [Alias("t")]
        [SpotifyAPI.Web.SearchRequest+Types] $SearchType = [SpotifyAPI.Web.SearchRequest+Types]::Track
        ########################################################################
    )

    begin {
        Write-Verbose "Search type bit mask: $SearchType"
    }

    process {

        foreach ($Query in $Queries) {

            Write-Verbose "Searching Spotify for: $Query"

            # perform the search using the helper class and emit results
            [GenXdev.Helpers.Spotify]::Search(
                (Get-SpotifyApiToken),
                $Query,
                $SearchType) |
            ForEach-Object { $PSItem } -ErrorAction SilentlyContinue
        }
    }
}
################################################################################