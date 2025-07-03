###############################################################################
<#
.SYNOPSIS
Sets focus to the VLC media player window.

.DESCRIPTION
Locates a running instance of VLC media player and brings its window to the
foreground, making it the active window. If VLC is not running, silently
continues without error. Uses Windows API calls to manipulate window focus.

.EXAMPLE
Set-VLCPlayerFocused
        ###############################################################################Brings the VLC player window to front and gives it focus

.EXAMPLE
vlcf
        ###############################################################################Same operation using the short alias
        ###############################################################################>
function Set-VLCPlayerFocused {

    [CmdletBinding(SupportsShouldProcess = $true)]
    [Alias("showvlc", "vlcf", "fvlc")]
    param()

    begin {

        # log operation start for troubleshooting
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Set-VLCPlayerFocused operation"
    }


process {

        try {
            # find vlc window by process name, returns null if not found
            Microsoft.PowerShell.Utility\Write-Verbose "Attempting to locate VLC player window"
            $window = GenXdev.Windows\Get-Window -ProcessName vlc

            # only proceed if window was found and ShouldProcess confirms
            if ($window -and $PSCmdlet.ShouldProcess("VLC media player window",
                    "Set as foreground window")) {

                Microsoft.PowerShell.Utility\Write-Verbose "Setting VLC window as foreground window"
                $null = $window.Show()
                $null = $window.SetForeground()
                $null = GenXdev.Windows\Set-ForegroundWindow -WindowHandle ($window.Handle)
            }
        }
        catch {
            # silently continue if window not found or other errors occur
            Microsoft.PowerShell.Utility\Write-Verbose "Failed to set VLC window focus: $_"
        }
    }

    end {
    }
}
        ###############################################################################