function Switch-VlcMediaPlayerPaused {

    [CmdletBinding()]
    [Alias("vlcpause", "vlcplay")]
    param (
    )


process {

        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend " "
    }
}