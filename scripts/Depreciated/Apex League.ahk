#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
Thread, interrupt, 0  ; Make all threads always-interruptible.
#Persistent

r=0
tooltip, Ready,0,0
F1::
Start:
Loop {
	Search("FindMatches.png","1375","650","1865","860","Find Matches", 1000)
	click %FoundX%, %FoundY% ;Find Matches

	Loop {
			Tooltip, Searching for Loading screen,0,0
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
				If (ErrorLevel=0) {
					Tooltip, Loading screen found,0,0
					break
				}
				Else {
					sleep 500
				}
	}
	Loading:
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else {
				Tooltip, Loading screen not found,0,0
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
					If (ErrorLevel=0) {
						sleep 500
						goto Loading
					}
					Else
						break
			}
	}
	sleep 4000
	F6::
	tooltip, Walking,0,0	
	AutoRepeat("w", 4000)	
	Tooltip, Attacking,0,0
	
	send {tab}3
	Loop, 10 { ;Sword ability
			send r
			sleep 200
			send 1
			click left, down
			sleep 100
			click left, up
			sleep 200
	}
	SetTimer, Ability1, 61000, On
	SetTimer, Ability2, 46000, On
	Loop {
		Tooltip, Use E,0,0
		Loop, 11 {
			send e123{Tab}
			click left, down
			sleep 100
			click left, up
			sleep 250
		}
		AutoRepeat("w", 100)	
		send {shift}
		sleep 300
		Loop, 11 {
			send e123{Tab}
			click left, down
			sleep 100
			click left, up
			sleep 250
		}
		
		AutoRepeat("w", 100)	
		send {shift}
		sleep 300
		Tooltip, Use R,0,0
		send r23{Tab}
		sleep 200
		click left, down
		sleep 400
		AutoRepeat("w", 2000)
		click left, up
		sleep 1000
		AutoRepeat("w", 100)	
		send {shift}
		sleep 300

		ImageSearch, FoundX, FoundY, 1375, 650, 1865, 860, *5 FindMatches.png
		If (ErrorLevel=0) {
				Tooltip, Find Matches found,0,0
				SetTimer, Ability1, Delete
				SetTimer, Ability2, Delete
				break
		}
	}
	return
}

Ability1:
	tooltip, Spam Q1,0,0
	Loop, 5 { ;Staff ability
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

AutoRepeat(Key, Duration:=0)
{
	End := A_TickCount + Duration
	While, A_TickCount < End
	{
		SendInput, {%Key% DownR}
		Sleep, 30
		; click left, down
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
	return FoundX, FoundY
}












	

F4::Reload
F3::Pause
F2::ExitApp
