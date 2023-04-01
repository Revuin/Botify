Loop
{
	Tooltip, Searching for Channel blue dot,0,0
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
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
sleep 1000
click 100, 665 ;Challenge
sleep 2000
click 520, 300 ;Bygone Phantasm
sleep 3000
click 170, 580 ;SequentialPhantasm
sleep 1000

If (stage = 2)
{
	click 620, 460 ;Stage 2
}
Else if (stage = 3)
{
	click 810, 460 ;Stage 3
}
Else if (stage = 4)
{
	click 990, 460 ;Stage 4
}

Search("SneakIntoMind.png","1380","905","1720","1020","SneakIntoMind", 30)
sleep 500
click %FoundX%, %FoundY% ;SneakIntoMind


Loop 
{
	Tooltip, Searching for Approve or Loading screen,0,0
	ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png
	If (ErrorLevel=0) 
	{
		Tooltip, Found Approve,0,0
		click %FoundX%, %FoundY%
	}
	Else 
		sleep 500

	ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
	If (ErrorLevel=0) 
	{
		Tooltip, Loading screen found,0,0
		break
	}
	Else 
		sleep 500
}

Loading_Sequential:
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
			goto Loading_Sequential
		Else
			break
	}
}

Tooltip, Waiting 10 seconds,0,0
sleep 10000
Tooltip, Moving forward,0,0
SendInput, {w DownR}
sleep 4000
SendInput, {w Up}
Loop, 5
{
	send f
	SendInput, {w DownR}
	sleep 200
	SendInput, {w Up}
}

Search("Start_Challenge.png","1500","775","1815","895","Start_Challenge", 30)
click %FoundX%, %FoundY% ;Start Challenge
sleep 4000

Loop ;Manual attack
{
	Tooltip, Searching for Leave or Channel blue dot,0,0
	ImageSearch, FoundX, FoundY, 615, 845, 960, 970, *30 img/Leave.png
	If (ErrorLevel=0) 
	{
		click %FoundX%, %FoundY% ;Leave
		break
	}
	
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
		break
	}

	#IncludeAgain scripts/Attack Loop.ahk
	
	Tooltip, Searching for Leave or Channel blue dot,0,0
	ImageSearch, FoundX, FoundY, 615, 845, 960, 970, *30 img/Leave.png
	If (ErrorLevel=0) 
	{
		click %FoundX%, %FoundY% ;Leave
		break
	}
	
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
		break
	}
}
stage++