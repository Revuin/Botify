usePot = 0

gtfo = 0
battle = 0
lowVit = 0
foundChest = 0

Loop {
	Tooltip, Searching for Channel blue dot,0,0
	PixelGetColor, p1, 19, 62
	PixelGetColor, p2, 20, 63
	PixelGetColor, p3, 21, 64
	If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
		Tooltip, Channel blue dot found,0,0
		sleep 2000
		break
	}
	Else
		sleep 500
}

send b ;Use Joint Supply chips
sleep 6000
Loop, 5
{
	ImageSearch, FoundX, FoundY, 1150, 100, 1765, 725, *30 img/JointSupplyChip.png
	If (ErrorLevel=0)
	{
		click %FoundX%, %FoundY% ;Joint Supply Chip
		Search("Use_Backpack.png","1250","125","1365","180","Use (Backpack)", 30)
		sleep 500
		click %FoundX%, %FoundY% ;Use (Backpack)
		sleep 1000
	}
	Else
	{
		click 1580, 780 ; Next page
		sleep 1000
	}
}
click 55, 55 ;<
sleep 2000

send {Alt down}
sleep 100
send 3
sleep 100
send {Alt Up} ;DUAL SWORDS
sleep 1500
click 105, 515	 ;Select
sleep 1000
click 545, 500 ; Joint Operation
sleep 1000
click 250, 965 ;Carnival Party
sleep 2000
click 195, 540 ;Difficulty 4
sleep 1000

