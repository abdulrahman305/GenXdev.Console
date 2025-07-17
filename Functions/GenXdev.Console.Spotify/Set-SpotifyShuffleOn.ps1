###############################################################################

<#
.SYNOPSIS
Enables Spotify song-shuffle mode.

.DESCRIPTION
Enables shuffle mode on the currently active Spotify playback device. This
function requires a valid Spotify API token and an active playback session.

.EXAMPLE
Set-SpotifyShuffleOn

.EXAMPLE
shuffle
#>
function Set-SpotifyShuffleOn {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias('shuffle', 'shuffleon')]
    param()

    begin {

        # output verbose information about the operation
        Microsoft.PowerShell.Utility\Write-Verbose 'Enabling shuffle mode on active Spotify device'
    }


    process {

        # retrieve the current spotify api token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # check if we should proceed with enabling shuffle mode
        if ($PSCmdlet.ShouldProcess('active Spotify device', 'Enable shuffle mode')) {

            # enable shuffle mode using the spotify api
            [GenXdev.Helpers.Spotify]::ShuffleOn($token)
        }
    }

    end {
    }
}