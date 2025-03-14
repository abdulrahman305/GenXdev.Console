################################################################################
<#
.SYNOPSIS
Authenticates with Spotify API using OAuth flow to obtain an access token.

.DESCRIPTION
Opens a browser window in application mode to handle the Spotify OAuth
authentication flow. Once authenticated, retrieves and stores the access token for
subsequent API calls. The browser window automatically closes after successful
authentication. Uses port 5642 for the OAuth callback listener.

.EXAMPLE
# Authenticate with Spotify and obtain access token
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
        Write-Verbose "Starting Spotify OAuth authentication flow on port 5642"
    }

    process {

        # construct oauth url using helper class method
        $url = [GenXdev.Helpers.Spotify]::RequestAuthenticationUri(5642)

        # launch minimal browser window for authentication
        [System.Diagnostics.Process] $process = Open-Webbrowser `
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
            $windowHelper = Get-Window -ProcessId $process.Id
            $null = $windowHelper.Minimize()
        }
        catch {
            # silently continue if window manipulation fails
        }

        # wait for oauth callback and retrieve token
        Write-Verbose "Waiting for OAuth callback on port 5642"
        $authToken = [GenXdev.Helpers.Spotify]::RequestAuthenticationTokenUsingOAuth(5642)

        # cleanup: close browser window if still running
        if ((!!$process -and $process -is [System.Diagnostics.Process]) `
                -and (!$process.HasExited)) {

            Write-Verbose "Closing authentication browser window"
            $null = $process.CloseMainWindow()
        }

        # return authentication token
        return $authToken
    }

    end {
    }
}
################################################################################