################################################################################
<#
.SYNOPSIS
Sets focus to the VLC media player window.

.DESCRIPTION
Finds the running VLC media player window and brings it to the foreground,
making it the active window.

.EXAMPLE
Set-VLCPlayerFocused

.EXAMPLE
vlcf
#>
function Set-VLCPlayerFocused {

    [CmdletBinding()]
    [Alias("showvlc", "vlcf", "fvlc")]
    param()

    begin {

        Write-Verbose "Starting VLC player focus operation"
    }

    process {

        try {
            # attempt to find the vlc window
            Write-Verbose "Searching for VLC player window"
            $window = Get-Window -ProcessName vlc

            # bring the window to the foreground
            Write-Verbose "Setting VLC player window as foreground window"
            $null = $window.Show()
            $null = $window.SetForeground()
        }
        catch {
            # notify user if vlc is not running
            Write-Warning "VLC player is not running"
        }
    }

    end {
    }
}
################################################################################
