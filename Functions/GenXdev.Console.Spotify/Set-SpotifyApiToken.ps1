################################################################################
<#
.SYNOPSIS
Caches a Spotify API token for later use in the local configuration.

.DESCRIPTION
This function stores a provided Spotify API token in a local JSON file for
subsequent use by other Spotify-related commands. The token is saved in a
dedicated configuration directory under GenXdev.Local.

.PARAMETER ApiToken
The Spotify API authentication token to be cached locally.

.EXAMPLE
Set-SpotifyApiToken -ApiToken "YOUR-SPOTIFY-API-TOKEN"
#>
function Set-SpotifyApiToken {

    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = "The Spotify API token to cache locally"
        )]
        [string] $ApiToken
        ########################################################################
    )

    begin {

        # define the storage location for the api token
        $dir = "$PSScriptRoot\..\..\..\..\GenXdev.Local"
        $path = GenXdev.FileSystem\Expand-Path "$dir\Spotify_Auth.json"

        Microsoft.PowerShell.Utility\Write-Verbose "Storing Spotify API token in: $path"
    }

    process {

        # ensure the storage directory exists
        if (![IO.Directory]::Exists($dir)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Creating directory: $dir"

            if ($PSCmdlet.ShouldProcess($dir, "Create Directory")) {
                $null = [IO.Directory]::CreateDirectory($dir)
            }
        }

        # save the trimmed api token to the json file
        Microsoft.PowerShell.Utility\Write-Verbose "Writing API token to file"

        if ($PSCmdlet.ShouldProcess($path, "Save Spotify API Token")) {
            [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "))
        }
    }

    end {
    }
}
################################################################################