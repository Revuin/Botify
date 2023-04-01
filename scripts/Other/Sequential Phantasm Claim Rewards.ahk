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
Search("Challenge.png","165","545","330","625","Challenge", 30)
sleep 500
click %FoundX%, %FoundY% ;Challenge

Loop
{
	ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/Bygone_Phantasm.png
	If (ErrorLevel = 0)
	{
		Tooltip, Found Bygone_Phantasm,0,0
		MouseMove %FoundX%, %FoundY%
		sleep 1000
		click 110, 570, relative
		sleep 2000
		break
	}
	
	ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/Bygone_Phantasm_2.png
	If (ErrorLevel = 0)
	{
		Tooltip, Found Bygone_Phantasm_2,0,0
		MouseMove %FoundX%, %FoundY%
		sleep 1000
		click 110, 570, relative
		sleep 2000
		break
	}
	
	Tooltip, Bygone Phantasm not found,0,0
	sleep 1000
	click 840,830 ;Claim Ranking Rewards
	sleep 4000
}
click 170, 580 ;SequentialPhantasm
sleep 1000
Tooltip, Claiming Rewards,0,0
Loop, 6
{
	click 1474, 845 ;Claim
	sleep 2000
	click 1000, 1000 ;Blank
}
click 55, 55 ;<
sleep 2000
click 55, 55 ;<
sleep 2000