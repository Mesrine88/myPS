# Install necessary tools
winget install JanDeDobbeleer.OhMyPosh -s winget
Install-Module -Name Terminal-Icons -Repository PSGallery -Force -Scope CurrentUser
winget install Git.Git -s winget
winget install GitHub.cli -s winget

# Define the URLs and file paths
$urls = @(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/3270.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DroidSansMono.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Inconsolata.zip",
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip"
)

$tempPath = [System.IO.Path]::GetTempPath()
$extractionPath = Join-Path -Path $tempPath -ChildPath "nerd-fonts\extracted"
$fontInstallPath = "$env:SystemRoot\Fonts"

# Create the extraction path if it doesn't exist
if (-Not (Test-Path -Path $extractionPath)) {
    New-Item -Path $extractionPath -ItemType Directory
}


# Download, extract and install each font
foreach ($url in $urls) {
    $zipFile = Join-Path -Path $tempPath -ChildPath ([System.IO.Path]::GetFileName($url))
    
    # Download the zip file
    Invoke-WebRequest -Uri $url -OutFile $zipFile
    
    # Extract the zip file, manually handling overwrites
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zipArchive = [System.IO.Compression.ZipFile]::OpenRead($zipFile)
    foreach ($entry in $zipArchive.Entries) {
        $destinationPath = Join-Path -Path $extractionPath -ChildPath $entry.FullName
        if (Test-Path -Path $destinationPath) {
            Remove-Item -Path $destinationPath -Force
        }
        if ($entry.Name) {  # Skip directory entries
            $entryStream = $entry.Open()
            $destinationStream = [System.IO.File]::Create($destinationPath)
            $entryStream.CopyTo($destinationStream)
            $entryStream.Close()
            $destinationStream.Close()
        }
    }
    $zipArchive.Dispose()

# Install fonts from the extracted directory
Get-ChildItem -Path $extractionPath -Recurse -Include *.ttf, *.otf | ForEach-Object {
    $fontPath = $_.FullName
    $fontName = $_.Name
    $destPath = Join-Path -Path $fontInstallPath -ChildPath $fontName

    # Copy font to Fonts directory
    Copy-Item -Path $fontPath -Destination $destPath -Force

    # Add font to registry
    $fontRegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
    $fontEntryName = $fontName -replace "\.[^\.]+$", ""
    Set-ItemProperty -Path $fontRegKey -Name $fontEntryName -Value $fontName
}
    
    # Clean up the extracted files
    Remove-Item -Path $zipFile -Force
}


