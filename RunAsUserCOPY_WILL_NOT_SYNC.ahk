#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance,force

if A_ComputerName = G3-2
{
    Tooltip, RunAsUser.ahk`n`nA_ComputerName = G3-2`nExiting App...
    sleep, 5000
    ExitApp
}

CoordMode, Screen
Tooltip, ÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆÆ
sleep, 100
Tooltip, 
return

^+F8::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\Autorun_RESTRICTED.ahk
return

return
!t::
Reload
sleep, 300
msgbox, FAILED TO RELOAD    
return


MouseGetPos, MX, MY
clipboard=%MX%, %MY%
return
send, !{tab}
sleep, 200
sendinput, %MX%, %MY%
return

; Google Search clipbpard
^+c::
{
 Run, http://www.google.com/search?q=%clipboard%
}

return
;Chocolatey Search
^+!c::
{
	Run, https://chocolatey.org/packages?q=%clipboard%
}

return
^+r::
Tooltip, .
run, %clipboard%
Tooltip, 
return


^Space::
runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\RESTRICTEDKeyboardLayout.ahk
return

<^>!,::
send, {;}{Down}{Left}
return


::aaaa::ADMIN_


;^D::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadSpotifyPlaylistOnMousePosition.ahk
Return

#!x::	;Open Folder ! Explorer
run, explorer.exe
return

#!c::	;Open Folder ! Explorer
run, C:\!
return
#!v::	;Open Folder ! Explorer
run, D:\!
return
#!b::	;Open Folder ! Explorer
run, E:\!
return
#!d::	;Open Folder ! Explorer
RunActivate("Downloads", "explorer.exe", "c:\!\Downloads", "0", maximize)
;winmaximize
sleep, 300
MouseClickDrag_func("left", "501", "21", "947", "9", "2")

return
#!f::	;Open Folder ! Explorer
run, K:\c_dynamic
return
#!g::	;Open Folder ! Explorer
run, L:\d_dynamic
return
#!h::	;Open Folder ! Explorer
run, M:\e_dynamic
return
#!n::	;Open Folder ! Explorer
run, R:\My Drive
return
#!j::	;Open Folder ! Explorer
run, S:\My Drive
return
#!a::	;Open Folder ! Explorer
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey
return
#!t::
path_c = c:\!\Torrents
path_d = d:\!\Torrents
path_e = e:\!\Torrents
if FileExist(path_c)
	run, %path_c%
if FileExist(path_d)
	run, %path_d%
if FileExist(path_e)
	run, %path_e%
return

Launch_App1::
msgbox, Launch_App1 button pressed!
return

F12::
run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\switch_task_dynalist.ahk
return

;!<::
;send, #1
;return
;!z::
;send, #2
;return
;!x::
;send, #3	
;return
;!c::
;send, #4
;return
;!v::
;send, #5
;return
;!b::
;send, #6
;return
;!n::
;send, #7
;return
;!m:
;send, #8
;return
;!,::
;send, #9
;return
;!.::
;send, #0
;return

























































ConvertRegToBat(regfile)
{
    SplitPath, regfile, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %OutDir%\RegConvert
    run, C:\!\PortableApplications\RegConvert_v1.2\RegConvert.exe /S=%regfile% /T=%OutDir%\RegConvert\%OutNameNoExt%.bat /O=BAT2
}
Counter(x, y)
{
    x+=1
    Tooltip, %x%
    sleep, %y%
    ytot+=y
    Tooltip, 
    Return
}
GetParentDir(path)
{
    SplitPath, %path%, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    run, %OutDir%
}
FullScreenPhoto(path)
{
    run, C:\Program Files\IrfanView\i_view64.exe %path% /fs
}
PauseGooglesync()
{
    mouse_click_func("1781", "1056")
    sleep, 500
    mouse_click_func("1579", "254")
    sleep, 500
    ClickPhoto("C:\!\Pictures\Greenshot\2021-12-15 11_28_30-Google Drive Status Window.png")
}
ResumeGooglesync()
{
    mouse_click_func("1781", "1056")
    sleep, 500
    mouse_click_func("1579", "254")
    sleep, 500
    ClickPhoto("C:\!\Pictures\Greenshot\2021-12-15 11_30_42-Google Drive Status Window.png")
}
ToggleFirefoxYoutube()
{
    Process, Exist, firefox.exe
    if errorlevel = 0
        ContinueYoutube()
    else
        CloseYoutube()
}
ContinueYoutube()
{
    IniRead, inilink, C:\!\TEMP\InifilesAndOther\YoutubeCloseContinue.ini, %link%, %link%
    ;HopBackwards(seconds, inilink)
    clipboard=%inilink%
    run, %inilink%
    tmp=clipboard
    Process, Exist, firefox.exe
    if errorlevel = 0
    {
        WaitForPixelColor("129", "884", 0xC000CA, 30000)
        WinGetActiveTitle, AT
        if AT contains YouTube
        {
            mouse_click_func("685", "469")  ;   fullscreen
            mouse_click_func("685", "469")  ;   fullscreen
        }
        ExitApp
    }
}
CloseYoutube()  ;   And save playtime (TO LINK_INI)
{
    WinGetActiveTitle, AT
    WinActivate, ahk_exe firefox.exe
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    BlockInput, MouseMove
    WinGetActiveTitle, AT
    mouse_click_func("1080", "82")
    mousemove, 435, 368, 0
    sleep, 10
    WinGetActiveTitle, AT2
    send, {WheelUp 400}
    sleep, 10
    loop 1
    {
        send, {space}
        sleep, 100
        send, {left}
    }
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
    temp=%clipboard%
    mouse_rightclick_func("435", "368")
    mouse_click_func("601", "508")
    ;Got the youtubeLink
    link = %clipboard%
    IniWrite, %link%, C:\!\TEMP\InifilesAndOther\YoutubeCloseContinue.ini, %link%, %link%
    mouse_click_func("1796", "81")
    sleep, 250
    send, ^v
    sleep, 400
    FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    savepath=%clipboard%_
    if clipboard contains https://youtu.be/
    {
        send, ^{PrintScreen}
        sleep, 400
        MouseClickDrag_func("left", "1415", "64", "1841", "537", "5")
        sleep, 30
        path=%clipboard%
        send, ^wq
        sleep, 100
        send, !{f4}
        sleep, 100
        run, C:\Program Files\IrfanView\i_view64.exe %path% /fs
        MouseMove, "1556", "510", 2
    }
    else
        msgbox, error clipboard doesent contain https://youtu.be/`nclipboard = %clipboard%
}
RunCompiledAHK(exe)
{
    SplitPath, exe, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    compiled_path = C:\!\ScriptsNotSynced\CompiledAutohotkeyScripts\%OutNameNoExt%.exe
    ;run, C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe
    runwait, Ahk2Exe.exe /in %exe% /out %compiled_path% /bin "Unicode 64-bit.bin"
    run, %compiled_path%
    Tooltip, done
    sleep, 500
    Tooltip, 
}
RunActivate(title, exe_path, commands, multiple, maximize)
{
    SplitPath, exe_path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    if multiple = 1
        run, %exe_path% %commands%
    else if ProcExist(OutFileName)
        if exe_path contains .exe
            WinActivate, ahk_exe %OutFileName%
        else
            WinActivate, %title%
    else
        run, %exe_path% %commands%
    count=100
    loop
    {
        if exe_path contains .exe
            WinActivate, ahk_exe %OutFileName%
        else
            WinActivate, %title%
        WinGetActiveTitle, AT
        if AT contains %title%
            break
        else if count < 1
        {
            Tooltip, RunActivate Function Timed out after 10 seconds...
            sleep, 3000
            Tooltip, 
            return
        }
        count-=1
        sleep, 100
    }
    if maximize=1
    {
        WinMaximize, ahk_exe %OutFileName%
        WinMaximize, %AT%
        WinMaximize, %title%
        WinMaximize, %OutDir%
    }

; Windows-Shift-S: launches new Chrome instance or activates existing one (and opens new tab)
;#+s::
;    SetTitleMatchMode, 2
;    if WinExist("ahk_class Chrome_WidgetWin_1") {
;        ifWinNotActive, ahk_class Chrome_WidgetWin_1
;        {
;            WinActivate, ahk_class Chrome_WidgetWin_1
;            WinWaitActive
;        }
;        Send, ^t ; shortcut for new tab
;    } else {
;        Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
;        Sleep 100
;        WinActivate
;        WinWaitActive
;    }
;return
}
WaitForPixelColor(x, y, color, ms)  ;CHANGE THIS WITH PixelSearch
{
    ms /= 100
    loop %ms%
    { 
        CoordMode, Pixel, Screen
        PixelGetColor, real_color, x, y, RGB
        if real_color = %color%
            break
        else
        {
            sleep, 100
            ;Tooltip, color = %color%`nreal_color = %real_color%
        }
    }
}
PlayYoutubePlaylist(link)
{
    SetTitleMatchMode, 2
    CoordMode mouse, screen
    RunActivate("Watch later", link, "", "0", "1")
    WaitForPixelColor("437", "857", "0x000000", "10000")
    sleep, 1000
    mouse_click_func("473", "399")      ;   press top video (latest)
    WaitForPixelColor("1505", "317", "0x000000", "10000")
    sleep, 1000
    mouse_click_func("685", "469")  ;   fullscreen
    mouse_click_func("685", "469")  ;   fullscreen
}
ClickPhoto(photo)
{
    CoordMode, Mouse, Screen
    ImageSearch, OutX, OutY, 9, 9, 1928, 1088, %photo%
    mouse_click_func(OutX, OutY)
}
WinActivateWaitActive(AT, seconds)
{
    count := seconds*100
    loop
    {
        Tooltip, Waiting for %AT%`nTimeout in %count%
        WinGetActiveTitle, ACTIVE
        if ACTIVE Contains %AT%
        {
            Tooltip, 
            break
        }
        WinActivate, %AT%
        sleep, 10
        count -= 1
        if count < 1
        {
            Tooltip, 
            break
        }
    }
}
wait_for_fastcopy_to_finish()
{
    Random, rng, 500, 600
    loop
    {
        Process, Exist, FastCopy.exe
        if Errorlevel=0
        {
            Tooltip, 
            break
        }
        else
        {
            Tooltip, Waiting for FastCopy to finish
            sleep, %rng%
        }
    }
}
DownloadYoutubeMusic(metafiles, openfolder, deleteparts, format, path, link)
{
    FileCreateDir, %path%
    SetWorkingDir, %path%
    if FileExist(path)
        sleep, 1
    else
    {
        log = %path% Doesent Exist
        LogTime(log)
    }
    if A_WorkingDir = %path%
        sleep, 1
    else
    {
        log2 = ERROR! Working Directory is %A_WorkingDir%... Exiting App...
        LogTime(log2)
        msgbox, ERROR! Working Directory is %A_WorkingDir%... Exiting App...
        ExitApp
    }
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    Tooltip, %OutFileName%Launching yt-dlp`nmetafiles=%metafiles%`nopenfolder=%openfolder%`ndeleteparts=%deleteparts%`nformat=%format%`npath=%path%
    if openfolder=1
    {
        runwait, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadYoutubeNoWait.ahk %metafiles% %openfolder% %deleteparts% %format% %path% %link%
    }
    else
    {
        run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\DownloadYoutubeNoWait.ahk %metafiles% %openfolder% %deleteparts% %format% %path% %link%
    }
    rename:
    loop
    {
        IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
            break
        sleep, 200
    }
    loop
    {
        WinSetTitle, C:\ProgramData\chocolatey\bin\yt-dlp.exe,, %OutFileName% %format% yt-dlp
        IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        {
            sleep, 500
        }
        else
            break
    }
    IfWinExist, C:\ProgramData\chocolatey\bin\yt-dlp.exe
        goto, rename
    ;WinMaximize, %OutFileName% yt-dlp
    ;WinMinimize, %OutFileName% yt-dlp
    ; --paths [TYPES:]PATH
    ; --output %(title)s.%(ext)s
}
CleanYTMusicFolder(path, deleteparts)
{
    SplitPath, path, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
    FileCreateDir, %path%
    SetWorkingDir, %path%
    metafolderTEMP = C:\!\TEMP\zzz_%OutFileName%_MetadataTEMP
    ;metafolder = %path%\zzz_Metadata
    metafolder = %path%\..\..\zzz_Metadata\zzz_Metadata_Playlists_%format%\Metadata_%OutFileName%
    FileCreateDir, %metafolder%
    source = %path%
    dest = %metafolderTEMP%
    mode = move
    include = "*.json;*.url;*.description;*.webp;*.jpg;*.png"
    wait_for_fastcopy_to_finish()
    runwait, "c:\ProgramData\chocolatey\lib\fastcopy.portable\FastCopy392_x64\FastCopy.exe" /include=%include% /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%",,min
    source = %metafolderTEMP%
    dest = %metafolder%
    mode = move
    wait_for_fastcopy_to_finish()
    runwait, "c:\ProgramData\chocolatey\lib\fastcopy.portable\FastCopy392_x64\FastCopy.exe" /include=%include% /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%",,min
    FileRemoveDir, %metafolderTEMP%, 1

    loop 10
        FileDelete, *.webm
    if deleteparts = 1
    {
        loop 10
            FileDelete, *.part
    }
}
fastcopy_wait_func(source, dest, mode) ;   File or Folder, will create destination folders, Close even if error.
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            runwait, "c:\ProgramData\chocolatey\lib\fastcopy.portable\FastCopy392_x64\FastCopy.exe" /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%"
        }
    }
}
fastcopy_func(source, dest, mode) ;   File or Folder, will create destination folders, Close even if error.
{
    if FileExist(source)
    {
        SplitPath, dest, dest_OutFileName, dest_OutDir, dest_OutExtension, dest_OutNameNoExt, dest_OutDrive
        if FileExist(dest_OutDrive)
        {
            run, "c:\ProgramData\chocolatey\lib\fastcopy.portable\FastCopy392_x64\FastCopy.exe" /postproc=nosound /cmd=%mode% /open_window /force_close /force_start(=N) "%source%" /to="%dest%"
            sleep, 500
        }
    }
}
StopwatchTooltip(tooltip)
{
    run, C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\StopwatchTooltip.ahk %tooltip%
}
LogTime(x)
{
	FormatTime,TimeLongms,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, `n%TimeLongms% %x%, C:\!\Logs\LogTime.txt
}
LogTimeEscape(x)
{
	FormatTime,TimeLongms,, yyyy-MM-dd_HH-mm-ss.%A_msec%
	FileAppend, `n%TimeLongms% %x% Triggered by pressing Escape - Implement this --> HOW_MANY Seconds Have Passed Since %x%, C:\!\Logs\LogTime.txt
}
WriteNewFucntionAHK()
{
    CoordMode, Mouse, Screen
    Process,Exist,Code.exe
    if Errorlevel=0
    {
        msgbox, Code.exe not Running
    }
    else
    {
        loop 100
        {
            winactivate ahk_exe Code.exe
            WinGetActiveTitle, AT
            if AT contains Visual
            {
                ;send, ^+e
                mouse_click_func("31", "83")
                mousemove, 276, 251, 0
                sleep, 150
                send, {WheelUp 400}
                mouse_rightclick_func(243, 133)
                sleep, 200
                mouse_click_func(281, 158)
                sleep, 400
                ;send, {down 3}
                sleep, 100
                send, ^b
                break
            }
            sleep, 1
        }
    }
}
sleep_tooltip(seconds, tooltip)
{
    loop %seconds%
    {
        seconds -= 1
        sleep, 1000
        Tooltip, %seconds%`n%tooltip%
    }
}
ConnectedToInternet(flag=0x40) 
{ 
    Return DllCall("Wininet.dll\InternetGetConnectedState", "Str", flag,"Int",0) 
}
kill_task(exe, force)
{
    if force=0
    {
        run, cmd.exe /c Taskkill /IM "%exe%",,hide
    }
    else
    {
        run, cmd.exe /c Taskkill /IM "%exe%" /F,,hide
    }
}
RepeatSound(sound, seconds, tooltip)
{
    SoundPlay, %sound%
    minutes := % seconds/60
    ms := % (seconds*1000)-5000
    Tooltip, %tooltip%`n`nRepeatSound: %sound%`nEvery %seconds% seconds`n(Every %minutes% Minutes)
    sleep, 5000
    Tooltip, 
    loop
    {
        sleep, %ms%
        SoundPlay, %sound%
    }
}
FileCreateJunctionLink(1, 2)
{
    run, cmd.exe /c mklink /j %1% %2%
}
;C:\!\Code\GitHub\93andresen C:\!\Code\GitHub\93andresen_Scripts

