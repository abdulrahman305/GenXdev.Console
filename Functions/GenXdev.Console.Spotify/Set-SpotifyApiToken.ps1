###############################################################################

<#
.SYNOPSIS
Caches an Spotify API-token for later use

.DESCRIPTION
Caches an Spotify API-token for later use

.PARAMETER ApiToken
The API-token to cache
#>
function Set-SpotifyApiToken {

    [CmdletBinding()]

    param(

        [parameter(
            Mandatory,
            Position = 0
        )] [string] $ApiToken
    )

    $dir = "$PSScriptRoot\..\..\..\GenXdev.Local";
    $path = "$dir\Spotify_Auth.json";

    if (![IO.Directory]::Exists($dir)) {

        [IO.Directory]::CreateDirectory($dir);
    }

    [IO.File]::WriteAllText($path, $ApiToken.Trim("`r`n`t "));
}
