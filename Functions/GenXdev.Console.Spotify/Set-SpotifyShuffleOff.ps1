###############################################################################
<#
.SYNOPSIS
Disables Spotify song-shuffle mode on the active device.

.DESCRIPTION
Disables the shuffle playback mode on the currently active Spotify device. This
function uses the Spotify Web API to modify the shuffle state of the playback.

.EXAMPLE
Set-SpotifyShuffleOff

.EXAMPLE
noshuffle

.EXAMPLE
shuffleoff
#>
function Set-SpotifyShuffleOff {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('noshuffle', 'shuffleoff')]
    param()

    begin {

        # output information about the operation being performed
        Microsoft.PowerShell.Utility\Write-Verbose 'Disabling shuffle mode on active Spotify device...'
    }


    process {

        # only perform the action if ShouldProcess returns true
        if ($PSCmdlet.ShouldProcess('Spotify', 'Disable shuffle mode')) {

            # retrieve the current api token for spotify authentication
            # and disable shuffle mode using the spotify helper class
                [GenXdev.Helpers.Spotify]::ShuffleOff((GenXdev.Console\Get-SpotifyApiToken))
        }
    }

    end {
    }
}