;V5 Added reconnect and relaunch
;V6 Move right a bit when activating switch
;V7 Run as admin and get game file location
;V8 Detect if Auto is enabled
;V9 Search for skip or blue channel dot instead of skip only. Simplified assist checkbox checking

gtfo = 0
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
send 3
sleep 100
send {Alt Up} ;DUAL SWORDS
sleep 1500
click 110, 670 ;Challenge
sleep 2000
click 1040, 235 ; Frontier Clash

Tooltip, Searching for Go,0,0
Search("Go.png","1355","720","1615","835","Go", 30)
click 1565, 610 ;Hard
sleep 1000
Search("Go.png","1355","720","1615","835","Go", 30)
click %FoundX%, %FoundY% ;Go
Tooltip, Searching for Match,0,0
Search("Match.png","1135","520","1360","630","Match", 30)
click %FoundX%, %FoundY% ;Match
sleep 3000

Loop {

	ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png ;Search for Approve
	If (ErrorLevel=0) 
	{
		Tooltip, Found Approve,0,0
		click %FoundX%, %FoundY% ;Approve
	}

	sleep 200
	
	Tooltip, Searching for Go,0,0
	ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go.png
	If (ErrorLevel=0) 
	{
		Tooltip, Found Go,0,0
		click %FoundX%, %FoundY% ;Go
	}
	sleep 200
	
	Tooltip, Searching for Go_FC_2,0,0
	ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go_FC_2.png
	If (ErrorLevel=0) 
	{
		Tooltip, Found Go_FC_2,0,0
		click %FoundX%, %FoundY% ;Go
	}
	sleep 200
	
	Tooltip, Searching for Match,0,0
	ImageSearch, FoundX, FoundY, 1135, 520, 1360, 630, *30 img/Match.png
	If (ErrorLevel=0) 
	{
		Tooltip, Found Match,0,0
		click %FoundX%, %FoundY% ;Match
	}

	sleep 200
	
	Tooltip, Searching for Loading screen,0,0
	ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
	If (ErrorLevel=0) {
		Tooltip, Loading screen found,0,0
		break
	}
	sleep 200
}

Loading_FCH:
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
			goto Loading_FCH
		Else {
			break
		}
	}
}


sleep 15000
send {Alt Down}
sleep 500
click 1155, 920 ; Auto Attack
send {Alt Up}
AutoRepeat("w", 2500) ;Walk
AutoRepeat("a", 2000) ;Walk
sleep 500
send f
AutoRepeat("w", 600) ;Walk
sleep 500
send f
AutoRepeat("d", 100) ;Walk
AutoRepeat("w", 600) ;Walk
sleep 500
send f

Loop {
	ImageSearch, FoundX, FoundY, 1135, 910, 1185, 940, *100 *TransBlack img/Auto_On.png
	If (ErrorLevel = 0) {
		Tooltip, Found Auto On,0,0
		break
	}
	Else {
		Tooltip, Enable Auto,0,0
		send {Alt Down}
		sleep 500
		click 1155, 920 ; Auto Attack
		send {Alt Up}
	}
	sleep 500
}

n=0
start := A_Now

Loop {
	If WinActive("ahk_class UnrealWindow") {
		Tooltip, Spam weapon,0,0
		send rf

		end := A_Now
		end -= start, Seconds
		
		If (end >= 3) {
			Tooltip, Search for Channel blue dot,0,0
			start := A_Now
			PixelGetColor, p1, 19, 62
			PixelGetColor, p2, 20, 63
			PixelGetColor, p3, 21, 64
			If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
				Tooltip, Channel blue dot found,0,0
				sleep 5000
				break
			}
			sleep 500
		}
	}
}