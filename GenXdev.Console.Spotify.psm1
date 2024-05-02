
###############################################################################

<#
.SYNOPSIS
Performs a Spotify search and plays the first found item

.DESCRIPTION
Performs a Spotify search and plays the first found item on the active device

.PARAMETER Queries
The search phrase

.PARAMETER SearchType
Optionally, the type of item to search for

.EXAMPLE
PS C:\> Search-SpotifyAndPlay Rage against the machine

.EXAMPLE
PS C:\> fmp Dire Straits You and your friend

#>
function Search-SpotifyAndPlay {

    [Alias("smp", "fmp")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,

        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

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

            [GenXdev.Helpers.Spotify]::SearchAndPlay((Get-SpotifyApiToken), $Query, $SearchTypeTypeId) | ForEach-Object { if ($null -ne $PSItem) { $PSItem } } -ErrorAction SilentlyContinue
        }
    }
}

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
PS C:\> Search-SpotifyAndEnqueue Rage against the machine

.EXAMPLE
PS C:\> fmq Dire Straits You and your friend

#>
function Search-SpotifyAndEnqueue {

    [Alias("smq", "fmq")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,

        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

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

###############################################################################

<#
.SYNOPSIS
Performs a Spotify search and returns the search results

.DESCRIPTION
Performs a Spotify search and returns the search results

.PARAMETER Queries
The search phrase

.PARAMETER SearchType
Optionally, the type of item to search for

.EXAMPLE
PS C:\> Search-Spotify Rage against the machine

.EXAMPLE
PS C:\> fm Dire Straits You and your friend

#>
function Search-Spotify {

    [Alias("sm", "fm")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,

        [Alias("t")]
        [ValidateSet("Album", "Artist", "Playlist", "Track", "Show", "Episode", "All")]
        [parameter(Mandatory = $false)]
        [string[]] $SearchType = @("Track")
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

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

            [GenXdev.Helpers.Spotify]::Search((Get-SpotifyApiToken), $Query, $SearchTypeTypeId) | ForEach-Object { $PSItem } -ErrorAction SilentlyContinue
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Starts Spotify playback

.DESCRIPTION
Starts playback on the device that is active on Spotify
#>
function Set-SpotifyStart {

    [Alias("play", "Start-Music")]
    param()

    [GenXdev.Helpers.Spotify]::Start((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Pauses Spotify playback

.DESCRIPTION
Pauses playback on the device that is active on Spotify
#>
function Set-SpotifyPause {

    [Alias("pausemusic", "Resume-Music")]
    param()

    [GenXdev.Helpers.Spotify]::Pause((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Stops Spotify playback

.DESCRIPTION
Stops playback on the device that is active on Spotify
#>
function Set-SpotifyStop {

    [Alias("stop", "Stop-Music")]
    param()
    [GenXdev.Helpers.Spotify]::Stop((Get-SpotifyApiToken));
}

###############################################################################

<#
.SYNOPSIS
Skips to previous track on Spotify

.DESCRIPTION
Skips to previous track on the device that is active on Spotify
#>
function Set-SpotifyPrevious {

    [Alias("previous", "prev")]
    param()

    [GenXdev.Helpers.Spotify]::Previous((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Skips to next track on Spotify

.DESCRIPTION
Skips to next track on the device that is active on Spotify
#>
function Set-SpotifyNext {

    [Alias("next", "skip")]
    param()

    [GenXdev.Helpers.Spotify]::Next((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Enables Spotify song-repeat

.DESCRIPTION
Enables song-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatSong {

    [CmdletBinding()]
    [Alias("repeatsong")]

    param()

    [GenXdev.Helpers.Spotify]::RepeatSong((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Enables Spotify playlist-repeat

.DESCRIPTION
Enables playlist-repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatContext {

    [CmdletBinding()]
    [Alias("repeat")]

    param()

    [GenXdev.Helpers.Spotify]::RepeatContext((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Disables Spotify repeat

.DESCRIPTION
Disables repeat on the device that is active on Spotify
#>
function Set-SpotifyRepeatOff {

    [Alias("norepeat", "repeatoff")]
    param()

    [GenXdev.Helpers.Spotify]::RepeatOff((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Enables Spotify song-shuffle

.DESCRIPTION
Enables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOn {

    [Alias("shuffle", "shuffleon")]
    param()

    [GenXdev.Helpers.Spotify]::ShuffleOn((Get-SpotifyApiToken));
}
###############################################################################

<#
.SYNOPSIS
Disables Spotify song-shuffle

.DESCRIPTION
Disables song-shuffle on the device that is active on Spotify
#>
function Set-SpotifyShuffleOff {

    [Alias("noshuffle", "shuffleoff")]
    param()

    [GenXdev.Helpers.Spotify]::ShuffleOff((Get-SpotifyApiToken));
}

###############################################################################

<#
.SYNOPSIS
Returns a fully populated collection of Spotify playlists owned by current user

.DESCRIPTION
Returns a fully populated collection of Spotify playlists owned by current user

.EXAMPLE
PS C:\> $playLists = Get-SpotifyUserPlaylists; $playLists.Tracks.Items.Track.Name

.EXAMPLE
PS C:\> (upl).Tracks.Items.Track.Name
#>
function Get-SpotifyUserPlaylists {

    [CmdletBinding()]
    [Alias("gupl")]

    param(
        [Alias("Uri", "Id", "Name")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Filter = @("*"),

        [switch] $Force
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
        $Filter = Build-InvocationArguments $MyInvocation $Filter
        $filePath = Expand-Path "$PSScriptRoot\..\..\GenXdev.Local\Spotify.Playlists.json"
    }

    process {

        [System.Collections.Generic.List[Object]] $SpotifyPlaylistCache = $null;

        if ($Force -ne $true) {

            if ($null -eq $Global:SpotifyPlaylistCache) {

                $filePath = Expand-Path "$PSScriptRoot\..\..\GenXdev.Local\Spotify.Playlists.json"
                $playlistCache = [System.IO.FileInfo]::new($filePath);

                if ($playlistCache.Exists -and ([datetime]::Now - $playlistCache.LastWriteTime -lt [timespan]::FromHours(12))) {

                    $SpotifyPlaylistCache = $playlistCache.OpenText().ReadToEnd() | ConvertFrom-Json -Depth 100
                    Set-Variable -Name SpotifyPlaylistCache -Value $SpotifyPlaylistCache -Scope Global -Force
                }
            }
        }

        if (($Force -eq $true) -or ($null -eq $Global:SpotifyPlaylistCache) -or ( $Global:SpotifyPlaylistCache.Count -eq 0)) {

            $SpotifyPlaylistCache = [GenXdev.Helpers.Spotify]::GetUserPlaylists($apiToken, "*");
            Set-Variable -Name SpotifyPlaylistCache -Value $SpotifyPlaylistCache -Scope Global -Force
            $SpotifyPlaylistCache | ConvertTo-Json -Depth 100 | Out-File $filePath -Force
        }

        $Global:SpotifyPlaylistCache | ForEach-Object -ErrorAction SilentlyContinue {

            if ($PSItem.Name -like $Filter) {

                $PSItem
            }
        }
    }

    end {

    }
}


###############################################################################

<#
.SYNOPSIS
Adds tracks to a Spotify playlist

.DESCRIPTION
Adds tracks to a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to add tracks to

.PARAMETER Uri
The Spotify tracks that should be added to the playlist
#>

function Add-SpotifyTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("addtoplaylist")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistName,

        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to add tracks to"
        )]
        [string[]] $PlaylistId,

        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify tracks that should be added to the playlist"
        )]
        [string[]] $Uri = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName))
        }
    }

    process {

        foreach ($Id in $PlaylistId) {

            [GenXdev.Helpers.Spotify]::AddToPlaylist($apiToken, $Id, $Uri);
        }
    }

    end {


    }
}


###############################################################################

<#
.SYNOPSIS
Creates a new Spotify playlist

.DESCRIPTION
Creates a new Spotify playlist

.PARAMETER Name
The name for the new playlist

.PARAMETER Description
The description for the new playlist

.PARAMETER Public
Make this a public playlist

.PARAMETER Collabrative
Allow others to make changes
#>
function Add-SpotifyNewPlaylist {

    [CmdletBinding()]
    [Alias("newplaylist")]

    param(

        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The name for the new playlist"
        )]
        [string] $Name,
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "The description for the new playlist"
        )]
        [string] $Description = "",
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make this a public playlist"
        )]
        [switch] $Public,
        [parameter(
            Mandatory = $false,
            HelpMessage = "Allow others to make changes"
        )]
        [switch] $Collabrative
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        $result = [GenXdev.Helpers.Spotify]::NewPlaylist($apiToken, $Name, $Description, ($Public -eq $true), ($Collabrative -eq $true));

        if ($Global:SpotifyPlaylistCache -is [System.Collections.Generic.List[object]]) {

            $Global:SpotifyPlaylistCache.Insert(0, $result);
            $filePath = Expand-Path "$PSScriptRoot\..\..\GenXdev.Local\Spotify.Playlists.json"
            $Global:SpotifyPlaylistCache | ConvertTo-Json -Depth 100 | Out-File $filePath -Force
        }

        $result
    }

    end {


    }
}

###############################################################################

<#
.SYNOPSIS
Sets the main properties of a Spotify playlist

.DESCRIPTION
Sets the main properties of a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to set properties for

.PARAMETER Name
The new name for the playlist

.PARAMETER Description
The new description for the playlist

.PARAMETER Public
Make the playlist public

.PARAMETER Collabrative
Allow others to make changes

.PARAMETER Private
Make the playlist private

.PARAMETER NoCollabrations
Disallow others to make changes

#>
function Set-SpotifyPlaylistDetails {

    [CmdletBinding()]
    [Alias("spld")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to make changes to"
        )]
        [string] $PlaylistId,
        [parameter(
            Mandatory,
            Position = 1,
            HelpMessage = "The name for the new playlist"
        )]
        [string] $Name,
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The description for the new playlist"
        )]
        [string] $Description = "",
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make this a public playlist"
        )]
        [switch] $Public,
        [parameter(
            Mandatory = $false,
            HelpMessage = "Allow others to make changes to this playlist"
        )]
        [switch] $Collabrative,
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make the playlist private"
        )]
        [switch] $Private,
        [parameter(
            Mandatory = $false,
            HelpMessage = "Disallow others to make changes"
        )]
        [switch] $NoCollabrations

    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        $P = $null;
        $C = $null;

        if ($Public -eq $true) {

            $P = $true
        }

        if ($Collabrative -eq $true) {

            $C = $true
        }

        if ($Private -eq $true) {

            $P = $false
        }

        if ($NoCollabrations -eq $true) {

            $C = $False
        }
    }

    process {

        [GenXdev.Helpers.Spotify]::ChangePlaylistDetails($PlaylistId, $apiToken, $Name, $P, $C, $Description);
    }

    end {

    }
}


###############################################################################

<#
.SYNOPSIS
Removes tracks from a Spotify playlist

.DESCRIPTION
Removes tracks from a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to delete tracks from

.PARAMETER Uri
The Spotify tracks that should be removed from the playlist
#>

function Remove-SpotifyTracksFromPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("removefromplaylist")]

    param(
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to delete tracks from"
        )]
        [string[]] $PlaylistName,

        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to delete tracks from"
        )]
        [string[]] $PlaylistId,

        [parameter(
            Mandatory = $false,
            Position = 1,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify tracks that should be removed from the playlist"
        )]
        [string[]] $Uri = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName)
        }
    }

    process {

        foreach ($Id in $PlaylistId) {

            [GenXdev.Helpers.Spotify]::RemoveFromPlaylist($apiToken, $Id, $Uri);
        }
    }

    end {

    }
}


