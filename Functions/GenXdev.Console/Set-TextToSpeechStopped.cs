// ################################################################################
// Part of PowerShell module : GenXdev.Console
// Original cmdlet filename  : Set-TextToSpeechStopped.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 1.302.2025
// ################################################################################
// Copyright (c)  René Vaessen / GenXdev
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ################################################################################



/*
<#
.SYNOPSIS
Immediately stops any ongoing text-to-speech output.

.DESCRIPTION
Halts all active and queued speech synthesis by canceling both standard and
customized speech operations. This provides an immediate silence for any ongoing
text-to-speech activities.

.EXAMPLE
PS C:\> Set-TextToSpeechStopped
Immediately stops any ongoing speech

.EXAMPLE
PS C:\> say "Hello world"; sst
Starts speaking but gets interrupted immediately

.NOTES
This cmdlet is commonly used in conjunction with Start-TextToSpeech (alias: say)
and Skip-TextToSpeech (alias: sstSkip) for speech control.
#>
*/
using System;
using System.Management.Automation;
using GenXdev.Helpers;

namespace GenXdev.Console
{
    /// <summary>
    /// <para type="synopsis">
    /// Immediately stops any ongoing text-to-speech output.
    /// </para>
    ///
    /// <para type="description">
    /// Halts all active and queued speech synthesis by canceling both standard and
    /// customized speech operations. This provides an immediate silence for any ongoing
    /// text-to-speech activities.
    /// </para>
    ///
    /// <example>
    /// <para>Example description</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Set-TextToSpeechStopped
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Example description</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// say "Hello world"; sst
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Set, "TextToSpeechStopped")]
    [Alias("sst", "Set-TextToSpeechStopped")]
    [OutputType(typeof(void))]
    public class StopTextToSpeechCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - write verbose message about initiating speech cancellation
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Initiating speech cancellation request");
        }

        /// <summary>
        /// Process record - cancel all speech operations if confirmed
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                // Check if the operation should proceed
                if (ShouldProcess("Text-to-speech output", "Stop"))
                {
                    // Cancel all pending standard speech operations
                    GenXdev.Helpers.Misc.Speech.SpeakAsyncCancelAll();

                    // Cancel all pending customized speech operations
                    GenXdev.Helpers.Misc.SpeechCustomized.SpeakAsyncCancelAll();

                    WriteVerbose("Successfully cancelled all speech operations");
                }
            }
            catch
            {
                // Silently handle any speech cancellation errors to match original behavior
                WriteVerbose("Error occurred while attempting to cancel speech");
            }
        }

        /// <summary>
        /// End processing - empty implementation matching original PowerShell function
        /// </summary>
        protected override void EndProcessing()
        {
            // Empty implementation
        }
    }
}