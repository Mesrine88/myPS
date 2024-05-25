# Define URLs for font ZIP files
$fontUrls = @(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/3270.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DroidSansMono.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Inconsolata.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip"
)

# Define download and extraction paths
$downloadPath = "$env:TEMP\nerd-fonts"
$extractionPath = "$downloadPath\extracted"

# Create directories if they don't exist
if (-Not (Test-Path -Path $downloadPath)) {
    New-Item -Path $downloadPath -ItemType Directory | Out-Null
}
if (-Not (Test-Path -Path $extractionPath)) {
    New-Item -Path $extractionPath -ItemType Directory | Out-Null
}

# Download font ZIP files
foreach ($url in $fontUrls) {
    $fileName = [System.IO.Path]::GetFileName($url)
    $destination = Join-Path -Path $downloadPath -ChildPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $destination
}

# Function to install fonts
function Install-Font {
    param (
        [string]$fontPath
    )

    # Copy font to Fonts folder
    $fontsFolder = [System.IO.Path]::Combine($env:SystemRoot, "Fonts")
    Copy-Item -Path $fontPath -Destination $fontsFolder

    # Add font to registry
    $fontName = [System.IO.Path]::GetFileNameWithoutExtension($fontPath)
    $fontExtension = [System.IO.Path]::GetExtension($fontPath)
    $fontRegistryName = "$fontName$fontExtension"
    $fontRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
    Set-ItemProperty -Path $fontRegistryPath -Name $fontRegistryName -Value $fontPath
}

# Extract and install fonts
Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($zipFile in Get-ChildItem -Path $downloadPath -Filter *.zip) {
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile.FullName, $extractionPath)
}

# Install all extracted fonts
foreach ($fontFile in Get-ChildItem -Path $extractionPath -Recurse -Filter *.ttf, *.otf) {
    Install-Font -fontPath $fontFile.FullName
}

# Clean up
Remove-Item -Path $downloadPath -Recurse -Force
