function Set-SpotifyActiveDevice {

    [CmdletBinding()]


    param(
        [Alias("Id")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromPipeline = $false,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The Spotify deviceId to transfer playback to"
        )]
        [string] $DeviceId
    )


    begin {

        $apiToken = Get-SpotifyApiToken;
    }

    process {

        [GenXdev.Helpers.Spotify]::SetActiveDevice($apiToken, $DeviceId);
    }

    end {

    }
}