###############################################################################

<#
.SYNOPSIS
Returns the currently on Spotify playing track

.DESCRIPTION
Returns the currently on Spotify playing track

.EXAMPLE
PS C:\> Get-SpotifyCurrentlyPlaying

.EXAMPLE
PS C:\> (gcp).Item

#>
function Get-SpotifyCurrentlyPlaying {

    [CmdletBinding()]
    [Alias("gcp")]

    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetCurrentlyPlaying($apiToken);
    }

    end {


    }
}

###############################################################################

<#
.SYNOPSIS
Returns Spotify track audio feature information

.DESCRIPTION
Returns Spotify track audio feature information

.PARAMETER Id
The Spotify track to return audio features for
#>

function Get-SpotifyTrackAudioFeatures {

    [CmdletBinding()]
    [Alias("audiofeatures")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track to return audio features for"
        )]
        [string[]] $TrackId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetSeveralAudioFeatures($apiToken, $TrackId);
    }

    end {

    }
}

###############################################################################

<#
.SYNOPSIS
Returns full Spotify track information by given TrackId

.DESCRIPTION
Returns full Spotify track information by given TrackId

.PARAMETER TrackId
The Spotify track id of the track to lookup
#>
function Get-SpotifyTrackById {

    [CmdletBinding()]
    [Alias("gettrack")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string] $TrackId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetTrackById($apiToken, $TrackId);
    }

    end {


    }
}

