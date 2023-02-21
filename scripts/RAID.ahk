raid = 3

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
	Search("Challenge.png","165","545","330","625","Challenge", 30)
	click %FoundX%, %FoundY% ;Challenge
	sleep 2000
	Loop {
		Tooltip, Searching for Raid,0,0
		ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/Raid.png
		If (ErrorLevel = 0) {
			MouseMove %FoundX%, %FoundY%
			sleep 1000
			click 110, 570, relative
			sleep 2000
			break
		}
		Else {
			Loop, 2 { ;Scroll to the right
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
			mousemove 1005, 150
			sleep 1000
			ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/Raid.png ;Search for Raid again
			If (ErrorLevel = 0) 
			{
				Tooltip Found Raid,0,0
				MouseMove %FoundX%, %FoundY%
				sleep 1000
				click 110, 570, relative
				sleep 1000
				mousemove 990, 170
				sleep 2000
				break
			}
			Loop, 2 { ;Scroll to the left
				click 730, 270 left, down
				sleep 150
				mousemove 930, 270
				sleep 150
				mousemove 1130, 270
				sleep 150
				mousemove 1330, 270
				sleep 150
				mousemove 1530,270
				click left, up
				sleep 150
			}
			mousemove 1005, 150
			sleep 1000
			ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/Raid.png ;Search for Raid again
			If (ErrorLevel = 0) 
			{
				Tooltip Found Raid,0,0
				MouseMove %FoundX%, %FoundY%
				sleep 1000
				click 110, 570, relative
				sleep 1000
				mousemove 990, 170
				sleep 2000
				break
			}
		}
	}
	If (raid = 1)
	{
		click 1050, 330 ;Pantasmic Zenith
	}
	Else if (raid = 2)
	{
		click 1530, 595 ;Shattered Realm
	}
	Else
	{	click 150, 340 ;Battle Test Area (tab)
		sleep 2000
		click 865, 425 ;Battle Test Area
	}

	Search("Hero.png","1185","220","1245","315","Hero", 30)
	click %FoundX%, %FoundY% ;Hero
	sleep 1000


	Tooltip, Searching for Go,0,0
	Loop {
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go_Raid.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY% ;Go
			break
		}
		Else {
			sleep 1000
		}
		ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go_2.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY% ;Go
			break
		}
		Else {
			sleep 1000
		}
	}

	Search("Match.png","1135","520","1360","630","Match", 30)
	click %FoundX%, %FoundY% ;Match

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

	Loading_Raid:
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
				goto Loading_Raid
			Else
				break
		}
	}

	Tooltip, Press F6 near boss to start attacking,0,0 
	KeyWait, F6, D 
	Loop
	{
		Tooltip, Weapon 2,0,0 ;Weapon 2
		Loop, 15
		{
			send e
			sleep 100
			send 1
			click left, down
			sleep 100
			click left, up
		}
		send {shift}
		sleep 500
		
		Tooltip, Weapon 1,0,0 ;Weapon 1
		Loop, 15
		{
		send q
		sleep 100
		send 1
		click left, down
		sleep 100
		click left, up
		}
		send {shift}
		sleep 500

		Tooltip, Weapon 3 jump,0,0 ;Weapon 3
		send r
		sleep 500
		Loop, 10
		{
			send r1
			sleep 100
			click left, down
			sleep 100
			click left, up
		}
		Loop, 4
		{
			send r1{Space}
			sleep 900
			click left, down
			sleep 100
			click left, up
		}
		
		Tooltip, Weapon 3,0,0
		Loop, 70 {
			send r23{Tab}
			sleep 100
			click left, down
			sleep 100
			click left, up
			sleep 100
		}
		
		ImageSearch, FoundX, FoundY, 680, 680, 800, 710, *Transf24fff img/Rewards_JO.png
		If (Errorlevel = 0)
		{
			Tooltip, Found Rewards screen,0,0
			click 980, 1000 ;Blank
			sleep 1000
			click 980, 1000 ;Blank
			sleep 500
			send {escape}
			sleep 1000
			click 270,70 ;Exit
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
	
	raid++
	
	If (raid >= 4)
		Reload
}
