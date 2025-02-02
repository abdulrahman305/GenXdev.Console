#
# Module manifest for module 'GenXdev.Console'
@{

  # Script module or binary module file associated with this manifest.
  RootModule           = 'GenXdev.Console.psm1'

  # Version number of this module.
  ModuleVersion        = '1.102.2025'
  # Supported PSEditions
  # CompatiblePSEditions = @()

  # ID used to uniquely identify this module
  GUID                 = '2f62080f-0483-4421-8497-b3d433b65172'

  # Author of this module
  Author               = 'René Vaessen'

  # Company or vendor of this module
  CompanyName          = 'GenXdev'

  # Copyright statement for this module
  Copyright            = 'Copyright 2021-2025 GenXdev'

  # Description of the functionality provided by this module
  Description          = 'A Windows PowerShell module for enhancing the commandline experience'

  # Minimum version of the PowerShell engine required by this module
  PowerShellVersion    = '7.5.0'

  # # Intended for PowerShell Core
  CompatiblePSEditions = 'Core'

  # # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
  ClrVersion           = '9.0.1'

  # Processor architecture (None, X86, Amd64) required by this module
  # ProcessorArchitecture = ''

  # Modules that must be imported into the global environment prior to importing this module
  RequiredModules      = @(@{ModuleName = 'GenXdev.Data'; ModuleVersion = '1.102.2025' },@{ModuleName = 'GenXdev.Helpers'; ModuleVersion = '1.102.2025' }, @{ModuleName = 'GenXdev.Webbrowser'; ModuleVersion = '1.102.2025' }, @{ModuleName = 'GenXdev.Windows'; ModuleVersion = '1.102.2025' }, @{ModuleName = 'GenXdev.FileSystem'; ModuleVersion = '1.102.2025' });

  # Assemblies that must be loaded prior to importing this module
  RequiredAssemblies   = @()

  # Script files (.ps1) that are run in the caller's environment prior to importing this module.
  # ScriptsToProcess = @()

  # Type files (.ps1xml) to be loaded when importing this module
  # TypesToProcess = @()

  # Format files (.ps1xml) to be loaded when importing this module
  # FormatsToProcess = @()

  # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
  NestedModules        = @("GenXdev.Console.Spotify.psm1")

  # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
  FunctionsToExport    = '*' # @("*")

  # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no Cmdlets to export.
  CmdletsToExport      = '*' # = @("*")

  # Variables to export from this module
  VariablesToExport    = '*'

  # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
  AliasesToExport      = '*'

  # DSC resources to export from this module
  # DscResourcesToExport = @()

  # List of all modules packaged with this module
  ModuleList           = @("GenXdev.Console")

  # List of all files packaged with this module
  FileList             = @(


  ".\\Functions\\GenXdev.Console\\Enable-Screensaver.ps1",
  ".\\Functions\\GenXdev.Console\\Get-GenXDevCmdlets.ps1",
  ".\\Functions\\GenXdev.Console\\Get-IsSpeaking.ps1",
  ".\\Functions\\GenXdev.Console\\Invoke-Fasti.ps1",
  ".\\Functions\\GenXdev.Console\\Invoke-VLCPlayer.ps1",
  ".\\Functions\\GenXdev.Console\\New-MicrosoftShellTab.ps1",
  ".\\Functions\\GenXdev.Console\\Now.ps1",
  ".\\Functions\\GenXdev.Console\\SayDate.ps1",
  ".\\Functions\\GenXdev.Console\\SayTime.ps1",
  ".\\Functions\\GenXdev.Console\\Set-LocationParent.ps1",
  ".\\Functions\\GenXdev.Console\\Set-LocationParent2.ps1",
  ".\\Functions\\GenXdev.Console\\Set-LocationParent3.ps1",
  ".\\Functions\\GenXdev.Console\\Set-LocationParent4.ps1",
  ".\\Functions\\GenXdev.Console\\Set-LocationParent5.ps1",
  ".\\Functions\\GenXdev.Console\\Set-MonitorPowerOff.ps1",
  ".\\Functions\\GenXdev.Console\\Set-MonitorPowerOn.ps1",
  ".\\Functions\\GenXdev.Console\\Set-VLCPlayerFocused.ps1",
  ".\\Functions\\GenXdev.Console\\Show-GenXDevCmdlets.ps1",
  ".\\Functions\\GenXdev.Console\\Show-Verb.ps1",
  ".\\Functions\\GenXdev.Console\\Start-TextToSpeech.ps1",
  ".\\Functions\\GenXdev.Console\\Stop-TextToSpeech.ps1",
  ".\\Functions\\GenXdev.Console\\UtcNow.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Add-SpotifyNewPlaylist.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Add-SpotifyTracksToLiked.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Add-SpotifyTracksToPlaylist.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Connect-SpotifyApiToken.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyActiveDevice.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyApiToken.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyCurrentlyPlaying.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyDevices.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyLikedTracks.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyLyrics.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyPlaylistIdsByName.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyPlaylistTracks.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyTrackAudioFeatures.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyTrackById.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Get-SpotifyUserPlaylists.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Move-SpotifyLikedTracksToPlaylist.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Remove-SpotifyTracksFromLiked.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Remove-SpotifyTracksFromPlaylist.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Search-Spotify.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Search-SpotifyAndEnqueue.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Search-SpotifyAndPlay.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyActiveDevice.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyApiToken.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyNext.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyPause.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyPlaylistDetails.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyPlaylistOrder.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyPrevious.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyRepeatContext.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyRepeatOff.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyRepeatSong.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyShuffleOff.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyShuffleOn.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyStart.ps1",
  ".\\Functions\\GenXdev.Console.Spotify\\Set-SpotifyStop.ps1",
  ".\\GenXdev.Console.psd1",
  ".\\GenXdev.Console.psm1",
  ".\\GenXdev.Console.Spotify.psm1",
  ".\\LICENSE",
  ".\\license.txt",
  ".\\powershell.jpg",
  ".\\README.md"


)

  # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
  PrivateData          = @{

    PSData = @{

      # Tags applied to this module. These help with module discovery in online galleries.
      Tags                     = 'Console', 'Shell', 'GenXdev'

      # A URL to the license for this module.
      LicenseUri               = 'https://raw.githubusercontent.com/genXdev/GenXdev.Console/main/LICENSE'

      # A URL to the main website for this project.
      ProjectUri               = 'https://github.com/genXdev/GenXdev.Console'

      # A URL to an icon representing this module.
      IconUri                  = 'https://genxdev.net/favicon.ico'

      # ReleaseNotes of this module
      # ReleaseNotes = ''

      # Prerelease string of this module
      # Prerelease = ''

      # Flag to indicate whether the module requires explicit user acceptance for install/update/save
      RequireLicenseAcceptance = $true

      # External dependent modules of this module
      # ExternalModuleDependencies = @()

    } # End of PSData hashtable

  } # End of PrivateData hashtable

  # HelpInfo URI of this module
  # HelpInfoUri          = 'https://github.com/genXdev/GenXdev.Console/blob/main/README.md#cmdlet-index'

  # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
  # DefaultCommandPrefix = ''
}

# PrivateData = @{
#     PSData = @{

#       # ...

#       # !! This field is *ancillary* to the more detailed 'RequiredModules' field and
#       # !! must reference the *same modules*, but by *names only*,
#       # !! in order to automatically install other modules
#       # !! *from the same repository* that this module depends on.
#       # !! To be safe, specify even a *single* name as an *array*
#       # !! (While this is not a general requirement in manifests,
#       # !!  it may be necessary here due to a bug.)
#       ExternalModuleDependencies = @('GenXdev.Helpers')
#   }
# }
