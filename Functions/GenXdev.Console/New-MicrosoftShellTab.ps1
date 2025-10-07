<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : New-MicrosoftShellTab.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
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
    [Alias('x')]

    param(
        ########################################################################
        [Parameter(
            HelpMessage = 'Keep current tab open after creating new tab',
            Mandatory = $false
        )]
        [switch] $DontCloseThisTab
        ########################################################################
    )

    begin {

        $additionalKeystrokes = [System.Collections.Generic.List[string]]::new();

        while ([console]::KeyAvailable) {

            $key = [console]::ReadKey($true);
            $str = $key.KeyChar;
            switch ($key.Key) {
                13 { $str = "{ENTER}}" }
                9 { $str = "{TAB}" }
                8 { $str = "{BACKSPACE}" }
                27 { $str = "{ESC}" }
                32 { $str = "{SPACE}" }
                112..123 { $str = "{F$($key.Key - 111)}" }
                37 { $str = "{LEFT}" }
                38 { $str = "{UP}" }
                39 { $str = "{RIGHT}" }
                40 { $str = "{DOWN}" }
                36 { $str = "{HOME}" }
                35 { $str = "{END}" }
                33 { $str = "{PGUP}" }
                34 { $str = "{PGDN}" }
                46 { $str = "{DEL}" }
                45 { $str = "{INS}" }

                default { }
            }

            switch ($key.Modifiers) {
                1 { $str = "%$str" }
                2 { $str = "+$str" }
                3 { $str = "+%str" }
                4 { $str = "^$str" }
                5 { $str = "%^$str" }
                6 { $str = "+%$str" }
                7 { $str = "^%$str" }
            }
            $null = $additionalKeystrokes.Add($str);
        }

        # activate the powershell window to enable keyboard input processing
        Microsoft.PowerShell.Utility\Write-Verbose 'Bringing PowerShell window to foreground'
        $w = (GenXdev.Windows\Get-PowershellMainWindow);
        if ($w) {
            $null = $w.Focus()
        }

        try {
            # initialize windows script automation object for keyboard simulation
            Microsoft.PowerShell.Utility\Write-Verbose 'Creating WScript.Shell for sending keystrokes'
            $helper = Microsoft.PowerShell.Utility\New-Object -ComObject WScript.Shell

            # check if we should proceed with creating a new tab
            if ($PSCmdlet.ShouldProcess('Windows Terminal', 'Create new tab')) {
                # simulate ctrl+shift+t keystroke to trigger new tab creation
                Microsoft.PowerShell.Utility\Write-Verbose 'Sending Ctrl+Shift+T to create new tab'

                $null = $helper.sendKeys('^+t')
                Microsoft.PowerShell.Utility\Start-Sleep -Milliseconds 2000;

                $additionalKeystrokes | Microsoft.PowerShell.Core\ForEach-Object {

                    $null = $helper.sendKeys($_)
                }

                # handle tab closure if not explicitly prevented
                if ($DontCloseThisTab -ne $true) {

                    Microsoft.PowerShell.Utility\Write-Verbose 'Waiting 3 seconds before closing current tab'
                    Microsoft.PowerShell.Utility\Start-Sleep 3

                    if ($PSCmdlet.ShouldProcess('Current Windows Terminal tab',
                            'Close tab')) {
                        Microsoft.PowerShell.Utility\Write-Verbose 'Exiting current tab'
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