###############################################################################

<#
.SYNOPSIS
Reorders a range of tracks inside a Spotify playlist

.DESCRIPTION
Reorders a range of tracks inside a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to perform the re-ordering on

.PARAMETER RangeStart
The position of the first item to be reordered

.PARAMETER InsertBefore
The position where the items should be inserted. To reorder the items to the
end of the playlist, simply set insert_before to the position after the last
item. Examples: To reorder the first item to the last position in a playlist
with 10 items, set range_start to 0, and insert_before to 10. To reorder the
last item in a playlist with 10 items to the start of the playlist, set range_start
to 9, and insert_before to 0.

.PARAMETER RangeLength
The amount of items to be reordered. Defaults to 1 if not set. The range of items
to be reordered begins from the range_start position, and includes the range_length
subsequent items. Example: To move the items at index 9-10 to the start of the
playlist, range_start is set to 9, and range_length is set to 2.

#>
function Set-SpotifyPlaylistOrder {

    [CmdletBinding()]
    [Alias("")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to perform the re-ordering on"
        )]
        [string] $PlaylistId,

        [parameter(
            Mandatory,
            Position = 0,
            HelpMessage = "The position of the first item to be reordered"
        )]
        [int] $RangeStart,

        [parameter(
            Mandatory,
            Position = 1,
            HelpMessage = "The position where the items should be inserted. To reorder the items to the
            end of the playlist, simply set insert_before to the position after the last
            item. Examples: To reorder the first item to the last position in a playlist
            with 10 items, set range_start to 0, and insert_before to 10. To reorder the
            last item in a playlist with 10 items to the start of the playlist, set range_start
            to 9, and insert_before to 0."
        )]
        [int] $InsertBefore,

        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The amount of items to be reordered. Defaults to 1 if not set. The range of items
            to be reordered begins from the range_start position, and includes the range_length
            subsequent items. Example: To move the items at index 9-10 to the start of the
            playlist, range_start is set to 9, and range_length is set to 2."
        )]
        [System.Nullable[int]] $RangeLength = $null
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::ReorderPlaylist($apiToken, $PlaylistId, $RangeStart, $InsertBefore, $RangeLength);
    }

    end {

    }
}


