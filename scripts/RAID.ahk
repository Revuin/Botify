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
click 105, 665 ;Challenge
sleep 2000
click 1030, 850 ; Raid
sleep 3000


If (raid == 1)
{
	click 1530, 595 ;Shattered Realm
}
Else if (raid == 2)
{
	click 150, 340 ;Battle Test Area (tab)
	sleep 2000
	click 865, 425 ;Battle Test Area
}
Else
{
	click 150, 455 ; Ring of Oblivion (tab)
	sleep 2000
	click 1005, 495 ;Ring of Oblivion
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

; Tooltip, Press F6 near boss to start attacking,0,0 
; KeyWait, F6, D 
Loop
{
	; #IncludeAgain scripts/Attack Loop.ahk
	
	ImageSearch, FoundX, FoundY, 680, 680, 800, 710, *5 *Transf24fff img/Rewards_JO.png
	If (Errorlevel = 0)
	{
		Tooltip, Found Rewards screen,0,0
		raid++
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
	
	sleep 500
}