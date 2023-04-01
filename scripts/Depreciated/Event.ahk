Loop {
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

	Search("HalfAnniversary.png","0","1000","1725","1065","HalfAnniversary", 30)
	click %FoundX%, %FoundY%
	
	Search("FruitBarrage.png","1440","405","1680","660","FruitBarrage", 30)
	click %FoundX%, %FoundY%
	sleep 1000
	
	Search("Match_Anniversary.png","1205","780","1430","980","Match_Anniversary", 30)
	click %FoundX%, %FoundY%

	Loop {
			Tooltip, Searching for Loading screen,0,0
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
				If (ErrorLevel=0) {
					Tooltip, Loading screen found,0,0
					break
				}
				Else {
					sleep 500
				}
	}
	Loading_Anniversary:
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else {
				Tooltip, Loading screen not found,0,0
				sleep 500
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
					If (ErrorLevel=0) {
						sleep 500
						goto Loading_Anniversary
					}
					Else
						break
			}
	}
	start := A_Now
	Loop, 40
	{
		end := A_Now
		end -= start, Seconds
		Tooltip, Waiting %end%/40,0,0
		sleep 1000
	}
	
	Tooltip, Exiting,0,0
	send {Alt Down}
	sleep 1000
	click 270,70 ;Exit
	sleep 500
	send {Alt Up}
	Loop, 5 {
		ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/Ok.png
		If (ErrorLevel=0) {
			click %FoundX%, %FoundY%
		}
		Else {
			sleep 500
		}
	}
}