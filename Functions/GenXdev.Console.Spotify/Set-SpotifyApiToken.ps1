<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyApiToken.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################
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
            HelpMessage = 'The Spotify API token to cache locally'
        )]
        [string] $ApiToken
        ########################################################################
    )

    begin {

        # define the storage location for the api token
        $dir = "$($Env:LOCALAPPDATA)\GenXdev.PowerShell"
        $path = GenXdev.FileSystem\Expand-Path "$dir\Spotify_Auth.json"

        Microsoft.PowerShell.Utility\Write-Verbose "Storing Spotify API token in: $path"
    }


    process {

        # ensure the storage directory exists
        if (![IO.Directory]::Exists($dir)) {

            Microsoft.PowerShell.Utility\Write-Verbose "Creating directory: $dir"

            if ($PSCmdlet.ShouldProcess($dir, 'Create Directory')) {
                $null = [IO.Directory]::CreateDirectory($dir)
            }
        }

        # save the trimmed api token to the json file
        Microsoft.PowerShell.Utility\Write-Verbose 'Writing API token to file'

        if ($PSCmdlet.ShouldProcess($path, 'Save Spotify API Token')) {
            [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "))
        }
    }

    end {
    }
}