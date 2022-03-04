#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance, Force

script_bypass=Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;



; If the script is not elevated, relaunch as administrator and kill current instance:

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}


FileCreateDir, C:\temp_Windows10ToolkitRichard
SetWorkingDir, C:\temp_Windows10ToolkitRichard

updating := inirwTOOLKIT("r", "updating")

if updating != 1
{
    filedelete, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
    filedelete, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ini
    fileappend, Console Output, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
    runwait, powershell.exe Write-Host "Creating Ststem Restore Point and naming it: Before_Running_Windows10ToolkitRichard";Enable-ComputerRestore -Drive "C:\";Checkpoint-Computer -Description "Before_Running_Windows10ToolkitRichard" -RestorePointType "MODIFY_SETTINGS",,max
    update = 0
    inirwTOOLKIT("w", "update", "0")
    debloat = 0
    inirwTOOLKIT("w", "debloat", "0")
    apps = 0
    inirwTOOLKIT("w", "apps", "0")
    netflix = 0
    inirwTOOLKIT("w", "netflix", "0")
    darktsk = 0
    inirwTOOLKIT("w", "darktsk", "0")
    reboot = 0
    inirwTOOLKIT("w", "reboot", "0")
    ooshutup0 = 0
    inirwTOOLKIT("w", "ooshutup0", "0")
    ooshutup1 = 0
    inirwTOOLKIT("w", "ooshutup1", "0")
    ooshutup2 = 0
    inirwTOOLKIT("w", "ooshutup2", "0")
    ooshutup3 = 0
    inirwTOOLKIT("w", "ooshutup3", "0")
    ooshutup4 = 0
    inirwTOOLKIT("w", "ooshutup4", "0")
    dns4a6a = 0
    inirwTOOLKIT("w", "dns4a6a", "0")
    dns4c6c = 0
    inirwTOOLKIT("w", "dns4c6c", "0")
    dns4a6c = 0
    inirwTOOLKIT("w", "dns4a6c", "0")
    dns4c6a = 0
    inirwTOOLKIT("w", "dns4c6a", "0")
    personal = 0
    inirwTOOLKIT("w", "personal", "0")
}
;run, C:\temp_Windows10ToolkitRichard\Public-main\OutputFileToConsole.ahk C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt
;loop 20
;{
;    WinActivate, C:\Program Files\AutoHotkey\AutoHotkey.exe
;    WinGetActiveTitle, AT
;    if AT = C:\Program Files\AutoHotkey\AutoHotkey.exe
;        break
;    sleep, 100
;}
;WinMaximize, C:\Program Files\AutoHotkey\AutoHotkey.exe
;WinSetTitle, C:\Program Files\AutoHotkey\AutoHotkey.exe, , Windows Toolkit Richard Console Output

inirwTOOLKIT("w", "nogui", "0")
for n, param in A_Args  ; For each parameter:
{
    CheckStringWriteIni(param, "update")
    CheckStringWriteIni(param, "debloat")
    CheckStringWriteIni(param, "apps")
    CheckStringWriteIni(param, "netflix")
    CheckStringWriteIni(param, "darktsk")
    CheckStringWriteIni(param, "reboot")
    CheckStringWriteIni(param, "ooshutup0")
    CheckStringWriteIni(param, "ooshutup1")
    CheckStringWriteIni(param, "ooshutup2")
    CheckStringWriteIni(param, "ooshutup3")
    CheckStringWriteIni(param, "ooshutup4")
    CheckStringWriteIni(param, "dns4a6a")       ;   dns4a6a ipv4=auto          ipv6=auto
    CheckStringWriteIni(param, "dns4c6c")       ;   dns4c6c ipv4=cloudflare    ipv6=cloudflare
    CheckStringWriteIni(param, "dns4a6c")       ;   dns4a6c ipv4=auto          ipv6=cloudflare
    CheckStringWriteIni(param, "dns4c6a")       ;   dns4c6a ipv4=cloudflare    ipv6=auto
    CheckStringWriteIni(param, "personal")      ;   dns4c6a ipv4=cloudflare    ipv6=auto
}
CheckStringWriteIni(param, needle)
{
    if param contains %needle%
    {
        inirwTOOLKIT("w", needle, "1")
        inirwTOOLKIT("w", "nogui", "1")
    }
}

