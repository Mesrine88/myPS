# Schritt 1: Installieren der erforderlichen Programme und Module
winget install JanDeDobbeleer.OhMyPosh -s winget
winget install Terminal-Icons -s winget
winget install GH -s winget
winget install git.git -s winget

# Schritt 2: Ermitteln des Benutzerverzeichnisses
$userProfilePath = [Environment]::GetFolderPath("UserProfile")

# Schritt 3: Kopieren der Microsoft.PowerShell_profile.ps1-Datei und des Modules-Ordners
$sourceProfilePath = Join-Path -Path (Get-Location) -ChildPath "Microsoft.PowerShell_profile.ps1"
$destinationProfilePath = Join-Path -Path $userProfilePath -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
Copy-Item -Path $sourceProfilePath -Destination $destinationProfilePath -Force

$sourceModulesPath = Join-Path -Path (Get-Location) -ChildPath "Modules"
$destinationModulesPath = Join-Path -Path $userProfilePath -ChildPath "Documents\PowerShell\Modules"
Copy-Item -Path $sourceModulesPath -Destination $destinationModulesPath -Recurse -Force

# Schritt 4: Kopieren der settings.json-Datei
$sourceSettingsPath = Join-Path -Path (Get-Location) -ChildPath "settings.json"
$destinationSettingsPath = Join-Path -Path $userProfilePath -ChildPath "AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Path $sourceSettingsPath -Destination $destinationSettingsPath -Force

# Schritt 5: Bearbeiten der $PROFILE-Datei
$profilePath = if (!(Test-Path -Path $PROFILE)) { New-Item -ItemType File -Path $PROFILE -Force } $PROFILE
$profileContent = Get-Content -Path $profilePath

# Finden der Zeilen, die mit '# oh-my-posh --init --shell pwsh' beginnen
$linesToModify = $profileContent | Select-String -Pattern "^# oh-my-posh --init --shell pwsh"

if ($linesToModify.Count -gt 0) {
    # Zufällig eine Zeile auswählen und das vorangehende '# ' entfernen
    $randomLineIndex = Get-Random -Minimum 0 -Maximum $linesToModify.Count
    $lineNumberToModify = $linesToModify[$randomLineIndex].LineNumber - 1
    $profileContent[$lineNumberToModify] = $profileContent[$lineNumberToModify] -replace "^# ", ""

    # Die bearbeitete Datei speichern
    Set-Content -Path $profilePath -Value $profileContent -Force
} else {
    Write-Output "Keine Zeilen gefunden, die mit '# oh-my-posh --init --shell pwsh' beginnen."
}
