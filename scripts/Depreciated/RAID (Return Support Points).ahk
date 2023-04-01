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
	Loop
	{
		Tooltip, Searching for Channel blue dot,0,0
		PixelGetColor, p1, 19, 62
		PixelGetColor, p2, 20, 63
		PixelGetColor, p3, 21, 64
		If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
			Tooltip, Channel blue dot found,0,0
			sleep 3000
			break
		}
		Else
			sleep 500
	}

	send {Alt down}
	sleep 100
	send 3
	sleep 100
	send {Alt Up} ;DUAL SWORDS
	Search("Challenge.png","165","545","330","625","Challenge", 30)
	click %FoundX%, %FoundY% ;Challenge
	sleep 2000
	Loop {
		Tooltip, Searching for Raid,0,0
		ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 Raid.png
		If (ErrorLevel = 0) {
			MouseMove %FoundX%, %FoundY%
			sleep 1000
			click 110, 570, relative
			sleep 2000
			break
		}
		Else {
			Loop, 2 { ;Scroll to the right
				click 1530,270 left, down
				sleep 150
				mousemove 1330, 270
				sleep 150
				mousemove 1130, 270
				sleep 150
				mousemove 930, 270
				sleep 150
				mousemove 730, 270
				click left, up
				sleep 150
			}
			mousemove 1005, 150
			sleep 1000
			ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 Raid.png ;Search for Raid again
			If (ErrorLevel = 0) 
			{
				Tooltip Found Raid,0,0
				MouseMove %FoundX%, %FoundY%
				sleep 1000
				click 110, 570, relative
				sleep 1000
				mousemove 990, 170
				sleep 2000
				break
			}
			Loop, 2 { ;Scroll to the left
				click 730, 270 left, down
				sleep 150
				mousemove 930, 270
				sleep 150
				mousemove 1130, 270
				sleep 150
				mousemove 1330, 270
				sleep 150
				mousemove 1530,270
				click left, up
				sleep 150
			}
			mousemove 1005, 150
			sleep 1000
			ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 Raid.png ;Search for Raid again
			If (ErrorLevel = 0) 
			{
				Tooltip Found Raid,0,0
				MouseMove %FoundX%, %FoundY%
				sleep 1000
				click 110, 570, relative
				sleep 1000
				mousemove 990, 170
				sleep 2000
				break
			}
		}
	}

	click 630, 475 ;Midlevel Control Room

	Tooltip, Searching for Go,0,0
	Loop {
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_Raid.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY% ;Go
			break
		}
		Else {
			sleep 1000
		}
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_2.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY% ;Go
			break
		}
		Else {
			sleep 1000
		}
	}

	; Search("Match.png","1135","520","1360","630","Match", 30)
	; click %FoundX%, %FoundY% ;Match
	sleep 2000
	click 655, 585

	Loop 
	{
		Tooltip, Searching for Approve or Loading screen,0,0
		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png
		If (ErrorLevel=0) 
		{
			Tooltip, Found Approve,0,0
			click %FoundX%, %FoundY%
		}

		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) 
		{
			Tooltip, Loading screen found,0,0
			break
		}
		sleep 500
			
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_Raid.png
		If (ErrorLevel=0) {
			Tooltip, Found Go_Raid,0,0
			click %FoundX%, %FoundY% ;Go
			sleep 2000
			; ImageSearch, FoundX, FoundY, 1135, 520, 1360, 630, *30 Match.png
			; If (ErrorLevel=0) {
				; Tooltip, Found match,0,0
				; click %FoundX%, %FoundY% ;Match
				click 655, 585
			; }
		}
			
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_2.png
		If (ErrorLevel=0) {
			Tooltip, Found Go_2,0,0
			click %FoundX%, %FoundY% ;Go
			sleep 2000
			; ImageSearch, FoundX, FoundY, 1135, 520, 1360, 630, *30 Match.png
			; If (ErrorLevel=0) {
				; Tooltip, Found match,0,0
				; click %FoundX%, %FoundY% ;Match
				click 655, 585
			; }
		}
		sleep 500

	}

	Loading:
	Loop 
	{
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) 
		{
			Tooltip, Loading screen found,0,0
			sleep 250
		}
		Else {
			Tooltip, Loading screen not found,0,0
			sleep 500
			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0)
				goto Loading
			Else
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
