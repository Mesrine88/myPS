# Style default PowerShell Console
$shell = $Host.UI.RawUI
$shell.WindowTitle= "PS"

## Load custom theme for Windows Terminal
Import-Module -Name Terminal-Icons
Import-Module posh-git
#Import-Module oh-my-posh

# Originale
#  oh-my-posh init shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

# Custom
# oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/ohmyposh3Vid.json | Invoke-Expression

# Favoriten
# oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/mt.omp.json | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression

# Gute
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/mt.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/night-owl.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/hul10.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/iterm2.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/jonnychipz.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/lightgreen.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/microverse-power.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/mojada.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_modern.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/thecyberden.omp.json" | Invoke-Expression
# oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH/wholespace.omp.json" | Invoke-Expression

# Fastfetch
# Schritt 2: Ermitteln des Benutzerverzeichnisses
$userProfilePath = [Environment]::GetFolderPath("UserProfile") + "\Documents\WindowsPowerShell\conf.json"
fastfetch -c $userProfilePath