;You can use either mklink /j or junction in Windows 10 to create junctions. You can use mklink /d in Windows 10 to create directory symbolic links. Notes: junction can also list junctions and determine if a file is a junction unlike mklink .
;How can I create a symbolic link on Windows 10? - Super User

MouseClickDrag_func(button, x1, y1, x2, y2, speed)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x1%, %y1%, 0
    sleep, 10
    mousemove, %mx2%, %my2%, 0
    sleep, 10
    mousemove, %x1%, %y1%, 0
    sleep, 10
    MouseClickDrag, %button%, %x1%, %y1%, %x2%, %y2%, %speed%
    mousemove, %mx%, %my%, 0
    sleep, 10
    BlockInput, MouseMoveOff
    sleep, 20
}
mouse_click_func(x, y)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x%, %y%, 0
    sleep, 10
    mousemove, %x2%, %y2%, 0
    sleep, 10
    mousemove, %x%, %y%, 0
    sleep, 10
    MouseClick, left, %x%, %y%, 1, 0
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
}
mouse_rightclick_func(x, y)
{
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    mx2 := mx+5
    my2 := my+5
    BlockInput, MouseMove
    mousemove, %x%, %y%, 0
    sleep, 10
    mousemove, %x2%, %y2%, 0
    sleep, 10
    mousemove, %x%, %y%, 0
    sleep, 10
    MouseClick, right, %x%, %y%, 1, 0
    mousemove, %mx%, %my%, 0
    BlockInput, MouseMoveOff
}
wait_for_title(title, timeout)
{
    timeout *= 5
    loop
    {
        WinGetActiveTitle, AT
        if AT contains %title%
        {
            break
        }
        timeout -= 1
        if timeout < 1
        {
            MsgBox, TIMEOUT, wait_for_title(title, timeout)... Exiting App...
            ExitApp
        }
        sleep, 200
        timeout+=1
    }
}

