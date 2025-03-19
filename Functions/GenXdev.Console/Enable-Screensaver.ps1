################################################################################
<#
.SYNOPSIS
Starts the configured Windows screensaver.

.DESCRIPTION
Activates the Windows system screensaver by executing the default screensaver
executable (scrnsave.scr) with the /s switch to start it immediately.

.EXAMPLE
Enable-Screensaver

.NOTES
This function requires the Windows screensaver to be properly configured in the
system settings. The screensaver executable must exist at the default Windows
System32 location.
#>
function Enable-Screensaver {

    [CmdletBinding()]
    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose "Starting Windows screensaver activation"
    }

    process {

        # execute the windows screensaver executable with the start switch
        & "$ENV:SystemRoot\system32\scrnsave.scr" /s
    }

    end {
    }
}
################################################################################