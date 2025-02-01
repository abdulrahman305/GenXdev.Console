###############################################################################

<#
.SYNOPSIS
Returns a ApiToken for Spotify

.DESCRIPTION
Returns a ApiToken for Spotify
#>
function Get-SpotifyApiToken {

    [CmdletBinding()]

    param()

    $ruleName = "Allow Current PowerShell"
    $programPath = Join-Path -Path $PSHOME -ChildPath "pwsh.exe" # for PowerShell Core
    $remoteAddress = "192.168.1.1"

    # Check if the rule already exists
    $existingRule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue

    if ($null -eq $existingRule) {
        # Rule does not exist, create it
        New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Program $programPath -Action Allow -RemoteAddress $remoteAddress
        Write-Host "Firewall rule '$ruleName' created."
    }


    $path = "$PSScriptRoot\..\..\..\..\GenXdev.Local\Spotify_Auth.json";

    if ([IO.File]::Exists($path)) {

        $ApiToken = [IO.File]::ReadAllText($path);
    }
    else {

        $ApiToken = Connect-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }

    try {

        [GenXdev.Helpers.Spotify]::GetDevices($ApiToken) | Out-Null
    }
    catch {

        $ApiToken = Connect-SpotifyApiToken
        Set-SpotifyApiToken $ApiToken | Out-Null
    }

    $ApiToken
}