nogui := inirwTOOLKIT("r", "nogui")
update := inirwTOOLKIT("r", "update")
debloat := inirwTOOLKIT("r", "debloat")
apps := inirwTOOLKIT("r", "apps")
netflix := inirwTOOLKIT("r", "netflix")
darktsk := inirwTOOLKIT("r", "darktsk")
reboot := inirwTOOLKIT("r", "reboot")
ooshutup0 := inirwTOOLKIT("r", "ooshutup0")
ooshutup1 := inirwTOOLKIT("r", "ooshutup1")
ooshutup2 := inirwTOOLKIT("r", "ooshutup2")
ooshutup3 := inirwTOOLKIT("r", "ooshutup3")
ooshutup4 := inirwTOOLKIT("r", "ooshutup4")
dns4a6a := inirwTOOLKIT("r", "dns4a6a")
dns4c6c := inirwTOOLKIT("r", "dns4c6c")
dns4a6c := inirwTOOLKIT("r", "dns4a6c")
dns4c6a := inirwTOOLKIT("r", "dns4c6a")
personal := inirwTOOLKIT("r", "personal")

if (updating != "1") and (nogui != "1")
    runwait, C:\temp_Windows10ToolkitRichard\Public-main\UserCkeckboxesStart.ahk
;WinSet, AlwaysOnTop, , Windows Toolkit Richard Console Output

nogui := inirwTOOLKIT("r", "nogui")
update := inirwTOOLKIT("r", "update")
debloat := inirwTOOLKIT("r", "debloat")
apps := inirwTOOLKIT("r", "apps")
netflix := inirwTOOLKIT("r", "netflix")
darktsk := inirwTOOLKIT("r", "darktsk")
reboot := inirwTOOLKIT("r", "reboot")
ooshutup0 := inirwTOOLKIT("r", "ooshutup0")
ooshutup1 := inirwTOOLKIT("r", "ooshutup1")
ooshutup2 := inirwTOOLKIT("r", "ooshutup2")
ooshutup3 := inirwTOOLKIT("r", "ooshutup3")
ooshutup4 := inirwTOOLKIT("r", "ooshutup4")
dns4a6a := inirwTOOLKIT("r", "dns4a6a")
dns4c6c := inirwTOOLKIT("r", "dns4c6c")
dns4a6c := inirwTOOLKIT("r", "dns4a6c")
dns4c6a := inirwTOOLKIT("r", "dns4c6a")
personal := inirwTOOLKIT("r", "personal")

Tooltip, nogui=%nogui%`nupdate=%update%`ndebloat=%debloat%`napps=%apps%`nnetflix=%netflix%`ndarktsk=%darktsk%`nreboot=%reboot%`nooshutup0=%ooshutup0%`nooshutup1=%ooshutup1%`nooshutup2=%ooshutup2%`nooshutup3=%ooshutup3%`nooshutup4=%ooshutup4%`ndns4a6a=%dns4a6a%`ndns4c6c=%dns4c6c%`ndns4a6c=%dns4a6c%`ndns4c6a=%dns4c6a%`npersonal=%personal%

