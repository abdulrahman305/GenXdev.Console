################################################################################
<#
.SYNOPSIS
Enables playlist repeat mode for Spotify playback.

.DESCRIPTION
Sets the current Spotify context (playlist, album, etc.) to repeat mode on the
active device. This affects the entire playback queue rather than a single track.

.EXAMPLE
Set-SpotifyRepeatContext

.EXAMPLE
repeat
#>
function Set-SpotifyRepeatContext {

    [CmdletBinding()]
    [Alias("repeat")]

    param()

    begin {

        # output information about enabling repeat mode
        Write-Verbose "Enabling repeat mode for current Spotify context"
    }

    process {

        # get the current api token for authentication
        Write-Verbose "Retrieving Spotify API token"
        $token = Get-SpotifyApiToken

        # enable repeat mode for the current context using the spotify helper
        Write-Verbose "Setting repeat mode to context"
        [GenXdev.Helpers.Spotify]::RepeatContext($token)
    }

    end {
    }
}
################################################################################
