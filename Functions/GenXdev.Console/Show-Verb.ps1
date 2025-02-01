###############################################################################

<#
.SYNOPSIS
Shows a short alphabetical list of all PowerShell verbs

.DESCRIPTION
Shows a short alphabetical list of all PowerShell verbs webbrowser
#>
function Show-Verb {

    [CmdletBinding()]
    [Alias("showverbs")]
    param(

        [parameter(
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Mandatory = $False
        )] [string[]] $Verb = @()
    )

    process {

        if ($Verb.Length -eq 0) {

            $verbs = Get-Verb
        }
        else {
            $verbs = Get-Verb | ForEach-Object -ErrorAction SilentlyContinue {

                $existingVerb = $PSItem;

                foreach ($verb in $Verb) {

                    if ($existingVerb.Verb -like $verb) {

                        $existingVerb
                    }
                }
            }
        }

        ($verbs | Sort-Object { $PSItem.Verb } | ForEach-Object Verb -ErrorAction SilentlyContinue) -Join ", "
    }
}
