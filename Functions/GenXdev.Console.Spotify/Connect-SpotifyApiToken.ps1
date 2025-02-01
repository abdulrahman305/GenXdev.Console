###############################################################################

<#
.SYNOPSIS
Uses Spotify Open-Auth to request an access token

.DESCRIPTION
Uses Spotify Open-Auth to request an access token

#>
function Connect-SpotifyApiToken {

    [CmdletBinding()]

    param()

    $url = [GenXdev.Helpers.Spotify]::RequestAuthenticationUri(5642);

    [System.Diagnostics.Process] $process = Open-Webbrowser -PassThru -ApplicationMode -NewWindow -Width 1000 -Height 800 -Centered -Monitor 0 -Url $url

    [GenXdev.Helpers.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

    if ((!!$process -and $process -is [System.Diagnostics.Process]) -and (!$process.HasExited)) {

        $process.CloseMainWindow() | Out-Null
    }
}
