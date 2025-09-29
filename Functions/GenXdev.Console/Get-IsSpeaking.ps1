<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Get-IsSpeaking.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.288.2025
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
Returns true if the text-to-speech engine is speaking.

.DESCRIPTION
Checks the state of both the default and customized speech synthesizers to
determine if either is currently speaking. Returns true if speech is in progress,
false otherwise.

.EXAMPLE
Get-IsSpeaking

.EXAMPLE
iss
#>
function Get-IsSpeaking {

    [CmdletBinding()]
    [Alias('iss')]
    [OutputType([System.Boolean])]

    param()

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Checking speech synthesizer states...'
    }


    process {

        try {
            # check both default and customized speech synthesizer states
            return (
                ([GenXdev.Helpers.Misc]::Speech.State -eq 'Speaking') -or
                ([GenXdev.Helpers.Misc]::SpeechCustomized.State -eq 'Speaking')
            )
        }
        catch {
            # return false if unable to check speech state
            Microsoft.PowerShell.Utility\Write-Verbose "Failed to check speech state: $_"
            return $false
        }
    }

    end {
    }
}