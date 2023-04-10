Loop
{
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
	sleep 500
	click 1460, 50 ; Event Icon
	sleep 500
	send {Alt Up}
	sleep 2000
	click 1690, 550 ;Water Bomb Impact Go

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
	Loading_Event:
	Loop
	{
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
						goto Loading_Event
					}
					Else
						break
			}
	}
}