###############################################################################

<#
.SYNOPSIS
Returns all tracks of a Spotify playlist

.DESCRIPTION
Returns all tracks of a Spotify playlist

.PARAMETER PlaylistId
The Spotify playlist to return tracks for

#>
function Get-SpotifyPlaylistTracks {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("getplaylist")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to return tracks for",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string] $PlaylistName,

        [Alias("Id")]
        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            HelpMessage = "The Spotify playlist to return tracks for",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string] $PlaylistId
    )

    begin {

        $apiToken = Get-SpotifyApiToken;

        if ([string]::IsNullOrWhiteSpace($PlaylistName) -eq $false) {

            $PlaylistId = @(Get-SpotifyPlaylistIdsByName -PlaylistName @($PlaylistName)) | Select-Object -First 1
        }
    }

    process {

        [GenXdev.Helpers.Spotify]::GetPlaylistTracks($apiToken, $PlaylistId);
    }

    end {

    }
}

###############################################################################

<#
.SYNOPSIS
Returns all tracks saved in users own Spotify Library

.DESCRIPTION
Returns all tracks saved in users own Spotify Library

#>
function Get-SpotifyLikedTracks {

    [CmdletBinding()]
    [Alias("liked")]

    param(
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetLibraryTracks($apiToken);
    }

    end {

    }
}

