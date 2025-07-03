###############################################################################
<#
.SYNOPSIS
Gets the current UTC (Coordinated Universal Time) date and time.

.DESCRIPTION
Returns the current UTC date and time as a System.DateTime object. This function
provides a standardized way to retrieve UTC time across different systems and
time zones. The returned DateTime object can be used for timestamp
synchronization, logging, and cross-timezone operations.

.EXAMPLE
$currentUtc = UtcNow
Returns the current UTC time as a DateTime object.

.EXAMPLE
$timestamp = (UtcNow).ToString("yyyy-MM-dd HH:mm:ss")
Gets the current UTC time and formats it as a string.
        ###############################################################################>
function UtcNow {

    [CmdletBinding()]
    [OutputType([System.DateTime])]
    param()

    begin {

        # log function execution for debugging purposes
        Microsoft.PowerShell.Utility\Write-Verbose "Starting UtcNow function execution"
    }


process {

        # retrieve the current utc time using .net datetime for precision
        Microsoft.PowerShell.Utility\Write-Verbose "Retrieving current UTC datetime"
        [DateTime]::UtcNow
    }

    end {
    }
}
        ###############################################################################