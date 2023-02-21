stage = 1

Loop
{
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
	}
	Search("SequentialPhantasm.png","100","485","220","605","SequentialPhantasm", 30)
	sleep 500
	click %FoundX%, %FoundY% ;SequentialPhantasm
	sleep 1000

	If (stage = 2)
	{
		click 715, 455 ;Stage 2
	}
	Else if (stage = 3)
	{
		click 955, 455 ;Stage 3
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

	Search("Start_Challenge.png","1465","830","1755","945","Start_Challenge", 30)
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
}