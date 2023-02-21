;V7 Rotate camera less
;	Extra Rewards text detection
;	Extra boss stage detection
;V8 Use Selfie mode to align camera
;V9 Detect ground after falling at start
;V10 Use unstuck at start
;V11 Dash off at start and don't try to dash off at end
;V12 Use middle click to reset camera instead
;V13 Use image detection for unstuck and Rewards end screen

usePot = 0

Loop {
	gtfo = 0
	battle = 0
	lowVit = 0
	
	Loop {
		Tooltip, Searching for Channel blue dot,0,0
		PixelGetColor, p1, 19, 62
		PixelGetColor, p2, 20, 63
		PixelGetColor, p3, 21, 64
		If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
			Tooltip, Channel blue dot found,0,0
			sleep 2000
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
	sleep 1500
	click 255, 470 ;Select
	sleep 1000
	click 510, 825 ;Go
	sleep 1000
	click 1640, 925 ;Sadness Valley
	sleep 1000
	click 185, 320 ;Difficulty 02
	sleep 1000

	Tooltip, Searching for Go,0,0
	Loop {
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go.png
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

	sleep 2000
	Tooltip, Searching for Purchase,0,0
	ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 Purchase.png
	If (ErrorLevel=0) {
			Tooltip, Found Purchase,0,0
			lowVit = 1
		If (usePot = 1) {
			click %FoundX%, %FoundY% ;Purchase
			Search("Use.png","465","660","760","810","Use", 30)
			click %FoundX%, %FoundY% ;Use
			sleep 500
			send {escape}
			Tooltip, Searching for Go,0,0
			Loop {
				ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go.png
				If (ErrorLevel=0) {
					click %FoundX%, %FoundY% ;Go
					break
				}
				ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_2.png
				If (ErrorLevel=0) {
					click %FoundX%, %FoundY% ;Go
					break
				}
				ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_3.png
				If (ErrorLevel=0) {
					click %FoundX%, %FoundY% ;Go
					break
				}
				ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 Go_4.png
				If (ErrorLevel=0) {
					click %FoundX%, %FoundY% ;Go
					break
				}
				sleep 500
			}
		}
		Else {
			sleep 1000
			click 655, 580 ;Continue
		}
	}
	sleep 2000
	ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 Purchase.png
	If (ErrorLevel=0) {
		lowVit = 1
		sleep 1000
		click 655, 580 ;Continue
	}
	Search("Match.png","1135","520","1360","630","Match", 30)
	click %FoundX%, %FoundY% ;Match
	Search("Approve.png","885","445","1480","800","Approve", 90000)
	click %FoundX%, %FoundY% ;Approve
	If (lowVit = 1) {
		Tooltip, Continue (low vitality),0,0
		sleep 1000
		click 655, 580 ;Continue
	}

	Loop {
		Tooltip, Searching for Approve or Loading screen,0,0
		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png
		If (ErrorLevel=0) {
			Tooltip, Found Approve,0,0
			click %FoundX%, %FoundY%
			If (lowVit = 1) {
				Tooltip, Continue (low vitality),0,0
				sleep 2000
				click 655, 580 ;Continue
			}
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
	Loading_JO_Sadness:
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
				goto Loading_JO_Sadness
			Else {
				sleep 1000
				break
			}
		}
	}
	Tooltip, Waiting,0,0
	loopCount1 = 0
	Loop, 5 {
		Tooltip, Waiting %loopCount1%,0,0
		sleep 1000
		loopCount1++
	}
	
	
	Tooltip, Jump off forward,0,0
	SendInput, {w DownR}
	sleep 5000
	SendInput, {w Up}
	sleep 3000
	
	Tooltip, Unstuck,0,0
	send {escape}
	sleep 2000
	click 1665, 630 ;Settings
	Search("Unstuck.png","1080","130","1730","330","Unstuck", 30)
	click %FoundX%, %FoundY% ;Unstuck
	sleep 1500
	click 1265, 585 ;OK
	sleep 8000
	send {escape}
	
	Tooltip Jump off again,0,0
	SendInput, {w DownR}
	sleep 100
	send {space}
	sleep 500
	send {space}
	sleep 500
	send {shift}
	SendInput, {w Up}
	sleep 4000	

	click down, m
	sleep 100
	click up, m

	SetTimer, endStageCheck, 500, On

	Loop {
		loopCount2 = 0
		Loop, 8 {
			Tooltip, Waiting %loopCount2%,0,0
			send r
			sleep 1000
			loopCount2++
		}
		If (battle = 1) {
			break
		}
		Tooltip, Dash off,0,0
		SendInput, {s DownR}
		sleep 100
		send {space}
		sleep 500
		send {space}
		sleep 500
		send {shift}
		SendInput, {s Up}
		sleep 3000
	}

	SetTimer, Heal, 62000, On
	SetTimer, EndCheck_JO_Sadness, 1000, On
	Loop {
		Tooltip, Attacking,0,0
		send rf
		sleep 2500
		send 23{tab}
		sleep 2500
		If (gtfo = 1) {
			break
		}
	}
}


Heal:
	tooltip, spam Q1,0,0
	Loop, 5 { ;Staff ability
		send qf
		sleep 200
		; send 1
		sleep 300
	}
return

endStageCheck:
	found = 0
	PixelGetColor, p1, 941, 49
	PixelGetColor, p2, 986, 52
	PixelGetColor, p3, 1022, 52
	Tooltip, endStageCheck,0,0
	If (p1=0xF5F5F5 and p2=0xF5F5F5 and p3=0xF5F5F5) {
		Tooltip, Found boss hp bar,0,0
		found = 1
		sleep 500
	}

	ImageSearch, FoundX, FoundY, 650, 650, 1435, 985, *30 SadnessValleyEnd.png
	If (ErrorLevel=0) {
		Tooltip, Found orange ground 1,0,0
		found = 1
		sleep 500
	}
	
	ImageSearch, FoundX, FoundY, 650, 650, 1435, 985, *30 SadnessValleyEnd_2.png
	If (ErrorLevel=0) {
		Tooltip, Found orange ground 2,0,0
		found = 1
		 sleep 500
	}
	
	ImageSearch, FoundX, FoundY, 650, 650, 1435, 985, *30 SadnessValleyEnd_3.png
	If (ErrorLevel=0) {
		Tooltip, Found orange ground 3,0,0
		found = 1
		sleep 500
	}
	
	ImageSearch, FoundX, FoundY, 650, 650, 1435, 985, *30 SadnessValleyEnd_4.png
	If (ErrorLevel=0) {
		Tooltip, Found orange ground 3,0,0
		found = 1
		sleep 500
	}
	
	ImageSearch, FoundX, FoundY, 650, 650, 1435, 985, *30 SadnessValleyEnd_5.png
	If (ErrorLevel=0) {
		Tooltip, Found orange ground 3,0,0
		found = 1
		sleep 500
	}
	
	If (found = 1)
	{
		Tooltip, Found End,0,0
		SetTimer, endStageCheck, delete
		SendInput, {w DownR}
		sleep 9000
		SendInput, {w Up}
		Tooltip, Enable auto battle,0,0
		send {Alt Down}
		sleep 500
		click 1155, 920 ; Enable Auto Attack
		sleep 500
		send {Alt Up}
		sleep 500
		tooltip, spam Q1,0,0
		Loop, 5 { ;Staff ability
			send qf
			sleep 200
			send 1
			sleep 300
		}
		battle = 1
	}
	
	; PixelSearch px, py, 310, 140, 465, 290, 0xFFFFFF, 0 
	; If (ErrorLevel=0) {
		; Tooltip, At least 1 player still in-game,0,0
		; sleep 500
	; }
	; Else {
		; Tooltip, Everyone left - Exiting,0,0
		; send {escape}
		; sleep 1000
		; click 270,70 ;Exit
		; sleep 2000
		; ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 Ok.png
		; If (ErrorLevel=0) {
			; click %FoundX%, %FoundY%
		; }
		; goto start
	; }
return

EndCheck_JO_Sadness:
		ImageSearch, FoundX, FoundY, 680, 680, 800, 710, *Transf24fff Rewards_JO.png
		If (Errorlevel = 0)
		{
			Tooltip, Found End,0,0
			SetTimer, Heal, delete
			SetTimer, EndCheck, delete
			click 980, 1000 ;Blank
			sleep 1000
			click 980, 1000 ;Blank
			sleep 500
			Tooltip, Disable Auto,0,0
			send {Alt Down}
			sleep 500
			click 1155, 920 ; Disable Auto Attack
			sleep 500
			send {Alt Up}
			sleep 1000
			send {escape}
			sleep 2000
			
			click 1665, 630 ;Settings
			Search("Unstuck.png","1080","130","1730","330","Unstuck", 30)
			click %FoundX%, %FoundY% ;Unstuck
			sleep 1500
			click 1265, 585 ;OK
			sleep 8000
			send {escape}
			sleep 1000
			SendInput, {w DownR} ;Go forward
			sleep 6000
			send {space}
			sleep 1000
			send {space}
			sleep 8500
			SendInput, {w Up}
			send f
			Search("OK.png","1105","520","1415","630","OK", 30)
			click %FoundX%, %FoundY% ;OK
			sleep 2000
			SendInput, {w DownR}
			sleep 200
			send {space}
			sleep 1000
			SendInput, {w Up}
			send f
			sleep 3000
			send {escape}
			sleep 1000
			click 270,70 ;Exit
			Loop, 5 {
				ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 Ok.png
				If (ErrorLevel=0) {
					click %FoundX%, %FoundY%
				}
				Else {
					sleep 500
				}
			}
			sleep 1000
			gtfo = 1
	}
return