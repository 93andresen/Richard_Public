# GUI Specs
Write-Host "Checking winget..."

# Check if winget is installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
	Write-Host "Winget not found, installing it now."
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host Winget Installed
}

Write-Host "Installing Autohotkey"
winget install -e Lexikos.AutoHotkey | Out-Host
Write-Host "Installed Autohotkey"
jkljkljkl

& "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\!\GitHubClonedRepositories\Richard_Public\FreshWindows.ahk