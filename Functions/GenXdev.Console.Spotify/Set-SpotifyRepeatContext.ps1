###############################################################################
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

.NOTES
This cmdlet supports ShouldProcess, allowing use of -WhatIf and -Confirm parameters
to control execution of state-changing operations.
        ###############################################################################>
function Set-SpotifyRepeatContext {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("repeat")]

    param()

    begin {

        # output information about enabling repeat mode
        Microsoft.PowerShell.Utility\Write-Verbose "Enabling repeat mode for current Spotify context"
    }


process {

        # get the current api token for authentication
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving Spotify API token"
        $token = GenXdev.Console\Get-SpotifyApiToken

        # enable repeat mode for the current context using the spotify helper
        # only if ShouldProcess confirms the action
        if ($PSCmdlet.ShouldProcess("Current Spotify context", "Enable repeat mode")) {

            Microsoft.PowerShell.Utility\Write-Verbose "Setting repeat mode to context"
            [GenXdev.Helpers.Spotify]::RepeatContext($token)
        }
    }

    end {
    }
}
        ###############################################################################