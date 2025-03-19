################################################################################
<#
.SYNOPSIS
Returns the current system date and time as a DateTime object.

.DESCRIPTION
Provides a simple way to get the current system date and time without any
parameters. Returns a standard .NET DateTime object that can be used for
datetime calculations, formatting, and comparisons.

.EXAMPLE
Now
Returns the current system date and time as a DateTime object

.EXAMPLE
$timestamp = Now
Stores the current date and time in a variable for later use
#>
function Now {

    [CmdletBinding()]
    [OutputType([System.DateTime])]
    param()

    begin {

        # log function start with verbose output
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Now function to retrieve system date and time"
    }

    process {

        # return the current system datetime using .NET DateTime.Now property
        # this provides high-precision timestamp including date and time
        return [DateTime]::Now
    }

    end {
    }
}
################################################################################