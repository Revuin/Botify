Loop {
	Loop {
		Tooltip, Searching for Approve or Loading screen,0,0
		ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png
			If (ErrorLevel=0) {
				Tooltip, Found Approve,0,0
				click %FoundX%, %FoundY%
				sleep 2000
				ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 img/Purchase.png
				If (ErrorLevel=0) {
					Tooltip, Low vitality,0,0
					lowVit = 1
					click 655, 580 ;Continue
				}
				; Loop, 5 {
					; SoundBeep, 300,500
					; SoundBeep, 500,500
					; SoundBeep, 1000,500
				; }
				; ExitApp

			}
			Else {
				sleep 500
			}

			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				break
			}
			Else {
				sleep 500
			}
	}
	Loop {
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
			If (ErrorLevel=0) {
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else {
				Tooltip, Loading screen not found,0,0
				sleep 2000
				break
			}
	}
				send {Alt Down}
				sleep 500
				click 1155, 920 ; Auto Attack
				send {Alt Up}
}