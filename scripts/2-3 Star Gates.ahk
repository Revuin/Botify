booster = 1
nanofiber = 1
disconnected = 0

SetTimer, Disconnect,5000,On

Loop {
	boosterVar = 85
	starsX1 = 0
	starsY1 = 0

	Loop {
		If (booster = 1) {
			ImageSearch, BoosterX, BoosterY, 335, %boosterVar%, 915, 950, *50 *Transf24fff Booster_Frame.png ;Search the entire window for Booster icon
			If (ErrorLevel = 0) { ;If found, search for 3 stars in the line above
				ToolTip, Found Booster Frame,0,0
				mousemove %BoosterX%, %BoosterY%
				boosterVar := BoosterY+5 ;Shrink the search
				sleep 500

				starsX1 := BoosterX - 265
				starsY1 := BoosterY - 50
				
				starsX2 := BoosterX + 215
				starsY2 := BoosterY + 15
				

				ImageSearch, FoundX, FoundY, %starsX1%, %starsY1%, %starsX2%, %starsY2%, *5 *TransWhite 2Stars.png ;Search for 2 stars in the line above
				If (ErrorLevel = 0) {
					ToolTip, Found 3 stars,0,0
					mousemove %FoundX%, %FoundY%
					sleep 500
					Tooltip, Click Join Team,0,0
					mousemove %BoosterX%, %BoosterY%
					sleep 500
					click 15, 35, relative
					sleep 100
					click -100, 0, relative
					sleep 100
					click -100, 0, relative
					sleep 100
					click -100, 0, relative
					sleep 2000
			
				}
				Else {
					Tooltip, 3 stars not found,0,0
					sleep 500
				}
			}
			Else {
				Tooltip, Booster Frame not found,0,0
				boosterVar := 85
				sleep 500
			}
		}
		
		If (nanofiber = 1) {
			ImageSearch, NanoX, NanoY, 335, %NanoVar%, 915, 950, *50 *Transf24fff Nanofiber.png ;Search the entire window for Booster icon
			If (ErrorLevel = 0) { ;If found, search for 3 stars in the line above
				ToolTip, Found Nanofiber Frame,0,0
				mousemove %NanoX%, %NanoY%
				NanoVar := NanoY+5 ;Shrink the search
				sleep 500

				starsX1 := NanoX - 265
				starsY1 := NanoY - 50
				
				starsX2 := NanoX + 215
				starsY2 := NanoY + 15
				

				ImageSearch, FoundX, FoundY, %starsX1%, %starsY1%, %starsX2%, %starsY2%, *5 *TransWhite 2Stars.png ;Search for 2 stars in the line above
				If (ErrorLevel = 0) {
					ToolTip, Found 3 stars,0,0
					mousemove %FoundX%, %FoundY%
					sleep 500
					Tooltip, Click Join Team,0,0
					mousemove %NanoX%, %NanoY%
					sleep 500
					click 15, 35, relative
					sleep 100
					click -100, 0, relative
					sleep 100
					click -100, 0, relative
					sleep 100
					click -100, 0, relative
					sleep 2000
			
				}
				Else {
					Tooltip, 3 stars not found,0,0
					sleep 500
				}
			}
			Else {
				Tooltip, Nanofiber not found,0,0
				NanoVar := 85
				sleep 500
			}
		}

		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 Approve.png
		If (ErrorLevel=0) {
			Tooltip, Found Approve,0,0
			click %FoundX%, %FoundY%
		}
		Else {
			Tooltip, Approve not found,0,0
			sleep 500
		}

		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 Loading.png
		If (ErrorLevel=0) {
			Tooltip, Loading screen found,0,0
			break
		}
		Else {
			Tooltip, Loading screen not found,0,0
			sleep 500
		}
		
		If (disconnected = 1) {
			Tooltip, Opening recruit chat,0,0
			disconnected = 0
			Goto Chat
		}
		
	}

	Loading_Gate:
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
				goto Loading_Gate
			Else {
				Tooltip, Loading screen not found,0,0
				break
			}	
		}
	}
	sleep 8000
	send {Alt Down}
	sleep 500
	click 1155, 920 ; Auto Attack
	send {Alt Up}

	WinClose ahk_class UnrealWindow ;Reopen the game
	Search("Launch.png","15","725","375","850","Launch button", 200)
	sleep 1000
	Search("Launch.png","15","725","375","850","Launch button", 200)
	click %FoundX%, %FoundY%
	Search("CloseX.png","1690","170","1790","270","Close Button", 300)
	click %FoundX%, %FoundY%
	sleep 500
	click 940, 530 ;Login
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
	send {Enter}
	sleep 2000
	Search("Recruit.png","15","550","180","630","Recruit", 30)
	click %FoundX%, %FoundY%	
}

Chat:
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
send {Enter}
sleep 2000
Search("Recruit.png","15","550","180","630","Recruit", 30)
click %FoundX%, %FoundY%	
return

Disconnect:
PixelGetColor, p1, 577, 466
PixelGetColor, p2, 594, 463
PixelGetColor, p3, 825, 469
PixelGetColor, p4, 1138, 470
PixelGetColor, p5, 1343, 476
If (p1=0x000000 and p2=0x000000 and p3=0x000000 and p4=0x000000 and p5=0x000000) {
	Tooltip, Disconnect found,0,0
	disconnected = 1
	sleep 1000
	ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 OK_Disconnect.png
	If (ErrorLevel = 0) {
		Tooltip, OK found,0,0
		click %FoundX%, %FoundY%
	}
	ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 OK_Disconnect_2.png
	If (ErrorLevel = 0) {
		Tooltip, OK_2 found,0,0
		click %FoundX%, %FoundY%
	}
}
return