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
	Start:
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

	send {Alt down}
	sleep 100
	send 1
	sleep 100
	send {Alt Up} ;Rewards

	Search("FloatingBumpers.png","0","1000","1725","1065","FloatingBumpers", 30)
	click %FoundX%, %FoundY%

	Search("Match_FG.png","1535","695","1750","865","Match", 30)
	click %FoundX%, %FoundY% ;

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
	Loading_FG:
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else {
				Tooltip, Loading screen not found,0,0
				sleep 500
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
					If (ErrorLevel=0) {
						sleep 500
						goto Loading_FG
					}
					Else
						break
			}
	}
	start := A_Now
	Loop, 10
	{
		end := A_Now
		end -= start, Seconds
		Tooltip, Waiting %end%/10,0,0
		sleep 1000
	}
	Tooltip, Jump off,0,0
	sendInput {w DownR}
	sleep 6000
	sendInput {w Up}
	sleep 5000
	
	Tooltip, Exiting,0,0
	send {Alt Down}
	sleep 1000
	click 270,70 ;Exit
	sleep 500
	send {Alt Up}
	Loop, 5 {
		ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 Ok.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY%
		}
		Else {
			sleep 500
		}
	}
}


F2::ExitApp
F4::Reload
F3::Pause



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

Ability1:
	tooltip, spam Q1,0,0
	Loop, 4 { ;Staff ability
		send q
		sleep 200
		send 1
		sleep 300
	}
	return
; Ability2:
	; tooltip, Spam R1,0,0
	; Loop, 14 { ;Sword ability
		; send r
		; sleep 200
		; send 1
		; click left, down
		; sleep 100
		; click left, up
		; sleep 200
	; }
	; return