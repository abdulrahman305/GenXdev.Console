<##############################################################################
Part of PowerShell module : GenXdev.Console
Original cmdlet filename  : Get-IsSpeaking.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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