<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Set-SpotifyApiToken.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.292.2025
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