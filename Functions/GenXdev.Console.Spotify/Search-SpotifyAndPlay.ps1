################################################################################
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
    [Alias("smp", "fmp")]

    param (
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "One or more search phrases to look for on Spotify"
        )]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "The type of content to search for"
        )]
        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode",
            "All")]
        [string[]] $SearchType = @("Track")
        ########################################################################
    )

    begin {
        # calculate the search type bit mask based on selected content types
        [int] $searchTypeTypeId = 0

        # build bit flags for each content type
        if ($SearchType -contains "Album") { $searchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $searchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $searchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $searchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $searchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $searchTypeTypeId += 32 }
        if ($SearchType -contains "All") { $searchTypeTypeId += 63 }

        Write-Verbose "Search type bit mask: $searchTypeTypeId"
    }

    process {

        foreach ($Query in $Queries) {

            Write-Verbose "Searching Spotify for: $Query"

            # search spotify and play the first matching item
            [GenXdev.Helpers.Spotify]::SearchAndPlay(
                (Get-SpotifyApiToken),
                $Query,
                $searchTypeTypeId) |
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
