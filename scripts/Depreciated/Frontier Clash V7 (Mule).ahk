#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
#SingleInstance Force

CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
	Try {
		If (A_IsCompiled) {
			Run *RunAs "%A_ScriptFullPath%" /restart
		} Else {
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
		}
	}
	ExitApp
}



;V5 Added reconnect and relaunch
;V6 Move right a bit when activating switch
;V7 Run as admin and get game file location


Tooltip, Ready,0,0
F1::
Start:

Loop {
	Tooltip, Searching for Channel blue dot,0,0
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
		break
	}
	Else
		sleep 500
}


Loop {
	gtfo = 0

	Tooltip, Searching for Approve,0,0
	Search("Approve.png","885","445","1480","800","Approve", 9000)	
	
Assist:
	Loop {
		Loop, 6 {
			Tooltip, Searching for Assist_Unchecked,0,0
			ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack Assist.png ;Search for Assist_Unchecked
			If (ErrorLevel=0) {
				Tooltip, Found Assist_Unchecked,0,0
				click %FoundX%, %FoundY% ;Assist checkbox
				sleep 500
				mousemove 1140, 755 ;Hover over Approve
				sleep 4000
				ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack Assist.png ;Search for Assist_Unchecked again
					If (ErrorLevel=0) {
						Tooltip Found Assist_Unchecked again,0,0
						goto Assist
					}
					Else {
						Tooltip, Assist not found again,0,0
						Tooltip, Found Assist_Checked,0,0
						ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 *TransBlack Approve.png ;Search for Approve
						If (ErrorLevel=0) {
							click %FoundX%, %FoundY% ;Approve
						}
						Else {
							Tooltip, Approve not found,0,0
							goto Assist
						}
					}
			}
			Else {
				Tooltip, Assist_Unchecked not found,0,0
				sleep 500
			}
		}
		
		ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack Assist_Checked.png ;Search for Assist_Checked
		If (ErrorLevel=0) {
			Tooltip, Found Assist_Checked,0,0
			ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png ;Search for Approve
			If (ErrorLevel=0) {
				Tooltip, Found Approve
				click %FoundX%, %FoundY% ;Approve
			}
		}

		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			break
		}
		sleep 500
	}
	
	Loading:
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			sleep 250
		}
		Else {
			Tooltip, Loading screen not found,0,0
			sleep 500
			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0)
				goto Loading
			Else {
				sleep 8000
				send {Alt Down}
				sleep 500
				click 1155, 920 ; Auto Attack
				send {Alt Up}
				AutoRepeat("w", 2500) ;Walk
				AutoRepeat("a", 2000) ;Walk
				sleep 500
				send f
				AutoRepeat("w", 600) ;Walk
				sleep 500
				send f
				AutoRepeat("d", 100) ;Walk
				AutoRepeat("w", 600) ;Walk
				sleep 500
				send f
				break
			}
		}
	}
	
	F6::
	n=0
	SetTimer, EndCheck, 2000, On
	SetTimer, Focus, 30000, On
	Tooltip, Spam weapon,0,0
	Loop {
		If WinActive("ahk_class UnrealWindow") {
			send rf ; Kin Change This!===============================================================================================================================================================================
			sleep 500
			If (gtfo = 1) {
				break
			}
		}
	}
	click %FoundX%, %FoundY% ;Skip
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	send {Escape}
	sleep 1000
	click 270, 65 ;Exit
	sleep 2000
	click 1270, 580 ;OK
}

EndCheck:
	ImageSearch, FoundX, FoundY, 835, 890, 1110, 1010, *50 Skip.png
		If (ErrorLevel=0) {
			Tooltip, Skip found,0,0
			SetTimer, EndCheck, Delete
			gtfo = 1
		}
		Else {
			Tooltip, Skip not found %n%,0,0
			n++
		}
return

Focus:
	IfWinNotActive ("ahk_class UnrealWindow")
	{
		WinActivate ahk_class UnrealWindow
	}
	
	PixelGetColor, p1, 577, 466
	PixelGetColor, p2, 594, 463
	PixelGetColor, p3, 825, 469
	PixelGetColor, p4, 1138, 470
	PixelGetColor, p5, 1343, 476
	If (p1=0x000000 and p2=0x000000 and p3=0x000000 and p4=0x000000 and p5=0x000000) {
		Tooltip, Disconnect found,0,0
		sleep 1000
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 OK_Disconnect.png
		If (ErrorLevel = 0) {
			Tooltip, OK found,0,0
			click %FoundX%, %FoundY%
		}
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 OK_Disconnect_2.png
		If (ErrorLevel = 0) {
			Tooltip, OK_2 found,0,0
			click %FoundX%, %FoundY%
		}
	}
	
	IfWinNotExist ahk_class UnrealWindow
	{	
		Tooltip, Game crashed,0,0
		RegRead, reg1, HKEY_CURRENT_USER\SOFTWARE\Classes\toflauncher\DefaultIcon
		Run %reg1%
		Search("Launch.png","15","725","375","850","Launch button", 200)
		sleep 1000
		Search("Launch.png","15","725","375","850","Launch button", 200)
		click %FoundX%, %FoundY%
		Search("CloseX.png","1690","170","1790","270","Close Button", 300)
		click %FoundX%, %FoundY%
		sleep 500
		click 940, 530 ;Login
	}
return


Search(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 %file%
		If ErrorLevel = 0
		{
			ToolTip, %object% Found, 0,0
			break
		}
		Else
		{
			If (n<timeout)
			{
				sleep 1000
				n++
				ToolTip, Searching for %object% %n%/%timeout%, 0,0
			}
			Else
			{
				n=0
				Msgbox, %object% not found, 0,0
				break
			}
		}
	}
	return FoundX, FoundY, ErrorLevel
}



AutoRepeat(Key, Duration:=0)
{
	End := A_TickCount + Duration
	While, A_TickCount < End
	{
		SendInput, {%Key% DownR}
		Sleep, 30
	}
	SendInput, {%Key% Up}
}

F4::Reload
F3::Pause
F2::ExitApp
