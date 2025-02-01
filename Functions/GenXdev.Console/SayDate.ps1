function SayDate() {

    Start-TextToSpeech ("It is " + [DateTime]::Now.ToString("dddd, MMMM d yyyy"))
}
