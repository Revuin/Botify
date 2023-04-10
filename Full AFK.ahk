#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
#SingleInstance Force
CommandLine := DllCall("GetCommandLine", "Str") ;Runs as administrator
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

#Include scripts/other/Launch Game.ahk
IfWinNotActive ("ahk_class UnrealWindow") ;Focus on game
{
	WinActivate ahk_class UnrealWindow
}
SetTimer, Focus, 5000, On ;Focus on game and restart game if it crashes
#Include scripts/Daily Tasks.ahk ;Daily

Tooltip, Back to Full AFK.ahk,0,0

If A_DDDD in Monday,Wednesday,Friday,Sunday
{
	Loop, 6
	{
		#Include scripts/JO Carnival Party.ahk ;JO
	}
}
Else
{
	#Include scripts/Dimensional Trials.ahk ;DT
}

If A_DDDD = Monday
{
	Loop, 2
	{
		stage = 1
		Loop, 4
		{
			#Include scripts/Sequential Phantasm.ahk
		}
	}
	#Include scripts/Other/Sequential Phantasm Claim Rewards.ahk
	
	raid = 1
	Loop
	{
		#Include scripts/RAID.ahk ;Raid
		If (raid >= 4)
		{
			break
		}
	}
}

If A_DDDD = Friday
{
	#Include scripts/Void Rifts.ahk ;Void Rifts
}

If A_DDDD = Saturday
{
	#Include scripts/Frontier Clash Hard.ahk ;Frontier Clash Hard
}


nFC = 0
Loop, 50
{	
	Tooltip, Starting FC %nFC%
	sleep 500
	#Include scripts/Frontier Clash.ahk ;FC
	nFC++
}


SetTimer, Focus, Delete
IfWinexist ahk_class UnrealWindow
{
	Tooltip, Closing game,0,0
	Winclose ahk_class UnrealWindow
	sleep 5000
	Process Close, QRSL.exe
	sleep 8000
}
ExitApp







;Functions and labels
Search(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 img/%file%
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


Focus:
	IfWinNotActive ("ahk_class UnrealWindow") ;Focus on game
	{
		WinActivate ahk_class UnrealWindow
	}
	
	PixelGetColor, p1, 577, 466 ;Check for disconnected message
	PixelGetColor, p2, 594, 463
	PixelGetColor, p3, 825, 469
	PixelGetColor, p4, 1138, 470
	PixelGetColor, p5, 1343, 476
	If (p1=0x000000 and p2=0x000000 and p3=0x000000 and p4=0x000000 and p5=0x000000)
	{
		Tooltip, Disconnect found,0,0
		sleep 1000
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 img/OK_Disconnect.png
		If (ErrorLevel = 0) {
			Tooltip, OK found,0,0
			click %FoundX%, %FoundY%
		}
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 img/OK_Disconnect_2.png
		If (ErrorLevel = 0) {
			Tooltip, OK_2 found,0,0
			click %FoundX%, %FoundY%
		}
	}

	IfWinExist, ahk_class #32770 ;Press OK if crash error message appears
	{	
		WinActivate ahk_class #32770
		send {Enter}
	}

	IfWinNotExist ahk_class UnrealWindow ;Start game again if it's closed
	{	
		Tooltip, Game crashed,0,0
		RegRead, reg1, HKEY_CURRENT_USER\SOFTWARE\Classes\toflauncher\DefaultIcon
		Run %reg1%
		sleep 5000
		IfWinNotActive ("Tower of Fantasy") ;Focus on launcher
		{
			WinActivate, Tower of Fantasy
		}
		Loop
		{
			Tooltip, Searching for launch or update button,0,0
			ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Launch.png
			If (ErrorLevel = 0)
			{
				sleep 1000
				ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Launch.png
				If (ErrorLevel = 0)
				{
					click %FoundX%, %FoundY%
					break
				}
			}
			sleep 200
			
			ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Update.png
			If (ErrorLevel = 0)
			{
				click %FoundX%, %FoundY%
			}
			sleep 200
		}
		Search("CloseX.png","1690","170","1790","270","Close Button", 300)
		click %FoundX%, %FoundY%
		sleep 500
		click 940, 530 ;Login
	}
return


CommissaryBuy(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		Mousemove 0,0
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 img/%file%
		If (ErrorLevel = 0)
		{
			ToolTip, %object% Found, 0,0
			click %FoundX%, %FoundY%
			sleep 1000
			click 1410, 990 ;Right arrow for max items
			sleep 500
			click 1740, 950 ;Purchase
			Loop, 5
			{
				ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/OK.png
				If (ErrorLevel=0)
				{
					Tooltip, Found OK,0,0
					click %FoundX%, %FoundY% ;OK
					sleep 1000
					break, 2
				}
				Else
				{
					Tooltip, OK not found,0,0
					sleep 500
				}
			}
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


F2::ExitApp
F4::Reload
F3::Pause