Tooltip, Searching for Go,0,0
Loop {
	ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go.png
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

sleep 2000
Tooltip, Searching for Purchase,0,0
ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 img/Purchase.png
If (ErrorLevel=0) {
		Tooltip, Found Purchase,0,0
		lowVit = 1
	If (usePot = 1) {
		click %FoundX%, %FoundY% ;Purchase
		Search("Use.png","465","660","760","810","Use", 30)
		click %FoundX%, %FoundY% ;Use
		sleep 500
		send {escape}
		Tooltip, Searching for Go,0,0
		Loop {
			ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go.png
			If (ErrorLevel=0) {
				click %FoundX%, %FoundY% ;Go
				break
			}
			ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go_2.png
			If (ErrorLevel=0) {
				click %FoundX%, %FoundY% ;Go
				break
			}
			ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go_3.png
			If (ErrorLevel=0) {
				click %FoundX%, %FoundY% ;Go
				break
			}
			ImageSearch, FoundX, FoundY, 1545, 885, 1880, 1015, *50 img/Go_4.png
			If (ErrorLevel=0) {
				click %FoundX%, %FoundY% ;Go
				break
			}
			sleep 500
		}
	}
	Else {
		sleep 1000
		click 655, 580 ;Continue
	}
}
sleep 2000
ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 img/Purchase.png
If (ErrorLevel=0) {
	lowVit = 1
	sleep 1000
	click 655, 580 ;Continue
}
Search("Match.png","1135","520","1360","630","Match", 30)
click %FoundX%, %FoundY% ;Match
Search("Approve.png","885","445","1480","800","Approve", 90000)
click %FoundX%, %FoundY% ;Approve
If (lowVit = 1) {
	Tooltip, Continue (low vitality),0,0
	sleep 1000
	click 655, 580 ;Continue
}

Loop {
	Tooltip, Searching for Approve or Loading screen,0,0
	ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png
	If (ErrorLevel=0) {
		Tooltip, Found Approve,0,0
		click %FoundX%, %FoundY%
		If (lowVit = 1) {
			Tooltip, Continue (low vitality),0,0
			sleep 2000
			click 655, 580 ;Continue
		}
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
Loading_JO:
Loop {
	ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
	If (ErrorLevel=0) {
		Tooltip, Loading screen found,0,0
		sleep 250
	}
	Else {
		Tooltip, Loading screen not found,0,0
		sleep 500
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		If (ErrorLevel=0)
			goto Loading_JO
		Else {
			sleep 1000
			break
		}
	}
}

Tooltip, Move forward,0,0
SendInput, {w DownR}
sleep 7000
SendInput, {w Up}

Loop {
	#IncludeAgain scripts/Attack Loop.ahk
	
	ImageSearch, FoundX, FoundY, 680, 680, 810, 715, *10 *Transf24fff img/Rewards_JO.png
	If (Errorlevel = 0)
	{
		Tooltip, Found Reward End,0,0
		ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead.png
		If (ErrorLevel=0)
		{
			Tooltip, Dead,0,0
			sleep 10000
			click 1595, 905
			sleep 2000
		}
		ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead_2.png
		If (ErrorLevel=0)
		{
			Tooltip, Dead_2,0,0
			sleep 10000
			click 1595, 905
			sleep 2000
		}
		break
	}
	Else
	{
		Tooltip, Reward End not found,0,0
		sleep 500
	}
	
	ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead.png
	If (ErrorLevel=0)
	{
		Tooltip, Dead,0,0
		sleep 10000
		click 1595, 905
		sleep 2000
		sendInput {W DownR}
		sleep 3000
		sendInput {W Up}
	}
	ImageSearch, FoundX, FoundY, 770, 490, 900, 545, *20 img/Dead_2.png
	If (ErrorLevel=0)
	{
		Tooltip, Dead_2,0,0
		sleep 10000
		click 1595, 905
		sleep 2000
		sendInput {W DownR}
		sleep 3000
		sendInput {W Up}
	}
}
click 980, 1000 ;Blank
sleep 1000
click 980, 1000 ;Blank
sleep 1000
Tooltip, Unstuck,0,0 ;Attempt #1 ===========================================
send {escape}
sleep 2000
click 1665, 630 ;Settings
Search("Unstuck.png","1080","130","1730","330","Unstuck", 30)
click %FoundX%, %FoundY% ;Unstuck
sleep 1500
click 1265, 585 ;OK
sleep 8000
send {escape}
send {w DownR}
sleep 6000
send {a DownR}
sleep 200
send {a Up}
sleep 2000
send {w up}
sleep 1500
Loop, 3
{
	send f
	sleep 500
	send {w DownR}
	sleep 100
	send {w Up}
	sleep 100
}
sleep 2000
Loop, 5
{
	ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/Ok.png
	If (ErrorLevel=0)
	{
		Tooltip, Found chest,0,0
		click %FoundX%, %FoundY% ;OK
		sleep 3000
		foundChest = 1
		break
	}
}

If (foundChest = 0)
{
	Tooltip, Chest not found - trying again,0,0 ;Attempt #2 ===============================================
	send {escape}
	sleep 2000
	click 1665, 630 ;Settings
	Search("Unstuck.png","1080","130","1730","330","Unstuck", 30)
	click %FoundX%, %FoundY% ;Unstuck
	sleep 1500
	click 1265, 585 ;OK
	sleep 8000
	send {escape}
	send {w DownR}
	sleep 5000
	send {d DownR}
	sleep 700
	send {d Up}
	sleep 2000
	send {w up}
	sleep 2000
	Loop, 3
	{
		send f
		sleep 500
		send {w DownR}
		sleep 100
		send {w Up}
		sleep 100
	}
	sleep 2000
	Loop, 5
	{
		ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/Ok.png
		If (ErrorLevel=0)
		{
			Tooltip, Found chest,0,0
			click %FoundX%, %FoundY% ;OK
			sleep 3000
			foundChest = 1
			break
		}
	}
	
	; If (foundChest = 0)
	; {
		; Tooltip, Cannot find chest. Go to chest and press F,0,0
		; KeyWait, F, D
		; Search("OK.png","1105","520","1415","630","OK", 30)
		; click %FoundX%, %FoundY% ;OK
		; sleep 3000
	; }
}

SendInput, {w DownR}
sleep 200
send {space}
sleep 1000
SendInput, {w Up}
send f
sleep 3000
send {escape}
sleep 1000
click 270,70 ;Exit
Loop, 5 {
	ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/Ok.png
	If (ErrorLevel=0) {
		click %FoundX%, %FoundY%
		sleep 3000
	}
	Else {
		sleep 500
	}
}

; PixelSearch px, py, 310, 140, 465, 290, 0xFFFFFF, 0 
; If (ErrorLevel=0) {
	; Tooltip, At least 1 player still in-game,0,0
	; sleep 500
; }
; Else {
	; Tooltip, Everyone left - Exiting,0,0
	; send {escape}
	; sleep 1000
	; click 270,70 ;Exit
	; sleep 2000
	; ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/Ok.png
	; If (ErrorLevel=0) {
		; click %FoundX%, %FoundY%
	; }
	; goto start
; }