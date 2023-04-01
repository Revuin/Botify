#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3

Start:
Tooltip, Ready,0,0
F1::

Loop {
	SetTimer, Ability1, 62000, On
	SetTimer, Ability2, 31000, On
	
	Loop {
		Loop,128{ ;Weapon
		tooltip, Attacking,0,0
		send rf{Tab}2
		sleep 250
		}
		Loop,3{ ;Weapon
		tooltip, Attacking,0,0
		send qf{Tab}2
		sleep 250
		}
	}
}

Ability1:
	tooltip, spam Q1,0,0
	Loop, 4 { ;Staff ability
		send q
		sleep 200
		send 1
		sleep 300
	}
	return
Ability2:
	tooltip, Spam R1,0,0
	Loop, 14 { ;Sword ability
		send r
		sleep 200
		send 1
		click left, down
		sleep 100
		click left, up
		sleep 200
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
				ToolTip, %object% not found, 0,0
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
