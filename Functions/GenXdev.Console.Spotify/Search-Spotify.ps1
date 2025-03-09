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
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Type of content to search for"
        )]
        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode",
            "All")]
        [string[]] $SearchType = @("Track")
        ########################################################################
    )

    begin {
        # calculate the combined search type bit mask
        # each content type is represented by a power of 2
        [int] $searchTypeTypeId = 0

        # build up the type mask based on requested search types
        if ($SearchType -contains "Album") { $searchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $searchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $searchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $searchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $searchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $searchTypeTypeId += 32 }
        if ($SearchType -eq "All") { $searchTypeTypeId += 63 }

        Write-Verbose "Search type bit mask: $searchTypeTypeId"
    }

    process {

        foreach ($Query in $Queries) {

            Write-Verbose "Searching Spotify for: $Query"

            # perform the search using the helper class and emit results
            [GenXdev.Helpers.Spotify]::Search(
                (Get-SpotifyApiToken),
                $Query,
                $searchTypeTypeId) |
            ForEach-Object { $PSItem } -ErrorAction SilentlyContinue
        }
    }
}
################################################################################
