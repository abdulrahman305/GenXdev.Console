################################################################################
<#
.SYNOPSIS
Sets focus to the VLC media player window.

.DESCRIPTION
Locates a running instance of VLC media player and brings its window to the
foreground, making it the active window. If VLC is not running, silently
continues without error. Uses Windows API calls to manipulate window focus.

.EXAMPLE
Set-VLCPlayerFocused
# Brings the VLC player window to front and gives it focus

.EXAMPLE
vlcf
# Same operation using the short alias
#>
function Set-VLCPlayerFocused {

    [CmdletBinding()]
    [Alias("showvlc", "vlcf", "fvlc")]
    param()

    begin {

        # log operation start for troubleshooting
        Write-Verbose "Starting Set-VLCPlayerFocused operation"
    }

    process {

        try {
            # find vlc window by process name, returns null if not found
            Write-Verbose "Attempting to locate VLC player window"
            $window = Get-Window -ProcessName vlc

            # set window as active and bring to foreground if found
            Write-Verbose "Setting VLC window as foreground window"
            $null = $window.Show()
            $null = $window.SetForeground()
            $null = Set-ForegroundWindow -WindowHandle ($window.Handle)
        }
        catch {
            # silently continue if window not found or other errors occur
            Write-Verbose "Failed to set VLC window focus: $_"
        }
    }

    end {
    }
}
################################################################################
