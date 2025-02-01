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