###############################################################################

<#
.SYNOPSIS
Adds tracks to the users own Spotify Library

.DESCRIPTION
Adds tracks to the users own Spotify Library

.PARAMETER TrackId
The Spotify track Ids of the songs that should be added to liked"
#>

function Add-SpotifyTracksToLiked {

    [CmdletBinding()]
    [Alias("like")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track Uris of the songs that should be added to the playlist"
        )]
        [string[]] $TrackId = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        if ($TrackId.Length -eq 0) {

            $CurrentlyPlaying = Get-SpotifyCurrentlyPlaying

            if ($null -eq $CurrentlyPlaying -or $CurrentlyPlaying.CurrentlyPlayingType -ne "track") {

                Write-Warning "There are no tracks playing at this time"

                return;
            }


            Add-SpotifyTracksToLiked -TrackId ($CurrentlyPlaying.Item.Id)

            $CurrentlyPlaying.Item
        }
        else {

            [GenXdev.Helpers.Spotify]::AddToLiked($apiToken, $TrackId);
        }
    }

    end {


    }
}


###############################################################################

<#
.SYNOPSIS
Moves all tracks from the users own Spotify Library to specified playlist

.DESCRIPTION
Moves all tracks from the users own Spotify Library to specified playlist

.PARAMETER PlaylistId
The Spotify playlist where all liked tracks should move to"
#>

function Move-SpotifyLikedTracksToPlaylist {

    [CmdletBinding(DefaultParameterSetName = "ByName")]
    [Alias("moveliked")]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistName,

        [Alias("Id")]
        [parameter(
            ParameterSetName = "ById",
            Mandatory,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistId
    )

    begin {

        if ($PlaylistName.Length -gt 0) {

            $PlaylistId = Get-SpotifyPlaylistIdsByName -PlaylistName $PlaylistName
        }
    }

    process {

        if ($PlaylistId.Length -eq 0) {

            return;
        }

        $likedTracks = Get-SpotifyLikedTracks
        [bool] $done = $false

        foreach ($Id in $PlaylistId) {

            Add-SpotifyTracksToPlaylist -PlaylistId $Id -Uri @($likedTracks.Track.Uri)
            $done = $true
        }

        if ($done) {

            Remove-SpotifyTracksFromLiked -TrackId @($likedTracks.Track.Id)

            $likedTracks
        }
    }

    end {


    }
}


###############################################################################

function Get-SpotifyPlaylistIdsByName {

    [CmdletBinding()]

    param(
        [Alias("Name")]
        [parameter(
            ParameterSetName = "ByName",
            Mandatory,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify playlist where all liked tracks should move to"
        )]
        [string[]] $PlaylistName = @()
    )

    process {

        $results = @(Get-SpotifyUserPlaylists -Filter $PlaylistName)

        if ($results.Length -eq 0) {

            $filePath = Expand-Path -FilePath "$PSScriptRoot\..\..\GenXdev.Local\Spotify.Playlists.json" -CreateDirectory
            $playlistCache = [System.IO.FileInfo]::new($filePath);

            if (!$playlistCache.Exists -or ([datetime]::Now - $playlistCache.LastWriteTime -ge [timespan]::FromHours(12))) {

                $results = @(Get-SpotifyUserPlaylists -Force -Filter $PlaylistName)
            }
        }

        if ($results.Length -eq 0) {

            throw "Playlist not found"
        }

        $results | ForEach-Object Id
    }
}

###############################################################################

<#
.SYNOPSIS
Removes tracks from the users own Spotify Library

.DESCRIPTION
Removes tracks from the users own Spotify Library

.PARAMETER TrackId
The Spotify track Ids of the songs that should be removed from liked"
#>

function Remove-SpotifyTracksFromLiked {

    [CmdletBinding()]
    [Alias("dislike")]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify track Uris of the songs that should be added to the playlist"
        )]
        [string[]] $TrackId = @()
    )

    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        if ($TrackId.Length -eq 0) {

            $CurrentlyPlaying = Get-SpotifyCurrentlyPlaying

            if ($null -eq $CurrentlyPlaying -or $CurrentlyPlaying.CurrentlyPlayingType -ne "track") {

                Write-Warning "There are no tracks playing at this time"

                return;
            }

            Remove-SpotifyTracksFromLiked -TrackId ($CurrentlyPlaying.Item.Id)

            $CurrentlyPlaying.Item
        }
        else {

            [GenXdev.Helpers.Spotify]::RemoveFromLiked($apiToken, $TrackId);
        }
    }

    end {


    }
}

