
# Skriptausführung erlauben
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

# Nerdfonts installieren
.\installNerdFonts.ps1

# OhMyPosh installieren
.\InstallOhMyPosh.ps1

# beenden
Write-Host "Sie können das Fenster nun schließen..." -ForegroundColor Green
Write-Host "Biite starten Sie das Terminal neu, damit OhMyPosh geladen werden kann..." -ForegroundColor Green