wait_until_title_change(title, timeout)
{
    timeout *= 5
    loop
    {
        WinGetActiveTitle, AT
        if AT contains %title%
        {
            timeout -= 1
            if timeout < 1
            {
                MsgBox, TIMEOUT, wait_for_title(title, timeout)... Exiting App...
                ExitApp
            }
            sleep, 200
            timeout+=1
        }
        else
            break
    }
}


rename_current_pattern_and_a_new_one(ATSPOT)
{
    IniRead, past_TimeLong, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_TimeLong
    IniRead, past_ATSPOT, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_ATSPOT
    FormatTime, TimeLong,, yyyy-MM-dd_HH.mm.ss
    FormatTime, TimeClock,, HH.mm.ss
    IniWrite, %TimeLong%, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_TimeLong
    IniWrite, %ATSPOT%, C:\!\ScriptsNotSynced\FL_STUDIO_START_NEW_LOOP.ini, Section, past_ATSPOT

    if ATSPOT = Spotify Premium
        ATSPOT = Spotify_Inactive
    if past_ATSPOT = Spotify Premium
        past_ATSPOT = Spotify_Inactive
    if ATSPOT = %past_ATSPOT%
    {
        send, {F2}
        sleep, 100
        send, %past_TimeLong%_->_%TimeClock%_%past_ATSPOT%  ;if spotify is inactive OR the same song still plays
        sleep, 50
        send, {enter}
        sleep, 100
    }
    else
    {
        send, {F2}
        sleep, 100
        send, %past_TimeLong%_->_%TimeClock%_%past_ATSPOT%_->_%ATSPOT%   ;2 different songs were playing
        sleep, 50
        send, {enter}
        sleep, 100
    }
    send, {F4}
    sleep, 100
    send, %TimeLong%_%ATSPOT%
    sleep, 50
    send, {enter}
    sleep, 100

}
Process_Suspend(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}

