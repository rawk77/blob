### Powershell Setup Scripts for new PC
# Run as Administrator

# Install Scoop
iwr -useb get.scoop.sh | iex

# Install Tools from scoop
Write-Host "Installing Tools from scoop"
scoop install neovim sudo neofetch

# Check if WinGet is installed and install if missing
if (Get-AppPackage Microsoft.DesktopAppInstaller) {
  Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
  $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $releases = Invoke-RestMethod -uri $releases_url
  $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

  "Installing winget from $($latestRelease.browser_download_url)"
  Add-AppxPackage -Path $latestRelease.browser_download_url
}

# Add Powershell Profile
iwr -UseBasicParsing -uri https://github.com/rawk77/blob/Microsoft.PowerShell_profile.ps1 -OutFile $PROFILE

# WinGet Installs
winget install -e --id Git.Git
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Notepad++.Notepad++
