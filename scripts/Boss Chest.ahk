Loop {
	If WinActive("ahk_class UnrealWindow") {
		Tooltip, pressing F,0,0
		send f
		sleep 1000
		ImageSearch, FoundX, FoundY, 1175, 700, 1335, 835, *50 PerfectDecipher.png
		If (ErrorLevel = 0) {
			Tooltip, use perfect decipher,0,0
			Mousemove %FoundX%, %FoundY% ;Open
			sleep 500
			mouseclick ,,100,0,,,,R
			break
		}
		Else {
			Tooltip, chest not avaiable yet,0,0
		}
		ImageSearch, FoundX, FoundY, 1175, 700, 1335, 835, *50 PerfectDecipher_2.png
		If (ErrorLevel = 0) {
			Tooltip, use perfect decipher,0,0
			Mousemove %FoundX%, %FoundY% ;Open
			sleep 500
			mouseclick ,,100,0,,,,R
			break
		}
		Else {
			Tooltip, chest not avaiable yet,0,0
		}
		ImageSearch, FoundX, FoundY, 1725, 860, 1795, 925, *20 Respawn.png
		If (ErrorLevel = 0) {
			Tooltip, Dead,0,0
			click %FoundX%, %FoundY% ;Respawn
			Loop, 3 {
				SoundBeep, 300,500
				SoundBeep, 500,500
				SoundBeep, 1000,500
			}
			sleep 2000
		}
	}
}