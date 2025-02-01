###############################################################################

function UtcNow() {

    [CmdletBinding()]
    [OutputType("System.DateTime")]

    param()

    return [DateTime]::UtcNow
}
