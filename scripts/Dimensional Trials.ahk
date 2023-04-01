Matrix = 0

lowVit = 0


SetTimer, Focus, 30000, On

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
send 3
sleep 100
send {Alt Up} ;DUAL SWORDS
sleep 1500
click 103, 515 ;Select
sleep 1000
click 1060, 565 ;Dimensional Trials
; sleep 3000
; ImageSearch, FoundX, FoundY, 940, 685, 1170, 775, *50 Insufficient.png
; If (ErrorLevel=0) {
	; Tooltip, Found Insufficient Vitality,0,0
	; send {Esc}
	; sleep 1000
	; send {Esc}
	; break
; }

; Loop, 2 {
	; click 975, 600 left, down
	; sleep 250
	; mousemove 745, 600
	; sleep 250
	; mousemove 545, 600
	; sleep 250
	; mousemove 345, 600
	; sleep 250
	; mousemove 145, 600
	; sleep 250
	; click left, up
	; sleep 1000
; }
; click 860, 605 ;Difficulty 5
; sleep 500
If (Matrix = 1) {
	click 680, 505 ;Matrix Drill
	sleep 1000
}

Search("Go.png","1355","720","1615","835","Go", 30)
click %FoundX%, %FoundY% ;Go
sleep 2000

Search("QuickBattle.png","380","590","680","700","Quick Battle", 30)
click %FoundX%, %FoundY% ;Quick Battle
sleep 4000

Loop, 4
{
	send {escape}
	sleep 1000
}


; ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 img/Purchase.png
; If (ErrorLevel=0) {
	; Tooltip, Low vitality,0,0
	; lowVit = 1
	; click 655, 580 ;Continue
; }

; Search("Match.png","1135","520","1360","630","Match", 30)
; click %FoundX%, %FoundY% ;Match
; Search("Approve.png","885","445","1480","800","Approve", 300)
; click %FoundX%, %FoundY% ;Approve
; If (lowVit = 1) {
	; Tooltip, Continue (low vitality),0,0
	; sleep 1000
	; click 655, 580 ;Continue
; }

; Loop {
	; Tooltip, Searching for Approve or Loading screen,0,0
	; ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png
		; If (ErrorLevel=0) {
			; Tooltip, Found Approve,0,0
			; click %FoundX%, %FoundY%
			; If (lowVit = 1) {
				; Tooltip, Continue (low vitality),0,0
				; sleep 1000
				; click 655, 580 ;Continue
			; }
		; }
		; Else {
			; sleep 500
		; }
		
		; ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go.png
		; If (ErrorLevel=0) {
			; click %FoundX%, %FoundY%
		; }

		; ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		; If (ErrorLevel=0) {
			; Tooltip, Loading screen found,0,0
			; break
		; }
		; Else {
			; sleep 500
		; }
; }
; Loop {
	; ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		; If (ErrorLevel=0) {
			; Tooltip, Loading screen found,0,0
			; sleep 500
		; }
		; Else {
			; Tooltip, Loading screen not found,0,0
			; sleep 2000
			; send {Alt Down}
			; sleep 500
			; click 1155, 920 ; Auto Attack
			; send {Alt Up}
			; break
		; }
; }
