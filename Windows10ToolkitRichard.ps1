Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

'Downloaded files will be saved in C:\temp_Windows10ToolkitRichard'
if (Test-Path "C:\temp_Windows10ToolkitRichard"){
    Remove-Item -LiteralPath "C:\temp_Windows10ToolkitRichard" -Force -Recurse
}
mkdir C:\temp_Windows10ToolkitRichard
Set-Location C:\temp_Windows10ToolkitRichard
Write-Host "Creating Ststem Restore Point and naming it: Before_Running_Windows10ToolkitRichard"
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "Before_Running_Windows10ToolkitRichard" -RestorePointType "MODIFY_SETTINGS"

$source = 'https://github.com/93andresen/Public/archive/refs/heads/main.zip'
$destination = 'C:\temp_Windows10ToolkitRichard\Public-main.zip'
Invoke-WebRequest -Uri $source -OutFile $destination
'Downloading 93andresen Public Folder as zip'
Expand-Archive -Force C:\temp_Windows10ToolkitRichard\Public-main.zip C:\temp_Windows10ToolkitRichard
Remove-Item "C:\temp_Windows10ToolkitRichard\Public-main.zip"

# INSTALLING CHOCOLATEY AND WINGET

if (Test-Path "C:\ProgramData\chocolatey\bin\choco.exe"){
    'Chocolatey Allready Installed'
}  
else{
    'Installing Chocolatey'
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
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

if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
    'Autohotkey Already Installed'
}  
else{
    choco install Autohotkey
    if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
        'Chocolatey Sucsessfully installed Autohotkey'
    }  
    else{
        winget install -e Lexikos.AutoHotkey | Out-Host
        if (Test-Path "C:\Program Files\AutoHotkey\AutoHotkey.exe"){
            'Chocolatey COULD NOT install Autohotkey'
            'Winget Sucsessfully installed Autohotkey'
        }  
        else{
            'Could not install Autohotkey with Winget OR Chocolatey!!!'
        }
    }
}
choco feature enable -n=allowGlobalConfirmation -y
choco feature enable -n allowEmptyChecksums -y

#RUNNING MY AHK_SCRIPTS - RunAsUser and RunAsAdmin

'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk'
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsAdminCOPY_WILL_NOT_SYNC.ahk
'running C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk - THIS ALSO RUNS AS ADMIN'
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\RunAsUserCOPY_WILL_NOT_SYNC.ahk


#RUNNING MY AHK_SCRIPT - Windows10ToolkitRichard
'running c:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ahk'
& "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk

function Delete-FolderAndContents {
    # http://stackoverflow.com/a/9012108

    param(
        [Parameter(Mandatory=$true, Position=1)] [string] $folder_path
    )

    process {
        $child_items = ([array] (Get-ChildItem -Path $folder_path -Recurse -Force))
        if ($child_items) {
            $null = $child_items | Remove-Item -Force -Recurse
        }
        $null = Remove-Item $folder_path -Force
    }
}