Process_Resume(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtResumeProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}

ProcExist(PID_or_Name=""){
    Process, Exist, % (PID_or_Name="") ? DllCall("GetCurrentProcessID") : PID_or_Name
    Return Errorlevel
}
end_process(exe_filelist_path)
{
    Loop, Read, %exe_filelist_path%
    {
        Progress := A_Index
        Progress *= 2
    }
    Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        ;Tooltip, Asking applications Gracefully to end - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            run, cmd.exe /c Taskkill /IM "%A_LoopReadLine%",,hide
        }
        Progress-=1
    }
    Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
    Loop, Read, %exe_filelist_path%
    {
        ;Tooltip, Killing Tasks Forcefully - %A_LoopReadLine%`n`nProgress=%Progress%
        Process, Exist, %A_LoopReadLine%
        If (ErrorLevel != 0)
        {
            run, cmd.exe /c Taskkill /IM "%A_LoopReadLine%" /F,,hide
        }
        Progress-=1
    }
}

AHKPanic(Kill=0, Pause=0, Suspend=0, SelfToo=0) {
DetectHiddenWindows, On
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptFullPath%
    {
    If Suspend
      PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend. 
    If Pause
      PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
    If Kill
      WinClose, ahk_id %ID% ;kill
    }
  }
If SelfToo
  {
  If Suspend
    Suspend, Toggle  ; Suspend. 
  If Pause
    Pause, Toggle, 1  ; Pause.
  If Kill
    ExitApp
  }
}

run_run_process(process, path, cmd)
{
    Process, Exist, %process%
    If (ErrorLevel = 0)
    {
        run_file_if_it_exists(path, cmd)
    }
}

run_file_if_it_exists(path, cmd)
{
    if FileExist(path)
    {
        run, %path% %cmd%
    }
}
runwait_file_if_it_exists(path)
{
    if FileExist(path)
    {
        runwait, %path%
    }
}

;Convert These to functions
;C:\!\Code\GitHub\93andresen_Scripts\Autohotkey\GetFileListOfClipboardFolder.ahk












