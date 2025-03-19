################################################################################
<#
.SYNOPSIS
Disables Spotify repeat mode for the currently active device.

.DESCRIPTION
This function disables the repeat mode on the currently active Spotify device
using the Spotify Web API. It requires a valid Spotify API token which is
automatically retrieved using Get-SpotifyApiToken.

.EXAMPLE
Set-SpotifyRepeatOff

.EXAMPLE
norepeat

.EXAMPLE
repeatoff
#>
function Set-SpotifyRepeatOff {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("norepeat", "repeatoff")]
    param()

    begin {

        # output verbose information about disabling repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose "Disabling Spotify repeat mode on active device..."
    }

    process {

        # get the current spotify api authentication token
        $token = GenXdev.Console\Get-SpotifyApiToken

        # use ShouldProcess to confirm the operation
        if ($PSCmdlet.ShouldProcess("Spotify active device", "Turn off repeat mode")) {

            # call the spotify api to disable repeat mode
            [GenXdev.Helpers.Spotify]::RepeatOff($token)
        }
    }

    end {
    }
}
################################################################################