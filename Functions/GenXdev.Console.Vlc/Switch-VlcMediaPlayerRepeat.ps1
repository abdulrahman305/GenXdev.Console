function Switch-VlcMediaPlayerRepeat {

    [CmdletBinding()]
    [Alias("vlcrepeat")]
    param (
    )

    process {

        GenXdev.Console\Open-VlcMediaPlayer -KeysToSend "r"
    }
}