################################################################################

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
    [Alias("smq", "fmq")]

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
        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode",
            "All")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The type of content to search for"
        )]
        [string[]] $SearchType = @("Track")
        ########################################################################
    )

    begin {

        # initialize search type bit mask for filtering results
        [int] $searchTypeTypeId = 0

        # build composite search type mask based on selected content types
        if ($SearchType -contains "Album") { $searchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $searchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $searchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $searchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $searchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $searchTypeTypeId += 32 }
        if ($SearchType -contains "All") { $searchTypeTypeId += 63 }

        Write-Verbose "Initialized search type mask: $searchTypeTypeId"
    }

    process {

        foreach ($Query in $Queries) {

            Write-Verbose "Processing query: $Query"

            # search spotify and add first matching result to queue
            [GenXdev.Helpers.Spotify]::SearchAndAdd(
                (Get-SpotifyApiToken),
                $Query,
                $searchTypeTypeId
            ) |
            ForEach-Object {
                if ($null -ne $PSItem) {
                    $PSItem
                }
            } -ErrorAction SilentlyContinue
        }
    }

    end {
    }
}

################################################################################
