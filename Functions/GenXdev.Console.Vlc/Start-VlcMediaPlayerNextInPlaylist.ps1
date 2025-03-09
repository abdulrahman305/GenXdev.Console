function Start-VlcMediaPlayerNextInPlaylist {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias("vlcnext")]
    param (
    )

    process {

        if ($PSCmdlet.ShouldProcess("VLC Media Player", "Next in playlist")) {

            GenXdev.Console\Open-VlcMediaPlayer -KeysToSend "n"
        }
    }
}