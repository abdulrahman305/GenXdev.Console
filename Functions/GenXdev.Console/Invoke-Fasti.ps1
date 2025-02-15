################################################################################
<#
.SYNOPSIS
Extracts archive files in the current directory and deletes the originals.

.DESCRIPTION
Automatically extracts common archive formats (zip, 7z, tar, etc.) found in the
current directory into individual folders named after each archive. After
successful extraction, the original archive files are deleted. Requires 7-Zip
to be installed on the system.

.EXAMPLE
PS C:\Downloads> Invoke-Fasti

.EXAMPLE
PS C:\Downloads> fasti

.NOTES
Supported formats: 7z, zip, rar, tar, iso and many others.
Requires 7-Zip installation (will attempt auto-install via winget if missing).
#>
function Invoke-Fasti {

    [CmdletBinding()]
    [Alias("Fasti")]
    param()

    begin {

        # list of supported archive extensions
        $extensions = @("*.7z", "*.xz", "*.bzip2", "*.gzip", "*.tar", "*.zip",
            "*.wim", "*.ar", "*.arj", "*.cab", "*.chm", "*.cpio", "*.cramfs",
            "*.dmg", "*.ext", "*.fat", "*.gpt", "*.hfs", "*.ihex", "*.iso",
            "*.lzh", "*.lzma", "*.mbr", "*.msi", "*.nsis", "*.ntfs", "*.qcow2",
            "*.rar", "*.rpm", "*.squashfs", "*.udf", "*.uefi", "*.vdi", "*.vhd",
            "*.vmdk", "*.wim", "*.xar", "*.z")
    }

    process {

        # process each archive file found in current directory
        Get-ChildItem $extensions -File -ErrorAction SilentlyContinue |
        ForEach-Object {

            Write-Verbose "Processing archive: $($PSItem.Name)"

            # initialize 7zip executable path
            $sevenZip = "7z"

            # get archive details
            $zipFile = $PSItem.fullname
            $name = [system.IO.Path]::GetFileNameWithoutExtension($zipFile)
            $path = [System.IO.Path]::GetDirectoryName($zipFile)
            $extractPath = [system.Io.Path]::Combine($path, $name)

            # create extraction directory if it doesn't exist
            if ([System.IO.Directory]::exists($extractPath) -eq $false) {

                Write-Verbose "Creating directory: $extractPath"
                [System.IO.Directory]::CreateDirectory($extractPath)
            }

            # verify 7zip installation or attempt to install it
            if ((Get-Command $sevenZip -ErrorAction SilentlyContinue).Length -eq 0) {

                $sevenZip = "C:\Program Files\7-Zip\7z.exe"

                if (![IO.File]::Exists($sevenZip)) {

                    if ((Get-Command winget -ErrorAction SilentlyContinue).Length -eq 0) {

                        throw "You need to install 7zip or winget first"
                    }

                    Write-Verbose "Installing 7-Zip via winget..."
                    winget install 7zip

                    if (![IO.File]::Exists($sevenZip)) {

                        throw "You need to install 7-zip"
                    }
                }
            }

            # extract archive contents
            Write-Verbose "Extracting to: $extractPath"
            & $sevenZip x -y "-o$extractPath" $zipFile

            # delete original archive if extraction succeeded
            if ($?) {

                try {
                    Write-Verbose "Removing original archive: $zipFile"
                    Remove-Item "$zipFile" -Force -ErrorAction silentlycontinue
                }
                catch {
                    Write-Verbose "Failed to remove original archive"
                }
            }
        }
    }

    end {
    }
}
################################################################################
