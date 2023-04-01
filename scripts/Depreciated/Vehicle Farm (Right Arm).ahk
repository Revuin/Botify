#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3

tooltip Ready,0,0
F1::

Tooltip, Attacking,0,0
start := A_Now
Loop, 6 {
	Loop, 7 {
		send q123
		sleep 100
		click left, down
		sleep 100
		click left, up
		sleep 100
	}
	send {shift}
	sleep 500
}
Loop {
	end := A_Now
	end -= start, Seconds
	Tooltip, Seconds passed %end%,0,0
	If (end >= 165) {
		start := A_Now
		send {tab}
		Loop, 7 {
			Loop, 7 {
				send q123
				sleep 100
				click left, down
				sleep 100
				click left, up
				sleep 100
			}
			send {shift}
			sleep 500
		}
	}
	Else {
		send {tab}
		Loop, 7 {
			Loop, 7 {
				send q
				sleep 100
				click left, down
				sleep 100
				click left, up
				sleep 100
			}
			send {shift}
			sleep 500
		}
	}
}


Attack:
n=0


return


AutoRepeat(Key, Duration:=0)
{
	End := A_TickCount + Duration
	While, A_TickCount < End
	{
		SendInput, {%Key% DownR}
		Sleep, 30
		click left, down
	}
	SendInput, {%Key% Up}
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
