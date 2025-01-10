# Style default PowerShell Console
$shell = $Host.UI.RawUI
$shell.WindowTitle= "PS"

## Load custom theme for Windows Terminal
Import-Module -Name Terminal-Icons
Import-Module posh-git
#Import-Module oh-my-posh

# Originale
#oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

# Custom
# oh-my-posh --init --shell pwsh --config D:\ProxMox\weiteres\Terminal\ohmyposh3Vid.json | Invoke-Expression

# Favoriten
#oh-my-posh --init --shell pwsh --config D:\ProxMox\weiteres\Terminal\Oh-my-Posh\themes\mt.omp.json | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression

# Gute
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/mt.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/night-owl.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/hul10.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/iterm2.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/jonnychipz.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/lightgreen.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/microverse-power.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/mojada.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_modern.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/thecyberden.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/wholespace.omp.json" | Invoke-Expression


# Liste der verfügbaren Styles
$styles = @(
    "$env:POSH_THEMES_PATH/ohmyposh3Vid.json",
    "$env:POSH_THEMES_PATH/mt.omp.json",
    "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json",
    "$env:POSH_THEMES_PATH/clean-detailed.omp.json",
    "$env:POSH_THEMES_PATH/night-owl.omp.json",
    "$env:POSH_THEMES_PATH/hul10.omp.json",
    "$env:POSH_THEMES_PATH/iterm2.omp.json",
    "$env:POSH_THEMES_PATH/jandedobbeleer.omp.json",
    "$env:POSH_THEMES_PATH/jonnychipz.omp.json",
    "$env:POSH_THEMES_PATH/lightgreen.omp.json",
    "$env:POSH_THEMES_PATH/microverse-power.omp.json",
    "$env:POSH_THEMES_PATH/mojada.omp.json",
    "$env:POSH_THEMES_PATH/powerlevel10k_modern.omp.json",
    "$env:POSH_THEMES_PATH/thecyberden.omp.json",
    "$env:POSH_THEMES_PATH/wholespace.omp.json"
)

# Zufällig einen Style auswählen
$selectedStyle = Get-Random -InputObject $styles

# Den ausgewählten Style anwenden
oh-my-posh --init --shell pwsh --config $selectedStyle | Invoke-Expression

