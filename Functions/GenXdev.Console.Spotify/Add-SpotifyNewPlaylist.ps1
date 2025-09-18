<##############################################################################
Part of PowerShell module : GenXdev.Console.Spotify
Original cmdlet filename  : Add-SpotifyNewPlaylist.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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
##############################################################################

<#
.SYNOPSIS
Creates a new Spotify playlist with customizable settings.

.DESCRIPTION
Creates a new Spotify playlist with the specified name, description, and privacy
settings. The function authenticates with Spotify, creates the playlist, and
updates the local playlist cache.

.PARAMETER Name
The name for the new playlist. This will be visible to users who can access the
playlist.

.PARAMETER Description
An optional description for the playlist that provides additional context about
its contents or purpose.

.PARAMETER Public
When specified, makes the playlist publicly visible to other Spotify users.

.PARAMETER Collabrative
When specified, allows other users to modify the playlist contents.

.EXAMPLE
Add-SpotifyNewPlaylist -Name "My Awesome Mix" -Description "Best songs of 2023" -Public

.EXAMPLE
newplaylist "Road Trip Songs" -Collabrative
#>
function Add-SpotifyNewPlaylist {

    [CmdletBinding()]
    [OutputType([SpotifyAPI.Web.FullPlaylist])]
    [Alias('newplaylist')]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            HelpMessage = 'The name for the new playlist'
        )]
        [string] $Name,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The description for the new playlist'
        )]
        [string] $Description = '',
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Make this a public playlist'
        )]
        [switch] $Public,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Allow others to make changes'
        )]
        [switch] $Collabrative
        ########################################################################
    )

    begin {

        # retrieve spotify api authentication token
        Microsoft.PowerShell.Utility\Write-Verbose 'Retrieving Spotify API authentication token'
        $apiToken = GenXdev.Console\Get-SpotifyApiToken
    }


    process {

        # create new playlist using spotify api helper
        Microsoft.PowerShell.Utility\Write-Verbose "Creating new Spotify playlist '$Name'"
        $result = [GenXdev.Helpers.Spotify]::NewPlaylist(
            $apiToken,
            $Name,
            $Description,
            ($Public -eq $true),
            ($Collabrative -eq $true))

        # update local playlist cache if it exists
        if ($Script:SpotifyPlaylistCache -is [System.Collections.Generic.List[object]]) {

            Microsoft.PowerShell.Utility\Write-Verbose 'Updating local playlist cache'
            $null = $Script:SpotifyPlaylistCache.Insert(0, $result)

            # save updated cache to json file
            $filePath = GenXdev.FileSystem\Expand-Path "$($Env:LOCALAPPDATA)\GenXdev.PowerShell\Spotify.Playlists.json"
            $Script:SpotifyPlaylistCache |
                Microsoft.PowerShell.Utility\ConvertTo-Json -Depth 100 |
                Microsoft.PowerShell.Utility\Out-File $filePath -Force
        }

        # return the newly created playlist
        $result
    }

    end {
    }
}