/*
MAYBE_AND_OTHER:

C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Netflix_2.0.ahk
simple-software-restriction-policy  ;   This makes it so i cant install stuff anymore, unless i unlock it og fix the settings...

NEW MAYBE AND OTHER:
cup aaclr winaero-tweaker aerozoom ontopreplica chocobutler imagemagick iconworkshop iconviewer thumbico desktopicontoggle icofx nirext folder-marker terminal-icons.powershell becyicongrabber any2ico zvirtualdesktop defaultprogramseditor iconsext.install iconsext iconizer driverfusion faviconizer desktopicons-winconfig keepass-plugin-favicon ansicon nvidia-profile-inspector taskbarx cygwin soundswitch virtualmidisynth chocobutler taskbar-winconfig desk-drive hotswap hddguardian snips tcpipmanager.portable tcpipmanager chocolateypowershell shadowsocks ireboot 4k-tokkit nvidia-profile-inspector todotxt.net godmode clamsentinel sendmessage mbruler roost-desktop-notifier-for-nest cygwin imagemagick.app bginfo amp-winoff.install amp-winoff nyrna windows-repair-toolbox scp balabolka leanify data-lifeguard-diagnostic virtualmidisynth swyh libre-hardware-monitor system-monitor acronis-drive-monitor dual-monitor-tools monitorswitcher monitorinfoview directorymonitor fpsmonitor veeam-one-monitor-client monitordetails networkmonitor pingmonitorfree traffic-monitor remote-desktop-ip-monitor-and-blocker openhardwaremonitor wifichannelmonitor wifichannelmonitor performance-monitor gbm nzxt trafficwatcher ultramon wirelessnetview processactivityview regfromapp diskmon diskcountersview bluetoothview procmon userassistview deviceioview bluetoothlogview serialportmonitor serialportmonitor serialportmonitor serialportmonitor serialportmonitor serialportmonitor dbgview procrastitracker direvents cports hdguard aida64-extreme.portable iris aida64-engineer rawcap aida64-extreme sysmon sonarr radarr jackett sonarr lidarr lidarr smartmontools modernflyouts nirlauncher netstat-agent backupper-server multipass psievm disk2vhd packer vagrant vboxheadlesstray Dellcommandupdate Dellcommandupdate-uwp Intel-dsa Lastfmscrobbler Notepadplusplus Altsnap Sizer Launchy Plex Plexmediaserver Plex-home-theater Winamp Duplicati Mpc-be Workspacer Webtorrent-desktop Libreoffice-fresh Vcredist140 Rufus Bitwarden-cli Tidytabs Sandboxie.install Linkshellextension Internet-download-manager Pingplotter Rammap Regexcoach Accesschk Windows-kill Vmmap Npackd.install Drivermax Adwcleaner Cmdutils Ecm Iconworkshop Iconviewer Thumbico Desktopicontoggle Icofx Nirext Folder-marker Terminal-icons.powershell Becyicongrabber Any2ico Zvirtualdesktop Defaultprogramseditor Iconsext Iconizer Faviconizer Desktopicons-winconfig Keepass-plugin-favicon Ansicon Nvidia-profile-inspector Taskbarx Soundswitch Swyh Libre-hardware-monitor System-monitor Acronis-drive-monitor Dual-monitor-tools Monitorswitcher Monitorinfoview Directorymonitor Fpsmonitor Veeam-one-monitor-client Monitordetails Networkmonitor Pingmonitorfree Traffic-monitor Remote-desktop-ip-monitor-and-blocker Openhardwaremonitor Wifichannelmonitor Performance-monitor Gbm Nzxt Trafficwatcher Ultramon Wirelessnetview Processactivityview Regfromapp Diskmon Diskcountersview Bluetoothview Procmon Userassistview Deviceioview Bluetoothlogview Serialportmonitor Dbgview Procrastitracker Direvents DireventsCports Hdguard Aida64-extreme.portable Iris Aida64-engineer Rawcap Aida64-extreme Sysmon Sonarr Radarr Jackett Lidarr Smartmontools Modernflyouts Nirlauncher Netstat-agent Backupper-server Multipass Psievm Disk2vhd Packer Vagrant Vboxheadlesstray Driverfusion Windowsrepair Windows-admin-center Vortex Ultimate-settings-panel Winauth Windirstat Tidystart.powershell VirtualCloneDrive Urbackup-client Sysexp SwissFileKnife Strokesplus.portable Specialfoldersview Songr Silverlight Shotcut Shman ShellTools Shellbagsview Setup-Assistant Regexpixie Putty Powerautomatedesktop Netscan Lastactivityview Laps Imagemanager Googleearthpro Androidstudio Alldup Duplicatecleaner Deletefiles Minibin Recyclenow Rbcmd Recycle Neovim Smartftp Adb Playnite Opendns-updater Desktop-notifications-for-android-chrome Reprofiler Taskschedulerview Mailer Siv Partitionmasterfree Partitionwizard Perfmonitor2 Fluent-terminal Wsl2 Ln Junction-link-magic Ntfslinksview Defprof Supercopier Ultracopier Act-cli Git-lfs GoogleChrome.Canary Webstorm Gimp Win-vind Wsl-kalilinux Ganttproject Defraggler Vagrant Vagrant-manager Googlephotos Mp3tag Sharemouse Directoryopus Filezilla Winscp Doublecmd Beyondcompare 0install Wiztree Eraser Aaclr Winaero-tweaker Aerozoom Ontopreplica Chocobutler Imagemagick Bginfo Amp-winoff.install Amp-winoff Nyrna Windows-repair-toolbox Scp Balabolka Leanify Data-lifeguard-diagnostic Virtualmidisynth Taskbar-winconfig Desk-drive Hotswap Hddguardian Snips Tcpipmanager.portable Tcpipmanager Chocolateypowershell Shadowsocks Ireboot 4k-tokkit Todotxt.net Godmode Clamsentinel Sendmessage Mbruler Roost-desktop-notifier-for-nest Cygwi veracrypt Rainmeter Powertoys Plasso Regcool.portable 7zip Vscode Setdefaultbrowser Firefox Edgedeflector Autohotkey Chocolatey-misc-helpers.extension Fastcopy Python Winrar Peazip Classic-shell Sysinternals Cloneapp Epicgameslauncher Google-drive-file-stream Treesizefree Spacesniffer Shutup10 Revo-uninstaller Gh Git Github Mousewithoutborders F.lux Authy-desktop Everything Musicbee Th-ch-youtube-music Equalizerapo Steam Crystaldiskinfo Irfanview Irfanviewplugins Qalculate Throttlestop Microsoft-windows-terminal PowerShell Greenshot Speedyfox Geforce-experience Msiafterburner Directx Glaryutilities-free Virtualbox Copyq Discord Eartrumpet Yt-dlp Choco-package-list-backup Battle.net Ds4windows Obs Malwarebytes Thunderbird Qbittorrent Ffmpeg Dropit Jre8 Openjdk Signal Telegram Voicemeeter-banana Vlc Freedownloadmanager Spicetify-cli Terminal-icons.powershell Adobereader Googlechrome Tortoisesvn
choco install tagspaces launchbox playnite goggalaxy gamedownloader game-collector gamesavemanage
choco install notion pomodoneapp tomighty tomatoad
livesplit
choco install toggl
choco install latencymon
apo-ok
choco install timeit
windowsfirewallcontrol dns-benchmark

LIB_BAD:
choco install ntfssecurity-psmodule performance-monitor pal tidystart.powershell
        
WINGET_OTHER:
WhatPulse 3.3           WhatPulse.WhatPulse
Advanced File Copier    9NBLGGH1185X
SteelSeries.GG
BinanceTech.Binance

LINKS:
https://freefilesync.org/download.php
https://downloads.yubico.com/products/Yubico-Login-for-Windows-2.0.3-win64.msi
https://maxlauncher.sourceforge.io/downloads.html
https://aka.ms/vs/17/release/vc_redist.x64.exe  ;Permalink for latest supported x64 version. The X64 redistributable package contains both ARM64 and X64 binaries. This package makes it easy to install required Visual C++ ARM64 binaries when the X64 redistributable is installed on an ARM64 device.

EMULATORS:
genymotion dosbox ppsspp mame pcsx2 fs-uae snes9x scummvm visualboyadvance nestopia project64 emulationstation fusion
WINDOWS_STORE:
musicxmatch

--allow-empty-checksums -y

FormatTime, TFileCreateDir, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Remember_for_Later.ahkd_HH-mm-ss
%clipboard% > FileCreateDir, C:\!\Logs\CMD\%TIME%CMD.txt

FormatTime, TIME, , yyyy-MM-dd_HH-mm-ss
;%clipboard% | Out-File -FilePath FileCreateDir, C:\!\Logs\Powershell\%TIME%Powershell.txt


Get-Content -Path C:\Users\pass9\OneDrive\Documents\PowerShell_transcript.DELL-G3-3579.Bw+4eX4a.20210408204538.txt

Start-Transcript -IncludeInvocationHeader -NoClobber -Append

Start-Transcript -Path FileCreateDir, C:\!\Logs\Powershell_Transcript.log
-Append
[-Force -NoClobber -IncludeInvocationHeader
[-WhatIf]
[<CommonParameters>]

C:\Users\pass9\OneDrive\Documents\WindowsPowerShell\

https://github.com/builtbybel/CloneApp/archive/refs/heads/master.zip


loop 3    ;SCOOP    Make sure PowerShell 5 (or later, include PowerShell Core) and .NET Framework 4.5 (or later) are installed. Then run:
{
     run, powershell.exe cup powershell powershell-core dotnet4.6.1 powershell;Set-ExecutionPolicy RemoteSigned -scope CurrentUser;Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
     sleep, 5000
     send, a
     send, {enter}
     sleep, 3000
     runwait, cmd.exe /c C:\Users\93and\scoop\shims\scoop install git
     runwait, cmd.exe /c C:\Users\93and\scoop\shims\scoop update
}

*/























