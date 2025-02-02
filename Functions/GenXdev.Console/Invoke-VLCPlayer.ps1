################################################################################
<#
.SYNOPSIS
Selects media files and plays them in VLC player

.DESCRIPTION
Selects media files and plays them in VLC player

.PARAMETER DirectoryPath
Specify the directory path containing media files.
Default is the current directory.

.PARAMETER OnlyVideos
Only include video files in the playlist.

.PARAMETER OnlyAudio
Only include audio files in the playlist.

.PARAMETER OnlyPictures
Only include pictures in the playlist.

.PARAMETER IncludeVideos
Also include videos in the playlist.

.PARAMETER IncludeAudio
Also include audio files in the playlist.

.PARAMETER IncludePictures
Also include pictures in the playlist.

.EXAMPLE
PS C:\users\MyName\Videos> media

.EXAMPLE
PS C:\> media ~\Pictures -OnlyPictures

.EXAMPLE
PS C:\> media ~\
#>
function Invoke-VLCPlayer {

    [CmdletBinding()]
    [alias("vlc", "media")]

    param(

        [Parameter(Mandatory = $false, Position = 0, HelpMessage = "Specify the directory path containing media files.")]
        [string]$DirectoryPath = ".\*",

        [Parameter(Mandatory = $false, Position = 1, HelpMessage = "Specify the keywords to search for in the file meta data")]
        [string[]]$keywords = @(),

        [Parameter(Mandatory = $false, Position = 2, HelpMessage = "Specify the search mask for files.")]
        [string]$SearchMask = "*",

        [Parameter(Mandatory = $false, HelpMessage = "Only include video files in the playlist.")]
        [switch]$OnlyVideos,

        [Parameter(Mandatory = $false, HelpMessage = "Only include audio files in the playlist.")]
        [switch]$OnlyAudio,

        [Parameter(Mandatory = $false, HelpMessage = "Only include pictures in the playlist.")]
        [switch]$OnlyPictures,

        [Parameter(Mandatory = $false, HelpMessage = "Also include videos in the playlist.")]
        [switch]$IncludeVideos,

        [Parameter(Mandatory = $false, HelpMessage = "Also include audio files in the playlist.")]
        [switch]$IncludeAudio,

        [Parameter(Mandatory = $false, HelpMessage = "Also include pictures in the playlist.")]
        [switch]$IncludePictures
    )

    # Get the list of files in the directory and subdirectories
    $SearchMask = "$((Expand-Path $DirectoryPath))\$SearchMask"
    $files = Find-Item -SearchMask $SearchMask -PassThru | Sort-Object -Property FullName

    # Filter files to only include those with extensions that VLC player can play
    $videoFiles = @(".mp4", ".avi", ".mkv", ".mov", ".wmv");
    $audioFiles = @(".mp3", ".flac", ".wav", ".midi", ".mid", ".au", ".aiff", ".aac", ".m4a", ".ogg", ".wma", ".ra", ".ram", ".rm", ".rmm");
    $pictureFiles = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff", ".tif");

    $validExtensions = $OnlyVideos ? $videoFiles : ($OnlyAudio ? $audioFiles : ($OnlyPictures ? $pictureFiles : ($videoFiles + $audioFiles + $pictureFiles)) );

    if ($IncludeVideos) {

        $validExtensions += $videoFiles
    }
    if ($IncludeAudio) {

        $validExtensions += $audioFiles
    }
    if ($IncludePictures) {

        $validExtensions += $pictureFiles
    }

    $files = $files | Where-Object {

        try {
            if (-not ($validExtensions -contains $PSItem.Extension.ToLower())) {

                return $false;
            }

            if ($keywords.Length -gt 0) {

                $srtSearchMask = [io.Path]::Combine([IO.Path]::GetDirectoryName($PSItem.FullName), [IO.Path]::GetFileNameWithoutExtension($PSItem.FullName) + "*.srt");

                Get-ChildItem $srtSearchMask -File -ErrorAction SilentlyContinue | ForEach-Object {

                    $srt = [IO.File]::ReadAllText($PSItem.FullName);

                    foreach ($keyword in $keywords) {

                        if ($srt -like "*$keyword*") {

                            return $true;
                        }
                    }
                }

                if ([IO.File]::Exists("$($PSItem.FullName):description.json")) {

                    $description = [IO.File]::ReadAllText("$($PSItem.FullName):description.json");

                    foreach ($keyword in $keywords) {

                        if ($description -like "*$keyword*") {

                            return $true;
                        }
                    }
                }

                return $false;
            }

            return $true;
        }
        catch {

            return $false;
        }
    }

    if ($files.Length -eq 0) {

        Write-Host "No media files found in the specified directory."
        return
    }

    [string]$PlaylistPath = [System.IO.Path]::ChangeExtension([System.IO.Path]::GetTempFileName(), ".m3u")

    # Generate the .xspf formatted XML content
    $m3uContent = "#EXTM3U`r`n";

    foreach ($file in $files) {

        $m3uContent += "#EXTINF:-1, $($file.Name.Replace("_", " ").Replace(".", " ").Replace("  ", " "))`r`n$(($file.FullName))`r`n";
    }

    # Save the playlist to the specified file
    $m3uContent | Out-File -FilePath $PlaylistPath -Encoding utf8 -Force

    "$PlaylistPath" | Set-Clipboard

    # check if VLC player is installed
    if (-not (Test-Path "C:\Program Files\VideoLAN\VLC\vlc.exe")) {

        # check if powershell module 'Microsoft.WinGet.Client' is installed
        if (-not (Get-Module -ListAvailable -Name 'Microsoft.WinGet.Client')) {

            # install module 'Microsoft.WinGet.Client'
            Install-Module -Name 'Microsoft.WinGet.Client' -Force -Scope CurrentUser -AllowClobber -SkipPublisherCheck 

            # import module
            Import-Module -Name 'Microsoft.WinGet.Client'
        }

        # install VLC player using 'Microsoft.WinGet.Client'
        Install-WinGetPackage -Name 'VideoLAN.VLC' -Scope System -Force
    }

    # Start VLC player with the playlist file
    Get-Process vlc -ErrorAction SilentlyContinue | Stop-Process -Force
    $p = Start-Process -FilePath "C:\Program Files\VideoLAN\VLC\vlc.exe" -ArgumentList @($PlaylistPath) -PassThru

    try {
        Write-Verbose "Launching VLC player with the playlist file: $PlaylistPath"

        [System.Threading.Thread]::Sleep(4000) | Out-Null

        Set-VLCPlayerFocused

        # Set fullscreen
        if ($p -and $p.MainWindowHandle -ge 0) {

            [System.Threading.Thread]::Sleep(1000) | Out-Null

            if (($Global:DefaultSecondaryMonitor -gt 0) -and ((Get-MonitorCount) -gt 1)) {

                Set-WindowPosition -Process $p -Fullscreen -Monitor -2
            }
            else {

                Set-WindowPosition -Process $p -Right
                Set-WindowPosition -Process (Get-PowershellMainWindowProcess) -Left
            }
        }
    }
    finally {
        Set-VLCPlayerFocused

        # send F11
        $helper = New-Object -ComObject WScript.Shell;
        $helper.sendKeys("F");

        Write-Verbose "Sending F"

        [System.Threading.Thread]::Sleep(1000) | Out-Null

    (Get-PowershellMainWindow).SetForeground();
    }
}
