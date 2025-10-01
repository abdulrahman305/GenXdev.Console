<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Connect-SpotifyApiToken.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
Authenticates with Spotify API using OAuth flow to obtain an access token.

.DESCRIPTION
Opens a browser window in application mode to handle the Spotify OAuth
authentication flow. Once authenticated, retrieves and stores the access token for
subsequent API calls. The browser window automatically closes after successful
authentication. Uses port 5642 for the OAuth callback listener.

.EXAMPLE
Authenticate with Spotify and obtain access token
Connect-SpotifyApiToken

.OUTPUTS
System.String
Returns the Spotify authentication token as a string.

.NOTES
Uses port 5642 as the default callback port for OAuth flow
Minimizes browser window during authentication
Automatically closes browser window after successful authentication
#>
function Connect-SpotifyApiToken {

    [CmdletBinding()]
    [OutputType([System.String])]
    param()

    begin {

        # inform user that authentication flow is starting
        Microsoft.PowerShell.Utility\Write-Verbose 'Starting Spotify OAuth authentication flow on port 5642'
    }


    process {

        # construct oauth url using helper class method
        $url = [GenXdev.Helpers.Spotify]::RequestAuthenticationUri(5642)

        # launch minimal browser window for authentication
        [System.Diagnostics.Process] $process = GenXdev.Webbrowser\Open-Webbrowser `
            -PassThru `
            -ApplicationMode `
            -NewWindow `
            -Width 10 `
            -Height 8 `
            -Centered `
            -Monitor 0 `
            -Url $url

        # attempt to minimize the browser window
        try {
            $windowHelper = GenXdev.Windows\Get-Window -ProcessId $process.Id
            $null = $windowHelper.Minimize()
        }
        catch {
            # silently continue if window manipulation fails
        }

        # wait for oauth callback and retrieve token
        Microsoft.PowerShell.Utility\Write-Verbose 'Waiting for OAuth callback on port 5642'
        $authToken = [GenXdev.Helpers.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

        # cleanup: close browser window if still running
        if ((!!$process -and $process -is [System.Diagnostics.Process]) `
                -and (!$process.HasExited)) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Closing authentication browser window'
            $null = $process.CloseMainWindow()
        }

        # return authentication token
        return $authToken
    }

    end {
    }
}