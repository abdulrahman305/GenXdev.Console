###############################################################################

function Now() {

    [CmdletBinding()]
    [OutputType("System.DateTime")]

    param()

    return [DateTime]::Now
}
