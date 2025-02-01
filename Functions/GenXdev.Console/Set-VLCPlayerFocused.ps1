################################################################################

function Set-VLCPlayerFocused {

    [CmdletBinding()]
    [alias("showvlc", "vlcf", "fvlc")]
    param()

    try {
        Write-Verbose "Focussing VLC player"
        $w = Get-Window -ProcessName vlc
        $w.SetForeground();
    }
    catch {

        Write-Warning "VLC player is not running"
    }
}
