;V4	Reset camera using selfie after each death

Loop {
	gtfo = 0
	dead= 0
	team = blue
	
	Loop {
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
	sleep 1500
	click 240, 585 ;Challenge
	sleep 1000
	Loop {
		Tooltip, Searching for Critical Abyss,0,0
		ImageSearch, FoundX, FoundY, 350, 180, 1655, 330, *50 img/TheCriticalAbyss.png
		If (ErrorLevel = 0) {
			MouseMove %FoundX%, %FoundY%
			sleep 1000
			click 110, 570, relative
			sleep 1000
			mousemove 990, 170
			sleep 2000
			break
		}
		Else {
			Loop, 2 {
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
		}
		mousemove 1005, 150 ;Blank space
		sleep 1000
	}
	
	Tooltip, Searching for Go,0,0
	Search("Go.png","1355","720","1615","835","Go", 30)
	click %FoundX%, %FoundY%
	
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			break
		}
		ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY%
		}
		ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go_Hover.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY%
		}
		sleep 500
	}
	
	Loading:
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			sleep 250
		}
		Else {
			Tooltip, Loading screen not found,0,0
			sleep 500
			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
			If (ErrorLevel=0)
				goto Loading
			Else {
				break
			}
		}
	}

	Tooltip, Waiting,0,0
	loopCount1 = 0
	Loop, 20 {
		Tooltip, Waiting %loopCount1%,0,0
		sleep 1000
		loopCount1++
	}

	Move:
	Tooltip, Moving,0,0
	dead=0
	SetTimer, endCheck, 2000, On
	send r
	SendInput, {w DownR}
	sleep 7500
	send 2 ;jetpack========================================================
	sleep 1500
	Loop, 3 {
		sleep 2000
		send {space}
		sleep 2000
		send {shift}
		sleep 500
		send 2 ;jetpack========================================================
	}
	sleep 2000
	Loop, 2 {
		send {shift}
		sleep 500
		send 2 ;jetpack========================================================
		sleep 2000
	}
	send {shift}
	sleep 2000
	SendInput, {w Up}
	send {shift}
	
	Loop { ;Fight
		Tooltip, Floating,0,0
		Loop, 3 {
			send r1 ;Change this to Lin and skill=======================================================================================================================
			sleep 200
		}
		sleep 1000
		send {Space}
		click left, down
		sleep 100
		click left, up
		sleep 900
		send {Space}
		sleep 500
		Loop, 75 {
			Tooltip, Attacking,0,0
			click left, down
			sleep 150
			click left, up
			sleep 150
			; send r{Tab}
			If (gtfo = 1) {
				break, 2
			}
			If (dead = 1) {
				goto Move
			}
		}	
		Tooltip, Healing,0,0
		Loop, 12 {
			send q ;Change to a different weapon ============================================================================================================
			sleep 100
			send 1 ;Change to skill =========================================================================================================================
			sleep 100
			click left, down
			sleep 100
			click left, up
			If (gtfo = 1) {
				break, 2
			}
			If (dead = 1) {
				goto Move
			}	
		}
		send {shift}
		sleep 500
	}
}	

endCheck:
PixelGetColor, p1, 19, 62
PixelGetColor, p2, 20, 63
PixelGetColor, p3, 21, 64
If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
	Tooltip, Channel blue dot found,0,0
	SetTimer, endCheck, delete
	gtfo = 1
}
ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead.png
If (ErrorLevel=0) {
	Tooltip, Dead,0,0
	dead = 1
}
ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead_2.png
If (ErrorLevel=0) {
	Tooltip, Dead,0,0
	dead = 1
}
If (dead = 1)
{
	click down, m
	sleep 100
	click up, m
}
return