<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Get-SpotifyApiToken.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.280.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Retrieves or generates a valid Spotify API authentication token.

.DESCRIPTION
This function manages Spotify API authentication by either retrieving a cached
token or obtaining a new one. It also ensures proper firewall access and
validates the token's functionality.

.EXAMPLE
$token = Get-SpotifyApiToken
#>
function Get-SpotifyApiToken {

    [CmdletBinding()]
    param()

    begin {

        # define firewall rule settings
        $ruleName = 'Allow Current PowerShell'
        $programPath = Microsoft.PowerShell.Management\Join-Path -Path $PSHOME -ChildPath 'pwsh.exe'
        $remoteAddress = '192.168.1.1'

        Microsoft.PowerShell.Utility\Write-Verbose "Checking firewall rule: $ruleName"
    }


    process {

        # verify if firewall rule exists
        $existingRule = NetSecurity\Get-NetFirewallRule `
            -DisplayName $ruleName `
            -ErrorAction SilentlyContinue

        # create firewall rule if it doesn't exist
        if ($null -eq $existingRule) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Creating new firewall rule'
            NetSecurity\New-NetFirewallRule `
                -DisplayName $ruleName `
                -Direction Inbound `
                -Program $programPath `
                -Action Allow `
                -RemoteAddress $remoteAddress

            Microsoft.PowerShell.Utility\Write-Host "Firewall rule '$ruleName' created."
        }

        # path to cached authentication token
        $path = "$($Env:LOCALAPPDATA)\GenXdev.PowerShell\Spotify_Auth.json"

        # attempt to load existing token
        if ([IO.File]::Exists($path)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Loading existing token from $path"
            $apiToken = [IO.File]::ReadAllText($path)
        }
        else {

            Microsoft.PowerShell.Utility\Write-Verbose 'No existing token found, connecting to Spotify'
            $apiToken = GenXdev.Console\Connect-SpotifyApiToken
            $null = GenXdev.Console\Set-SpotifyApiToken $apiToken
        }

        # validate token by attempting to list devices
        try {

            Microsoft.PowerShell.Utility\Write-Verbose 'Validating token by retrieving devices'
            $null = [GenXdev.Helpers.Spotify]::GetDevices($apiToken)
        }
        catch {

            Microsoft.PowerShell.Utility\Write-Verbose 'Token validation failed, obtaining new token'
            $apiToken = GenXdev.Console\Connect-SpotifyApiToken
            $null = GenXdev.Console\Set-SpotifyApiToken $apiToken
        }

        # return the valid token
        $apiToken
    }

    end {
    }
}