###############################################################################

<#
.SYNOPSIS
Returns all currently available Spotify devices for current user

.DESCRIPTION
Returns all currently available Spotify devices for current user
#>

function Get-SpotifyDevices {

    [CmdletBinding()]
    [Alias()]

    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;

    }

    process {

        [GenXdev.Helpers.Spotify]::GetDevices($apiToken);
    }

    end {
    }
}


###############################################################################
<#
.SYNOPSIS
Returns all currently active Spotify devices for current user

.DESCRIPTION
Returns all currently active Spotify devices for current user
#>

function Get-SpotifyActiveDevice {

    [CmdletBinding()]
    [Alias()]

    param(
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::GetDevices($apiToken) | Where-Object { $PSItem.IsActive }
    }

    end {


    }
}

###################################################11############################

<#
.SYNOPSIS
Transfers playback to provided Spotify device

.DESCRIPTION
Transfers playback to provided Spotify device

.PARAMETER DeviceId
The Spotify deviceId to transfer playback to
#>

function Set-SpotifyActiveDevice {

    [CmdletBinding()]
    [Alias()]

    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The Spotify deviceId to transfer playback to"
        )]
        [string] $DeviceId
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::SetActiveDevice($apiToken, $DeviceId);
    }

    end {

    }
}

###############################################################################

<#
.SYNOPSIS
Searches for lyrics of a track

.DESCRIPTION
Searches for lyrics of a track

.PARAMETER TrackId
Optional: Spotify id of track to lookup lyrics for

