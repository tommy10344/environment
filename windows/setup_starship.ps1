# Install Starship (Execute with updated powershell)
# https://starship.rs

winget install --id DEVCOM.JetBrainsMonoNerdFont
winget install --id Starship.Starship
if (!(Test-Path -Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File -Force
}
echo "Invoke-Expression (&starship init powershell)" >> $PROFILE
