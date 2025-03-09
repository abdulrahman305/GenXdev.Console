################################################################################
<#
.SYNOPSIS
Enables song repeat mode in Spotify.

.DESCRIPTION
Sets the repeat mode to 'track' for the currently active Spotify device using the
Spotify Web API. This will make the current song play repeatedly until repeat
mode is disabled.

.EXAMPLE
Set-SpotifyRepeatSong

.EXAMPLE
repeatsong
#>
function Set-SpotifyRepeatSong {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("repeatsong")]

    param()

    begin {

        # inform user that we're about to enable repeat mode
        Write-Verbose "Attempting to enable song repeat mode in Spotify..."
    }

    process {

        # get the current spotify api authentication token
        $token = Get-SpotifyApiToken

        # only proceed if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess("Spotify", "Set repeat mode to 'track'")) {

            # send api request to enable repeat mode for the current song
            [GenXdev.Helpers.Spotify]::RepeatSong($token)
        }
    }

    end {

        # inform user that the operation completed
        Write-Verbose "Spotify repeat mode has been set to 'track'"
    }
}
################################################################################
