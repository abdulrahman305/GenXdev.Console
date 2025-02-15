################################################################################
<#
.SYNOPSIS
Creates a new Windows Terminal tab running PowerShell.

.DESCRIPTION
Opens a new Windows Terminal tab by simulating the keyboard shortcut Ctrl+Shift+T.
The function brings the PowerShell window to the foreground, sends the keystroke
combination, and optionally closes the current tab after a delay.

.PARAMETER DontCloseThisTab
When specified, prevents the current tab from being closed after creating the new
tab. By default, the current tab will close after 3 seconds.

.EXAMPLE
New-MicrosoftShellTab -DontCloseThisTab
Creates a new terminal tab while keeping the current tab open.

.EXAMPLE
x
Creates a new terminal tab and closes the current one after 3 seconds.
#>
function New-MicrosoftShellTab {

    [CmdletBinding()]
    [Alias("x")]

    param(
        ########################################################################
        [Parameter(
            HelpMessage = "Keep current tab open after creating new tab",
            Mandatory = $false
        )]
        [switch] $DontCloseThisTab
        ########################################################################
    )

    begin {

        # activate the powershell window to enable keyboard input processing
        Write-Verbose "Bringing PowerShell window to foreground"
        $null = (Get-PowershellMainWindow).SetForeground()

        try {
            # initialize windows script automation object for keyboard simulation
            Write-Verbose "Creating WScript.Shell for sending keystrokes"
            $helper = New-Object -ComObject WScript.Shell

            # simulate ctrl+shift+t keystroke to trigger new tab creation
            Write-Verbose "Sending Ctrl+Shift+T to create new tab"
            $helper.sendKeys("^+t")

            # handle tab closure if not explicitly prevented
            if ($DontCloseThisTab -ne $true) {

                Write-Verbose "Waiting 3 seconds before closing current tab"
                Start-Sleep 3

                Write-Verbose "Exiting current tab"
                exit
            }
        }
        catch {
            # suppress any automation-related exceptions
        }
    }

    process {
    }

    end {
    }
}
################################################################################
