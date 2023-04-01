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

starsVar = 85
starsY2 = 0

SetTimer, Disconnect,5000,On

Loop {
	Loop {
		ImageSearch, starsX1, starsY1, 335, %starsVar%, 915, 860, *5 *TransWhite 3Stars.png ;Search the entire window for 3 stars
		If (ErrorLevel = 0) { ;If found, do multiple clicks in the 3rd line
			ToolTip, Found 3 stars,0,0
			starsY2 := starsY1+70
			Tooltip, Click everywhere on the 3rd line,0,0
			x1=410
			Loop {
				click %x1%, %starsY2%
				sleep 100
				x1 += 130
				If (x1 >= 830) {
					break
				}
			}
			starsVar := starsY1+10 ;Shrink the search
		}
		Else {
			Tooltip, 3 stars not found,0,0
			starsVar := 85
			sleep 500
		}

		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png
		If (ErrorLevel=0) {
			Tooltip, Found Approve,0,0
			click %FoundX%, %FoundY%
		}
		Else {
			Tooltip, Approve not found,0,0
			sleep 500
		}

		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			break
		}
		Else {
			Tooltip, Loading screen not found,0,0
			sleep 500
		}
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
				Tooltip, Loading screen not found,0,0
				break
			}	
		}
	}
	sleep 3000
	send {Alt Down}
	sleep 500
	click 1155, 920 ; Auto Attack
	send {Alt Up}

	Loop {
		Tooltip, Searching for Channel blue dot,0,0
		PixelGetColor, p1, 19, 62
		PixelGetColor, p2, 20, 63
		PixelGetColor, p3, 21, 64
		If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
			Tooltip, Channel blue dot found,0,0
			sleep 1000
			break
		}
		Else
			sleep 500
	}

WinClose ahk_class UnrealWindow ;Reopen the game
Search("Launch.png","15","725","375","850","Launch button", 200)
sleep 1000
Search("Launch.png","15","725","375","850","Launch button", 200)
click %FoundX%, %FoundY%
Search("CloseX.png","1690","170","1790","270","Close Button", 300)
click %FoundX%, %FoundY%
sleep 500
click 940, 530 ;Login
Loop {
		Tooltip, Searching for Channel blue dot,0,0
		PixelGetColor, p1, 19, 62
		PixelGetColor, p2, 20, 63
		PixelGetColor, p3, 21, 64
		If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
			Tooltip, Channel blue dot found,0,0
			sleep 1000
			break
		}
		Else
			sleep 500
}
send {Enter}
sleep 2000
Search("Recruit.png","15","550","180","630","Recruit", 30)
click %FoundX%, %FoundY%
}




Disconnect:
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
