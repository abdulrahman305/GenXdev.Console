###############################################################################

<#
.SYNOPSIS
Performs a Spotify search and adds the first item to the queue

.DESCRIPTION
Performs a Spotify search and adds the first item to the queue

.PARAMETER Queries
The search phrase

.PARAMETER SearchType
Optionally, the type of item to search for

.EXAMPLE
PS C:\> Search-SpotifyAndEnqueue "Rage against the machine"

.EXAMPLE
PS C:\> fmq "Dire Straits You and your friend"

#>
function Search-SpotifyAndEnqueue {

    [Alias("smq", "fmq")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,

        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {



        [int] $SearchTypeTypeId = 0;

        if ($SearchType -contains "Album") { $SearchTypeTypeId += 1 }
        if ($SearchType -contains "Artist") { $SearchTypeTypeId += 2 }
        if ($SearchType -contains "Playlist") { $SearchTypeTypeId += 4 }
        if ($SearchType -contains "Track") { $SearchTypeTypeId += 8 }
        if ($SearchType -contains "Show") { $SearchTypeTypeId += 16 }
        if ($SearchType -contains "Episode") { $SearchTypeTypeId += 32 }
        if ($SearchType -contains "All") { $SearchTypeTypeId += 63 }
    }

    process {

        foreach ($Query in $Queries) {

            [GenXdev.Helpers.Spotify]::SearchAndAdd((Get-SpotifyApiToken), $Query, $SearchTypeTypeId) | ForEach-Object { if ($null -ne $PSItem) { $PSItem } } -ErrorAction SilentlyContinue
        }
    }
}
