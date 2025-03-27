function Switch-VlcMediaPlayerMute {

    [CmdletBinding()]
    [Alias("vlcmute", "vlcunmute")]
    param (
    )


process {

        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend "m"
    }
}