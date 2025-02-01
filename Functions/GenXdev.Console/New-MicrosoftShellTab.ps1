###############################################################################

<#
.SYNOPSIS
Opens a new Windows Terminal tab

.DESCRIPTION
Opens a new Windows Terminal tab and closes current by default

.PARAMETER DontCloseThisTab
Keeps current tab open
#>
function New-MicrosoftShellTab {

    [CmdletBinding()]
    [Alias("x")]

    param(

        [switch] $DontCloseThisTab
    )
    Begin {

        try {
            (Get-PowershellMainWindow).SetForeground();

            $helper = New-Object -ComObject WScript.Shell;
            $helper.sendKeys("^+t");

            if ($DontCloseThisTab -ne $true) {
                Start-Sleep 3
                exit
            }
        }
        catch {

        }
    }
}
