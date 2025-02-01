###############################################################################

function SayTime() {

    $d = Get-Date
    $h = $d.Hour
    $m = $d.Minute
    Start-TextToSpeech ("The time is " + $h.ToString("0") + " hours and " + $m.ToString("0") + " minutes")
}
