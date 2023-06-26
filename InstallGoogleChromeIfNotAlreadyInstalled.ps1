# Check if Google Chrome is installed
$chromePath = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe' -ErrorAction SilentlyContinue

if ($chromePath -eq $null) {
    Write-Host "Google Chrome is not installed. Installing..."
    
    # Specify the URL to download the Google Chrome installer
    $chromeDownloadUrl = "https://dl.google.com/chrome/install/CHROME_INSTALLER.exe"
    
    # Specify the path to save the downloaded installer
    $installerPath = "$env:TEMP\chrome_installer.exe"
    
    # Download the Google Chrome installer
    Invoke-WebRequest -Uri $chromeDownloadUrl -OutFile $installerPath
    
    # Install Google Chrome silently
    Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -Wait
    
    # Check if installation was successful
    if (Test-Path $chromePath) {
        Write-Host "Google Chrome has been installed successfully."
    }
    else {
        Write-Host "Failed to install Google Chrome."
    }
}
else {
    Write-Host "Google Chrome is already installed."
}