.PARAMETER Queries
Optional: A query to find a track to lookup lyrics for
#>
function Get-SpotifyLyrics {

    [CmdLetBinding(DefaultParameterSetName = "")]
    [Alias("lyrics")]
    param(
        [Alias("Id")]
        [parameter(
            Mandatory = $false,
            ValueFromPipelineByPropertyName = $True,
            ParameterSetName = ""
        )]
        [string] $TrackId = $null,

        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries = $null
    )

    begin {

        if ($null -ne $Queries) {

            $Queries = Build-InvocationArguments $MyInvocation $Queries
        }

        if ($null -ne $Queries) {

            $results = Search-Spotify -SearchType Track -Queries $Queries
            $new = [System.Collections.Generic.List[string]]::new();

            foreach ($track in $results.Tracks.Items) {

                $new.Add("$($track.Artists[0].Name) - $($track.Name)")
            }

            $Queries = $new;
            if ($new.Count -eq 0) {

                Write-Warning "Nothing found"
            }
        }
        else {

            if ([String]::IsNullOrWhiteSpace($TrackId) -eq $false) {

                $track = Get-SpotifyTrackById -TrackId $TrackId

                if ($null -ne $track) {

                    $Queries = @("$($track.Artists[0].Name) - $($track.Name)");
                }
            }
            else {

                $current = Get-SpotifyCurrentlyPlaying

                if ($null -ne $current) {

                    $Queries = @("$($current.Item.Artists[0].Name) - $($current.Item.Name)");
                }
            }
        }

        if ($null -eq $Queries) {

            throw "Currently no song playing, please specify search phrase"
        }
    }

    process {

        foreach ($query in $Queries) {

            $q = [Uri]::EscapeUriString($query)
            [string] $html = "";
            try {

                $html = Invoke-WebRequest -Uri "https://www.musixmatch.com/search/$q" -ErrorAction SilentlyContinue

            }
            catch {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }
            [int] $idx = $html.IndexOf("Best Result");

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx = $html.IndexOf('<a class="title" href="', $idx);

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx += '<a class="title" href="'.Length;

            [int] $idx2 = $html.IndexOf('"', $idx);

            if ($idx2 -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $url = "https://www.musixmatch.com$($html.Substring($idx, $idx2-$idx))"

            try {
                $html = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue
            }
            catch {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx = $html.IndexOf('"body":"')

            if ($idx -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $idx += '"body":"'.Length;

            $idx2 = $html.IndexOf('","language":', $idx);

            if ($idx2 -lt 0) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"
                continue;
            }

            $result = "`"$($html.Substring($idx, $idx2-$idx))`"" | ConvertFrom-Json;

            if ([String]::IsNullOrWhiteSpace($result)) {

                Write-Warning "Nothing found for '$query'"
                Open-GoogleQuery "lyrics $query"1
            }

            $result.Replace("???", "'");
        }
    }
}


###############################################################################

<#
.SYNOPSIS
Returns a ApiToken for Spotify

.DESCRIPTION
Returns a ApiToken for Spotify
#>
function Get-SpotifyApiToken {

    [CmdletBinding()]

    param()

    $ruleName = "Allow Current PowerShell"
    $programPath = Join-Path -Path $PSHOME -ChildPath "pwsh.exe" # for PowerShell Core
    $remoteAddress = "192.168.1.1"

    # Check if the rule already exists
    $existingRule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue

    if ($null -eq $existingRule) {
        # Rule does not exist, create it
        New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Program $programPath -Action Allow -RemoteAddress $remoteAddress
        Write-Host "Firewall rule '$ruleName' created."
    }


        $path = "$PSScriptRoot\..\..\GenXdev.Local\Spotify_Auth.json";

        if ([IO.File]::Exists($path)) {

            $ApiToken = [IO.File]::ReadAllText($path);
        }
        else {

            $ApiToken = Connect-SpotifyApiToken
            Set-SpotifyApiToken $ApiToken | Out-Null
        }

        try {

            [GenXdev.Helpers.Spotify]::GetDevices($ApiToken) | Out-Null
        }
        catch {

            $ApiToken = Connect-SpotifyApiToken
            Set-SpotifyApiToken $ApiToken | Out-Null
        }

        $ApiToken
    }

    ###############################################################################

    <#
.SYNOPSIS
Caches an Spotify API-token for later use

.DESCRIPTION
Caches an Spotify API-token for later use

.PARAMETER ApiToken
The API-token to cache
#>
    function Set-SpotifyApiToken {

        [CmdletBinding()]

        param(

            [parameter(
                Mandatory = $true,
                Position = 0
            )] [string] $ApiToken
        )

        $dir = "$PSScriptRoot\..\..\GenXdev.Local";
        $path = "$dir\Spotify_Auth.json";

        if (![IO.Directory]::Exists($dir)) {

            [IO.Directory]::CreateDirectory($dir);
        }

        [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "));
    }

    ###############################################################################

    <#
.SYNOPSIS
Uses Spotify Open-Auth to request an access token

.DESCRIPTION
Uses Spotify Open-Auth to request an access token

#>
    function Connect-SpotifyApiToken {

        [CmdletBinding()]

        param()

        $url = [GenXdev.Helpers.Spotify]::RequestAuthenticationUri(5642);

        [System.Diagnostics.Process] $process = Open-Webbrowser -PassThrough -ApplicationMode -NewWindow -Width 1000 -Height 800 -Centered -Monitor 0 -Url $url

        [GenXdev.Helpers.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

        if ((!!$process -and $process -is [System.Diagnostics.Process]) -and (!$process.HasExited)) {

            $process.CloseMainWindow() | Out-Null
        }
    }
