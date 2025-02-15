################################################################################
<#
.SYNOPSIS
Plays media files using VLC player with flexible filtering options.

.DESCRIPTION
This function scans for media files in the specified directory, filters them based
on file type and optional keywords, creates a playlist, and launches VLC player.
It supports videos, audio files and pictures with automatic installation of VLC
if needed.

.PARAMETER DirectoryPath
The directory path to scan for media files. Defaults to current directory.

.PARAMETER Keywords
Keywords to search for in subtitle files (.srt) and media descriptions.

.PARAMETER SearchMask
File pattern to filter media files. Default is "*".

.PARAMETER OnlyVideos
Filter to only include video files in the playlist.

.PARAMETER OnlyAudio
Filter to only include audio files in the playlist.

.PARAMETER OnlyPictures
Filter to only include picture files in the playlist.

.PARAMETER IncludeVideos
Additionally include video files in the playlist.

.PARAMETER IncludeAudio
Additionally include audio files in the playlist.

.PARAMETER IncludePictures
Additionally include picture files in the playlist.

.EXAMPLE
# Play all media in current directory
Invoke-VLCPlayer

.EXAMPLE
# Play only pictures from Pictures folder
vlc ~\Pictures -OnlyPictures

.EXAMPLE
# Play videos containing "birthday" in subtitles
media ~\Videos -Keywords "birthday" -OnlyVideos
#>
function Invoke-VLCPlayer {

    [CmdletBinding()]
    [Alias("vlc", "media")]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Specify the directory path containing media files."
        )]
        [string]$DirectoryPath = ".\*",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Keywords to search in file metadata"
        )]
        [string[]]$Keywords = @(),
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "File pattern to filter media files"
        )]
        [string]$SearchMask = "*",
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include video files in the playlist"
        )]
        [switch]$OnlyVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include audio files in the playlist"
        )]
        [switch]$OnlyAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Only include pictures in the playlist"
        )]
        [switch]$OnlyPictures,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include videos in the playlist"
        )]
        [switch]$IncludeVideos,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include audio files in the playlist"
        )]
        [switch]$IncludeAudio,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Additionally include pictures in the playlist"
        )]
        [switch]$IncludePictures
        ########################################################################
    )

    begin {

        # define supported file extensions for each media type
        $videoFiles = @(".mp4", ".avi", ".mkv", ".mov", ".wmv")
        $audioFiles = @(".mp3", ".flac", ".wav", ".midi", ".mid", ".au",
            ".aiff", ".aac", ".m4a", ".ogg", ".wma", ".ra", ".ram", ".rm",
            ".rmm")
        $pictureFiles = @(".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff",
            ".tif")
    }

    process {

        Write-Verbose "Scanning directory: $DirectoryPath"

        # expand path and build full search pattern
        $searchMask = "$((Expand-Path $DirectoryPath))\$SearchMask"

        # get sorted list of all matching files
        $files = Find-Item -SearchMask $searchMask -PassThru |
        Sort-Object -Property FullName

        # determine which file types to include based on parameters
        $validExtensions = $OnlyVideos ? $videoFiles : (
            $OnlyAudio ? $audioFiles : (
                $OnlyPictures ? $pictureFiles : (
                    $videoFiles + $audioFiles + $pictureFiles
                )
            )
        )

        # add additional file types if specified
        if ($IncludeVideos) {
            $validExtensions += $videoFiles
        }
        if ($IncludeAudio) {
            $validExtensions += $audioFiles
        }
        if ($IncludePictures) {
            $validExtensions += $pictureFiles
        }

        # filter files by extension and keywords
        $files = $files | Where-Object {
            try {
                if (-not ($validExtensions -contains $PSItem.Extension.ToLower())) {
                    return $false;
                }

                if ($Keywords.Length -gt 0) {
                    $srtSearchMask = [io.Path]::Combine([IO.Path]::GetDirectoryName($PSItem.FullName), [IO.Path]::GetFileNameWithoutExtension($PSItem.FullName) + "*.srt");

                    Get-ChildItem $srtSearchMask -File -ErrorAction SilentlyContinue | ForEach-Object {
                        $srt = [IO.File]::ReadAllText($PSItem.FullName);

                        foreach ($keyword in $Keywords) {
                            if ($srt -like "*$keyword*") {
                                return $true;
                            }
                        }
                    }

                    if ([IO.File]::Exists("$($PSItem.FullName):description.json")) {
                        $description = [IO.File]::ReadAllText("$($PSItem.FullName):description.json");

                        foreach ($keyword in $Keywords) {
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

        # create temporary playlist file
        $playlistPath = [System.IO.Path]::ChangeExtension(
            [System.IO.Path]::GetTempFileName(),
            ".m3u"
        )

        Write-Verbose "Creating playlist at: $playlistPath"

        # generate m3u playlist content
        $m3uContent = "#EXTM3U`r`n"
        foreach ($file in $files) {
            $m3uContent += "#EXTINF:-1, $($file.Name.Replace("_", " ").Replace(".", " ").Replace("  ", " "))`r`n$(($file.FullName))`r`n";
        }

        # save playlist file
        $m3uContent | Out-File -FilePath $playlistPath -Encoding utf8 -Force

        # copy path to clipboard
        "$playlistPath" | Set-Clipboard

        # ensure VLC is installed
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

        # launch VLC with playlist
        Write-Verbose "Starting VLC player"
        Get-Process vlc -ErrorAction SilentlyContinue | Stop-Process -Force

        $p = Start-Process `
            -FilePath "C:\Program Files\VideoLAN\VLC\vlc.exe" `
            -ArgumentList @($playlistPath) `
            -PassThru

        try {
            Write-Verbose "Launching VLC player with the playlist file: $playlistPath"

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

    end {
    }
}
################################################################################
