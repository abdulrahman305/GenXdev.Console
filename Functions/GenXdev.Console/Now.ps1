################################################################################
<#
.SYNOPSIS
Returns the current date and time.

.DESCRIPTION
This function returns the current system date and time as a DateTime object
without any parameters.

.EXAMPLE
Now
Returns: Current system date and time

.EXAMPLE
$currentTime = Now
#>
function Now {

    [CmdletBinding()]
    [OutputType([System.DateTime])]
    param()

    begin {
        Write-Verbose "Getting current system date and time"
    }

    process {
        # return the current system date and time
        return [DateTime]::Now
    }

    end {
    }
}
################################################################################
