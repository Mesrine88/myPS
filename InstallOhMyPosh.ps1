# Schritt 1: Installieren der erforderlichen Programme und Module
#winget install JanDeDobbeleer.OhMyPosh -s winget
#winget install Terminal-Icons -s winget
#winget install GH -s winget
#winget install git.git -s winget

# Schritt 2: Ermitteln des Benutzerverzeichnisses
$userProfilePath = [Environment]::GetFolderPath("UserProfile")
$PsProfilePath = [Environment]::GetFolderPath("UserProfile") + "\Documents\WindowsPowerShell\"

if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

# Schritt 3: Kopieren der Microsoft.PowerShell_profile.ps1-Datei und des Modules-Ordners
$sourceProfilePath = Join-Path -Path (Get-Location) -ChildPath "Microsoft.PowerShell_profile.ps1"
$destinationProfilePath = $PROFILE
Copy-Item -Path $sourceProfilePath -Destination $destinationProfilePath -Force

$sourceImagePath = Join-Path -Path (Get-Location) -ChildPath "Desk3.jpg"
$destinationImagePath = Join-Path -Path $PsProfilePath -ChildPath "Desk3.jpg"

Copy-Item -Path $sourceImagePath -Destination $destinationImagePath -Force

$sourceModulesPath = Join-Path -Path (Get-Location) -ChildPath "Modules"
$destinationModulesPath = C:\Windows\System32\WindowsPowerShell\v1.0\Modules
Copy-Item -Path $sourceModulesPath -Destination $PsProfilePath -Recurse -Force
Copy-Item -Path $sourceModulesPath -Destination $destinationModulesPath -Recurse -Force

# Schritt 4: Kopieren der settings.json-Datei
$sourceSettingsPath = Join-Path -Path (Get-Location) -ChildPath "settings.json"
$destinationSettingsPath = Join-Path -Path $userProfilePath -ChildPath "AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Path $sourceSettingsPath -Destination $destinationSettingsPath -Force

# Update settings.json to use the user's profile directory generically
$settingsPath = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$settingsContent = Get-Content -Path $settingsPath -Raw | ConvertFrom-Json

# Update the backgroundImage in profiles.defaults
if ($settingsContent.profiles -and $settingsContent.profiles.defaults) {
    $settingsContent.profiles.defaults.backgroundImage = "$($destinationImagePath)"
}

# Convert the JSON object back to a string and save it
$settingsContent | ConvertTo-Json -Depth 32 | Set-Content -Path $settingsPath

# Schritt 5: Bearbeiten der $PROFILE-Datei
$profilePath = $destinationProfilePath
$profileContent = Get-Content -Path $destinationProfilePath

# Finden der Zeilen, die mit '# oh-my-posh --init --shell pwsh' beginnen
$linesToModify = $profileContent | Select-String -Pattern "^# oh-my-posh --init --shell pwsh"

if ($linesToModify.Count -gt 0) {
    # ZufÃ¤llig eine Zeile auswÃ¤hlen und das vorangehende '# ' entfernen
    $randomLineIndex = Get-Random -Minimum 0 -Maximum $linesToModify.Count
    $lineNumberToModify = $linesToModify[$randomLineIndex].LineNumber - 1
    $profileContent[$lineNumberToModify] = $profileContent[$lineNumberToModify] -replace "^# ", ""

    # Die bearbeitete Datei speichern
    Set-Content -Path $profilePath -Value $profileContent -Force
} else {
    Write-Output "Keine Zeilen gefunden, die mit '# oh-my-posh --init --shell pwsh' beginnen."
}

# Schritt 6: Kopieren der conf.json-Datei für FastFetch
$sourceSettingsPath = Join-Path -Path (Get-Location) -ChildPath "conf.json"
$destinationSettingsPath = $PsProfilePath+"conf.json"
Copy-Item -Path $sourceSettingsPath -Destination $destinationSettingsPath -Force