if updating != 1
{
    if update = 1
        log("Update Windows - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if debloat = 1
        log("Debloat and Optimize Windows (Including OneDrive) - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if apps = 1
        log("Install Applications (Lets you choose Applications) - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if netflix = 1
        log("Netflix 2.0 - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if reboot = 1
        log("Reboot - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if ooshutup1 = 1
        log("Essesinal Tweaks (Probably Best For Most People) - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if ooshutup2 = 1
        log("Essesinal Tweaks + Disable Microphone And Webcam - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if ooshutup3 = 1
        log("Essesinal Tweaks + Disable App Access (For The Paranoid) - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if ooshutup4 = 1
        log("Undo All Changes (Revert To Factory Settings) - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    if ooshutup0 = 1
        log("Don't Do Anything - Will Keep These Settings As is - was Picked", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
}

if darktsk = 1
{
    runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 35908098 2
    runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 36898195 2
    runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\ViVeTool-v0.2.1\ViVeTool.exe addconfig 37204171 2
}

if var = shortcutstart
{
    run, powershell.exe iwr git.io/J13Mt -UseBasicParsing|iex
    ExitApp
}




if update = 1
{
    FileCreateShortcut, C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard.ahk, C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows10ToolkitRichard.lnk, C:\temp_Windows10ToolkitRichard\Public-main, shortcutstart
    inirwTOOLKIT("w", "updating", "1")
    RunPowershellLog("cup abc-update", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    runwait, powershell.exe ABC-Update.exe /A:Install /R:10 /T:Driver`,Software /Log_Append:C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt,,max
    RunPowershellLog("cup Boxstarter", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    RunPowershellLog("import-module Boxstarter.WinConfig;Install-WindowsUpdate", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    filedelete, C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Windows10ToolkitRichard.lnk
    inirwTOOLKIT("w", "updating", "0")
}
if debloat = 1
{
    RunPowershellLog("iwr https://raw.githubusercontent.com/93andresen/Public/main/Windows10ChrisTitusForkRichard.ps1 -UseBasicParsing|iex", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    ;RunPowershellLog("iwr https://raw.githubusercontent.com/93andresen/Public/main/Windows10DebloaterSycnexForkRichard.ps1", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    RunPowershellLog("import-module Boxstarter.WinConfig;Disable-GameBarTips;Disable-BingSearch;Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar", path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
    command = choco install explorer-winconfig --params "'/SHOWEXTENSIONS:yes /SHOWFULLPATH:yes /SHOWHIDDEN:yes /SHOWCHECKBOXES:no /SHOWENCRYPTED:yes /SHOWPREVIEWPANE:yes /SHOWDETAILSPANE:no /SHOWDRIVESNOMEDIA:yes /USESHARINGWIZARD:yes'" --force
    RunPowershellLog(command, path:="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide:="max")
}


if ooshutup = 1
    ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup1_EssesinalTweaksProbablyBestForMostPeople.cfg")
if ooshutup = 2
    ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup2_EssesinalTweaksDisableMicrophoneAndWebcam.cfg")
if ooshutup = 3
    ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup3_EssesinalTweaksDisableAppAccessForTheParanoid.cfg")
if ooshutup = 4
    ooshutup("C:\temp_Windows10ToolkitRichard\Public-main\ooshutup\ooshutup4_UndoAllChangesRevertToFactorySettings.cfg")

ooshutup(cfg)
{
    dir=%A_WorkingDir%
    SplitPath, cfg, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%
    SetWorkingDir, %OutDir%
    log("UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    UrlDownloadToFile, https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe, OOSU10.exe
    log("cfg", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    runwait, OOSU10.exe %cfg% /quiet
    SetWorkingDir, %dir%
}



runwait, C:\temp_Windows10ToolkitRichard\Public-main\Reg\RegConvert\Bluetooth_notification_area_icon_Enable.bat,,max
runwait, C:\temp_Windows10ToolkitRichard\Public-main\Reg\RegConvert\Set_Drag_and_Drop_to_Move_by_default.bat,,max


if dns4a6a = dns4a6a
    SetDNS("automatic", "ipv4", "ipv6")
if dns4c6c = dns4c6c
    SetDNS("cloudflare", "ipv4", "ipv6")
if dns4a6c = dns4a6c
    SetDNS("automatic", "ipv4", "0")
    SetDNS("cloudflare", "0", "ipv6")
if dns4c6a = dns4c6a
    SetDNS("cloudflare", "ipv4", "0")
    SetDNS("automatic", "0", "ipv6")

;dns4a6a ipv4=auto          ipv6=auto
;dns4c6c ipv4=cloudflare    ipv6=cloudflare
;dns4a6c ipv4=auto          ipv6=cloudflare
;dns4c6a ipv4=cloudflare    ipv6=auto

;RunPowershellLog("iwr https://raw.githubusercontent.com/93andresen/Public/main/NetworkFlush_SameCommandsAsNordVPNDiagnosticsApp.bat -UseBasicParsing|iex", path="C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt", minmaxhide="max")

runwait, cmd.exe /c C:\temp_Windows10ToolkitRichard\Public-main\NetworkFlush_SameCommandsAsNordVPNDiagnosticsApp.bat | tee -a C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt


SetCapsLockState, Off
SetNumLockState, On

if personal = 1
{
    Tooltip, YES IT WORKS!!!!!!!!
    run, powershell.exe choco pin add --name="'authy-desktop'"
}

run, C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard2.ahk   ;REMOVE THIS WHEN FIXED
ExitApp                                                                         ;REMOVE THIS WHEN FIXED

;if apps = 1
;{
    FileCreateDir, C:\temp_Windows10ToolkitRichard\Public-main\ApplicationLists
    SetWorkingDir, C:\temp_Windows10ToolkitRichard\Public-main\ApplicationLists

    ;Gui, Add, Tab2,, 1 Nessescary Apps|2 Maybe And Other|3 Maybe And Other|4 Keepass|5 Yubikey Apps|15 Winget|16 Extra Chocolatey Apps (Type)  ; Tab2 vs. Tab requires [v1.0.47.05+].
    Gui, Add, Tab2,, Pick Applications to Install 1/2
    gui, add, Text,, Nessescary Apps:
    Gui, Add, CheckBox, gGoHereWhenClicked1, Check All - Nessescary Applications
    countlines += 1
    loop, read, Chocolatey_Apps_Nessescary_List.txt
    {
        Gui, Tab, 1
        if	!Mod(A_Index, 30)
            gui, add, Text, ys, 
        gui, add, checkbox, vcheckbox1_%A_Index%, %A_LoopReadLine%
        appname1_%A_Index% = %A_LoopReadLine%
        countlines += 1
    }
    countlines1 = %countlines%
    countlines += 1
    check_button_2 := % countlines
    gui, add, Text, ys, Maybe And Other:
    Gui, Add, CheckBox, gGoHereWhenClicked2, Check All - Maybe And Other
    loop, read, Chocolatey_Apps_Maybe_And_Other_List.txt
    {
        ;Gui, Tab, 2
        if	!Mod(A_Index, 30)
            gui, add, Text, ys
        gui, add, checkbox, vcheckbox2_%A_Index%, %A_LoopReadLine%
        appname2_%A_Index% = %A_LoopReadLine%
        countlines += 1
    }
    countlines2 = %countlines%
    Gui, Tab, 16
    Gui, Add, Edit, tab_extra r30  ; r30 means 30 rows tall.
    Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
    Gui, Add, Button, default xm, ContinueToPage2/2  ; xm puts it at the bottom left corner.
    WinSet, AlwaysOnTop, off, Windows Toolkit Richard Console Output
    Gui, Show
    WinWaitActive, Windows10ToolkitRichard.ahk
    WinSetTitle, Windows10ToolkitRichard.ahk, , Pick Applications to Install 1/2 - Nessescary Apps and Maybe and Other (2/2 is Keepass And Plugins Yubikey Apps and Winget Apps)
    check_ran=0
    return
    GoHereWhenClicked1:
    GuiControlGet, check,, Button1
    if (check = 1 and check_ran != 1)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran=1
    }
    else if (check = 0 and check_ran != 0)
    {
        HookGUICheckboxes(check, "1", countlines1)
        check_ran=0
    }
    return
    GoHereWhenClicked2:
    GuiControlGet, check,, Button%check_button_2%
    if (check = 1 and check_ran2 != 1)
    {
        HookGUICheckboxes(check, check_button_2, countlines2)
        check_ran2=1
    }
    else if (check = 0 and check_ran2 != 0)
    {
        HookGUICheckboxes(check, check_button_2, countlines2)
        check_ran2=0
    }
    return

    GuiClose:
    GuiEscape:
    msgbox, Script Ended Because of GuiClose or GuiEscape... Exiting App....
    WinSet, AlwaysOnTop, on, Windows Toolkit Richard Console Output
    ExitApp
    ButtonContinueToPage2/2:
    Gui, Submit  ; Save each control's contents to its associated variable.

    FileCreateDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists
    SetWorkingDir, C:\temp_Windows10ToolkitRichard\PICKEDApplicationsLists

    count=1
    loop %countlines2%
    {
        if checkbox1_%count% = 1
        {
            FileAppend, % appname1_%count%, PICKED_Chocolatey_Apps_Nessescary_List.txt
            FileAppend, %A_Space%, PICKED_Chocolatey_Apps_Nessescary_List.txt
        }
        count+=1
    }
    count=1
    loop %countlines2%
    {
        if checkbox2_%count% = 1
        {
            FileAppend, % appname2_%count%, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
            FileAppend, %A_Space%, PICKED_Chocolatey_Apps_Maybe_And_Other_List.txt
        }
        count+=1
    }
;}

run, C:\temp_Windows10ToolkitRichard\Public-main\Windows10ToolkitRichard2.ahk

~Esc::
if esc!=1
{
    esc=1
    msgbox, %A_ScriptName% is Paused`n`n%A_ScriptFullPath%`n`n`nPress Esc twice to Exit App
}
else if esc=1
    ExitApp













HookGUICheckboxes(check, from, too)
{
    too += 1
    count=%from%
    loop
    {
        loop
        {
            GuiControlGet, Button%count% ; Retrieves 1 if it is checked, 0 if it is unchecked.
            if Button%count%!=%check%
                ControlClick, Button%count%
            else if Button%count%=%check%
                break
        }
        count+=1
        if count = %too%
            break
    }
}

Print(string){
	ListVars
	WinWait ahk_id %A_ScriptHwnd%
	ControlSetText Edit1, %string%
	WinWaitClose
}
PrintDebug(string:=""){
	Static
	string := string ? string . "`r`n" . lastStr : "", lastStr := string
	If !WinActive("ahk_class AutoHotkey"){
		ListVars
		WinWait ahk_id %A_ScriptHwnd%
		WinGetTitle, title, ahk_id %A_ScriptHwnd%
	}Else If !string{
		PostMessage, 0x112, 0xF060,,, %title% ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
		Return
	}
	ControlSetText Edit1, %string%, ahk_id %A_ScriptHwnd%
}
RunPowershellLog(command, path:="C:\!\Logs\Powershell\_PowershellLog.txt", minmaxhide:="max")
{
    ;FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    ;if temp_path = TimeLong_temp_path
    ;    temp_path = C:\!\Logs\Powershell\%TimeLong%_PowershellLog.txt
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if not FileExist(OutDir)
        FileCreateDir, %OutDir%
    ;SplitPath, temp_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    ;if not FileExist(OutDir)
    ;    FileCreateDir, %OutDir%
    bypass_command = Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    runwait, powershell.exe %bypass_command%%command% | Tee-Object -a -file %path%,,%minmaxhide%
    ;FileRead, ps_tmp, %temp_path%
    ;FileAppend, `n%ps_tmp%, %path%
}
inirwTOOLKIT(rw, key, value:="")
{
    if rw=w
        IniWrite, %value%, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ini, Section, %key%
    else if rw=r
        IniRead, value, C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichard.ini, Section, %key%
    Else
        msgbox, ERROR, rw was not r or w`nrw=%rw%
    return %value%
}
SetDNS(provider, ipv4, ipv6)
{
    if FileExist("c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe")
    {
        status = installed
        exe_path = c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe
    }
    else if FileExist("C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe")
    {
        status = installed
        exe_path = C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe
    }
    else
    {
        status := CheckInstall("C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe", "QuickSetDNS")
        if status = installed
            exe_path = C:\ProgramData\chocolatey\lib\quicksetdns\tools\QuickSetDNS.exe
        else
        {
            status := CheckInstall("c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe", "nirlauncher")
            if status = installed
                exe_path = c:\tools\nirlauncher\NirSoft\QuickSetDNS.exe
        }
    }
    if status = installed
    {
        if provider = cloudflare
        {
            if ipv4=ipv4
                runwait, cmd.exe /c %exe_path% /SetDNS "1.1.1.1,1.0.0.1",,max                                       ;Set Cloudflare dns servers
            if ipv6=ipv6
                runwait, cmd.exe /c %exe_path% /SetDNS6 "2606:4700:4700::1111,2606:4700:4700::1001",,max            ;Set Cloudflare dns servers
        }
        if provider = automatic
        {
            if ipv4=ipv4
                runwait, cmd.exe /c %exe_path% /SetDNS "",,max	                                                    ;Set Automatic dns servers
            if ipv6=ipv6
                runwait, cmd.exe /c %exe_path% /SetDNS6 "",,max	                                                    ;Set Automatic dns servers
        }
    }
    runwait, cmd.exe /c ipconfig /flushdns,,max
}
CheckInstall(path, choconame)
{
    if FileExist(path)
    {
        status = installed
        log("status = installed", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
    }
    else
    {
        status = missing
        if not FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
        {    
            runwait, powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')),,max
            if FileExist("C:\ProgramData\chocolatey\bin\choco.exe")
            {
                choco = 1
                runwait, powershell.exe choco feature enable -n=allowGlobalConfirmation,,max
                runwait, powershell.exe choco feature enable -n=allowEmptyChecksums,,max
                log("Sucsessfully Installed chocolatey", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                log("choco feature enable -n=allowGlobalConfirmation", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                log("choco feature enable -n=allowEmptyChecksums", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
            }
            else
            {
                choco = 0
                log("ERROR - tried to install Chocolatey but C:\ProgramData\chocolatey\bin\choco.exe is still missing", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                Tooltip, ERROR - tried to install Chocolatey but C:\ProgramData\chocolatey\bin\choco.exe is still missing
                sleep, 5000
                Tooltip, 
            }
        }
        log("44choco install %choconame%", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
        runwait, powershell.exe choco install %choconame%,,max
        if FileExist(path)
        {
            log("48Sucsessfully Installed %choconame%", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
            Tooltip, 
            status = installed
        }
        if not FileExist(path)
        {
            log("54Installing %choconame% ignoring checksums", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums,,max
            if FileExist(path)
            {
                log("58Sucsessfully Installed %choconame% --ignore-checksums", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                Tooltip, 
                status = installed
            }
        }
        if not FileExist(path)
        {
            log("65choco install %choconame% %--ignore-checksums% %--force%", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums --force,,max
            if FileExist(path)
            {
                log("69Sucsessfully Installed %choconame% --ignore-checksums --force --force", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                Tooltip, 
                status = installed
            }
        }
        if not FileExist(path)
        {
            log("76choco install %choconame% %--ignore-checksums% %--force% %--force-dependencies%", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
            runwait, powershell.exe choco install %choconame% --ignore-checksums --force --force-dependencies,,max
            if FileExist(path)
            {
                log("Sucsessfully Installed %choconame% --ignore-checksums --force --force-dependencies", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                Tooltip, 
                status = installed
            }
            else
            {
                log("ERROR - tried to install %choconame% but %path% is still missing", "C:\temp_Windows10ToolkitRichard\Windows10ToolkitRichardLOG.txt")
                Tooltip, ERROR - tried to install %choconame% but %path% is still missing
                sleep, 5000
                Tooltip, 
            }
        }
    }
    return %status%
}

log(x, filename:="C:\!\Logs\LogToFile.txt")
{
	FormatTime,TimeLong,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, `n%TimeLong% %x%, %filename%
}
