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

Tooltip, Ready,0,0
F1::

Loop {
	Loop {
		Tooltip, Searching for Approve or Loading screen,0,0
		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png
			If (ErrorLevel=0) {
				Tooltip, Found Approve,0,0
				click %FoundX%, %FoundY%

			}
			Else {
				sleep 500
			}

			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				break
			}
			Else {
				sleep 500
			}
	}
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else {
				Tooltip, Loading screen not found,0,0
				break
			}
	}
	Loop {
		PixelGetColor, p1, 714, 697
		PixelGetColor, p2, 740, 696
		PixelGetColor, p3, 781, 698
		Tooltip, endCheck %p1% %p2% %p3%,0,0
		If (p1=0xF1F1F1 and p2=0xF1F1F1 and p3=0xF1F1F1) || (p1=0xF0F0F0 and p2=0xF0F0F0 and p3=0xF0F0F0) || (p1=0xEFEFEF and p2=0xEFEFEF and p3=0xEFEFEF) || (p1=0xEDEDEF and p2=0xEDEDEF and p3=0xEDEDEF) {
			click 980, 1000 ;Blank
			sleep 1000
			click 980, 1000 ;Blank
			sleep 1000
			Tooltip, Disable Auto,0,0
			send {Alt Down}
			sleep 500
			click 270,70 ;Exit
			sleep 500
			send {Alt Up}
			break
		}
	}
}



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
			If (n<60)
			{
				sleep 1000
				n++
				ToolTip, Searching for %object% %n%/%timeout%, 0,0
			}
			Else
			{
				n=0
				ToolTip, %object% not found, 0,0
				break
			}
		}
	}
	return FoundX, FoundY
}


	

F4::Reload
F3::Pause
F2::ExitApp
