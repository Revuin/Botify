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
sleep 1500
click 110, 670 ;Challenge
sleep 2000
click 1020, 640 ; Void Abyss
sleep 4000

Search("Go.png","1355","720","1615","835","Go", 30)
click %FoundX%, %FoundY% ;Go
sleep 2000
Search("Match.png","1135","520","1360","630","Match", 30)
click %FoundX%, %FoundY% ;Match
Search("Approve.png","885","445","1480","800","Approve", 9000)
click %FoundX%, %FoundY% ;Approve

Loading_VR:
Loop 
{
	ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
	If (ErrorLevel=0) 
	{
		Tooltip, Loading screen found,0,0
		sleep 250
	}
	Else {
		Tooltip, Loading screen not found,0,0
		sleep 500
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		If (ErrorLevel=0)
			goto Loading_VR
		Else
			break
	}
}

sleep 3000
Loop
{
	send {Alt Down}
	sleep 1000
	click 1840, 65
	sleep 3000
	ImageSearch, FoundX, FoundY, 1040, 505, 1495, 660, *30 img/EnterAnyway.png
	If (ErrorLevel=0)
	{
		Tooltip, Enter Anyway found,0,0
		click %FoundX%, %FoundY% ;Enter Anyway
		break
	}
	Else
	{
		Tooltip, Enter Anyway not found,0,0
		sleep 500
		send {Alt Up}
	}
}
send {Alt Up}
sleep 60000
sendInput {w DownR}
sleep 3000
sendInput {a DownR}
sleep 1000
sendInput {a Up}
sendInput {w Up}
Loop
{
	#IncludeAgain scripts/Attack Loop.ahk
	
	Tooltip Searching for Rewards end screen,0,0
	ImageSearch, FoundX, FoundY, 680, 680, 800, 710, *5 *Transf24fff img/Rewards_JO.png
	If (Errorlevel = 0)
	{
		Tooltip, Found Reward End,0,0
		break
	}
	
	Tooltip, Searching for Channel blue dot,0,0
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
		sleep 3000
		break
	}
}