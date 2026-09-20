# Install Starship (Execute with updated powershell)
# https://starship.rs

winget install --id DEVCOM.JetBrainsMonoNerdFont
winget install --id Starship.Starship

# "starship init" lives in profile.ps1; make $PROFILE load it.
& (Join-Path $PSScriptRoot 'link.ps1')
