# Make $PROFILE load windows/profile.ps1 from this repository.
#
# Usage:
#   .\windows\link.ps1
#
# Run it in the PowerShell you actually use. $PROFILE is per edition and per
# host: Windows PowerShell 5.1 and PowerShell 7 have different files, and so do
# the VS Code PowerShell extension console and ISE.
#
# $PROFILE gets a single line that dot-sources profile.ps1, so editing
# profile.ps1 and pulling is enough afterwards. No symlink is created, so
# neither administrator rights nor Developer Mode is needed.
# Safe to run more than once. Re-run it if the repository is moved; the line
# written by a previous run is replaced.
#
# This file is kept ASCII-only on purpose: Windows PowerShell 5.1 reads a
# script without BOM in the ANSI code page.

$ErrorActionPreference = 'Stop'

$repoProfile = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot 'profile.ps1'))
if (!(Test-Path -LiteralPath $repoProfile)) {
    throw "Not found: $repoProfile"
}

# Lines written by this script end with this marker.
$marker = '# added by environment/windows/link.ps1'

# The line setup_starship.ps1 used to append to $PROFILE. profile.ps1 has the
# same line, so leaving it would initialize starship twice.
$legacyLine = 'Invoke-Expression (&starship init powershell)'

$quoted = $repoProfile.Replace("'", "''")
$loadLine = "if (Test-Path -LiteralPath '$quoted') { . '$quoted' }  $marker"

$lines = @()
if (Test-Path -LiteralPath $PROFILE) {
    # Without a BOM, Get-Content guesses the encoding (ANSI on 5.1, UTF-8 on 7).
    # A wrong guess would be written back for good, so refuse instead. NUL bytes
    # mean UTF-16 text was appended to a file in another encoding.
    $bytes = [System.IO.File]::ReadAllBytes($PROFILE)
    $hasBom = $bytes.Length -ge 2 -and (
        ($bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB) -or
        ($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) -or
        ($bytes[0] -eq 0xFE -and $bytes[1] -eq 0xFF))
    if (!$hasBom -and @($bytes | Where-Object { $_ -eq 0 -or $_ -ge 0x80 }).Count -gt 0) {
        throw "Existing profile has no BOM but contains non-ASCII or NUL bytes. Save it as UTF-8 with BOM, then run again: $PROFILE"
    }
    $lines = @(Get-Content -LiteralPath $PROFILE)
}

$kept = @($lines | Where-Object {
    $_.Trim() -ne $legacyLine -and $_.IndexOf($marker, [System.StringComparison]::Ordinal) -lt 0
})
$new = @($kept) + $loadLine

if (($lines -join "`n") -ceq ($new -join "`n")) {
    Write-Host "Already linked: $PROFILE"
    return
}

[System.IO.Directory]::CreateDirectory((Split-Path -Parent $PROFILE)) | Out-Null
if ((Test-Path -LiteralPath $PROFILE) -and !(Test-Path -LiteralPath "$PROFILE.bak")) {
    Copy-Item -LiteralPath $PROFILE -Destination "$PROFILE.bak"
    Write-Host "Backup: $PROFILE.bak"
}
Set-Content -LiteralPath $PROFILE -Value $new -Encoding UTF8

Write-Host "Linked: $PROFILE -> $repoProfile"
