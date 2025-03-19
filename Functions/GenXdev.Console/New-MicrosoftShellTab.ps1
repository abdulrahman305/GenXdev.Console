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

.PARAMETER WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

.PARAMETER Confirm
Prompts you for confirmation before running the cmdlet.

.EXAMPLE
New-MicrosoftShellTab -DontCloseThisTab
Creates a new terminal tab while keeping the current tab open.

.EXAMPLE
x
Creates a new terminal tab and closes the current one after 3 seconds.
#>
function New-MicrosoftShellTab {

    [CmdletBinding(SupportsShouldProcess = $true)]
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
        Microsoft.PowerShell.Utility\Write-Verbose "Bringing PowerShell window to foreground"
        $null = (GenXdev.Windows\Get-PowershellMainWindow).SetForeground()

        try {
            # initialize windows script automation object for keyboard simulation
            Microsoft.PowerShell.Utility\Write-Verbose "Creating WScript.Shell for sending keystrokes"
            $helper = Microsoft.PowerShell.Utility\New-Object -ComObject WScript.Shell

            # check if we should proceed with creating a new tab
            if ($PSCmdlet.ShouldProcess("Windows Terminal", "Create new tab")) {
                # simulate ctrl+shift+t keystroke to trigger new tab creation
                Microsoft.PowerShell.Utility\Write-Verbose "Sending Ctrl+Shift+T to create new tab"
                $null = $helper.sendKeys("^+t")

                # handle tab closure if not explicitly prevented
                if ($DontCloseThisTab -ne $true) {

                    Microsoft.PowerShell.Utility\Write-Verbose "Waiting 3 seconds before closing current tab"
                    Microsoft.PowerShell.Utility\Start-Sleep 3

                    if ($PSCmdlet.ShouldProcess("Current Windows Terminal tab",
                            "Close tab")) {
                        Microsoft.PowerShell.Utility\Write-Verbose "Exiting current tab"
                        exit
                    }
                }
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