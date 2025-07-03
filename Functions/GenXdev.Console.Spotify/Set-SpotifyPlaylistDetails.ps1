###############################################################################
<#
.SYNOPSIS
Sets the main properties of a Spotify playlist.

.DESCRIPTION
Modifies playlist properties including name, description, visibility and
collaboration settings using the Spotify API.

.PARAMETER PlaylistId
The unique identifier of the Spotify playlist to modify.

.PARAMETER Name
The new name to set for the playlist.

.PARAMETER Description
Optional description text for the playlist.

.PARAMETER Public
Switch to make the playlist visible to all users.

.PARAMETER Collabrative
Switch to allow other users to modify the playlist.

.PARAMETER Private
Switch to make the playlist only visible to you.

.PARAMETER NoCollabrations
Switch to prevent other users from modifying the playlist.

.EXAMPLE
Set-SpotifyPlaylistDetails -PlaylistId "1234567890" -Name "My Playlist" `
    -Description "My favorite songs" -Public

.EXAMPLE
spld "1234567890" "Weekend Mix" -Private -NoCollabrations
        ###############################################################################>
function Set-SpotifyPlaylistDetails {

    [CmdletBinding(SupportsShouldProcess)]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [Alias("spld")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Spotify playlist to make changes to"
        )]
        [string] $PlaylistId,
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 1,
            HelpMessage = "The name for the new playlist"
        )]
        [string] $Name,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "The description for the new playlist"
        )]
        [string] $Description = "",
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make this a public playlist"
        )]
        [switch] $Public,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Allow others to make changes to this playlist"
        )]
        [switch] $Collabrative,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Make the playlist private"
        )]
        [switch] $Private,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Disallow others to make changes"
        )]
        [switch] $NoCollabrations
        ########################################################################
    )

    begin {

        # get the spotify api authentication token
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieved Spotify API token"

        # initialize visibility and collaboration flags
        $publicFlag = $null
        $collabFlag = $null

        # set playlist visibility based on switches
        if ($Public -eq $true) {
            $publicFlag = $true
            Microsoft.PowerShell.Utility\Write-Verbose "Setting playlist to public"
        }

        # set collaboration permission based on switches
        if ($Collabrative -eq $true) {
            $collabFlag = $true
            Microsoft.PowerShell.Utility\Write-Verbose "Enabling playlist collaboration"
        }

        # override public flag if private switch is used
        if ($Private -eq $true) {
            $publicFlag = $false
            Microsoft.PowerShell.Utility\Write-Verbose "Setting playlist to private"
        }

        # override collab flag if no collaborations switch is used
        if ($NoCollabrations -eq $true) {
            $collabFlag = $false
            Microsoft.PowerShell.Utility\Write-Verbose "Disabling playlist collaboration"
        }
    }


process {

        Microsoft.PowerShell.Utility\Write-Verbose "Updating playlist $PlaylistId with new settings"

        # call spotify api to update playlist details only if ShouldProcess confirms the action
        if ($PSCmdlet.ShouldProcess("Spotify playlist '$PlaylistId'", "Update playlist details")) {

            [GenXdev.Helpers.Spotify]::ChangePlaylistDetails(
                $PlaylistId,
                $apiToken,
                $Name,
                $publicFlag,
                $collabFlag,
                $Description
            )
        }
    }

    end {
    }
}
        ###############################################################################