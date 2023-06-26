# Check if clipboard history is already enabled
$settings = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Clipboard' -Name 'EnableClipboardHistory' -ErrorAction SilentlyContinue

if ($settings -eq $null) {
    # Enable clipboard history
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Clipboard' -Name 'EnableClipboardHistory' -Value 1
    
    # Show clipboard history icon in the system tray
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Clipboard' -Name 'ShowClipboardHistory' -Value 1
    
    Write-Host "Clipboard history has been enabled."
}
else {
    Write-Host "Clipboard history is already enabled."
}
