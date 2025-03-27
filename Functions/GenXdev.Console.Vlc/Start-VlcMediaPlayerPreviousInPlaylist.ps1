function Start-VlcMediaPlayerPreviousInPlaylist {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("vlcprev", "vlcback")]
    param (
    )


process {

        if ($PSCmdlet.ShouldProcess("VLC Media Player", "Go to previous item in playlist")) {

            GenXdev.Console\Open-VlcMediaPlayer -KeysToSend "p"
        }
    }
}