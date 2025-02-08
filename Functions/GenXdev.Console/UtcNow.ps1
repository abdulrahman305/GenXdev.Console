################################################################################
<#
.SYNOPSIS
Gets the current UTC (Coordinated Universal Time) date and time.

.DESCRIPTION
Returns the current UTC date and time as a System.DateTime object. This function
provides a consistent way to get UTC time across different systems.

.EXAMPLE
UtcNow
Returns the current UTC date and time.
#>
function UtcNow {

    [CmdletBinding()]
    [OutputType([System.DateTime])]

    param()

    begin {
        Write-Verbose "Getting current UTC date and time"
    }

    process {
        # return the current utc time using .net datetime
        [DateTime]::UtcNow
    }

    end {
    }
}
################################################################################
