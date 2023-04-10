AppointedResearch = 1


Loop, 10 ;Check for Reward Recovery
{ 
	ImageSearch, FoundX, FoundY, 0, 730, 1910, 910, *50 img/Claim.png
	If (ErrorLevel = 0)
	{
		ToolTip, Found Reward recovery, 0,0
		click %FoundX%, %FoundY%
		sleep 2000
		click 980, 1000 ;Blank
		sleep 2000
	}
	Else
	{
	Tooltip, Reward Recovery not found,0,0
	sleep 1000
	}
}
click 980, 1200 ;Blank
sleep 2000

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

;Daily Box, Vitality solution ====================================================================
send {Alt down}
sleep 100
send 4
sleep 100
send {Alt Up} ;SHOP
sleep 2000
click 130, 303 ;Daily Supply Box
sleep 2000
click 770, 800 ;Claim
sleep 2000
click 980, 1000 ;Blank
sleep 2000
click 135, 390 ;Hot
sleep 2000
Search("Vitality_Solution.png","255","90","1860","980","Vitality_Solution", 90)
sleep 500
click %FoundX%, %FoundY% ;Vitality Potion
sleep 2000
click 1190, 830 ;Purchase
sleep 2000
click 980, 1000 ;Blank
sleep 2000

If A_DDDD = Monday
{
	click 1090, 930, Left, Down ;Scroll down
	sleep 150
	mousemove 1090, 700
	sleep 150
	mousemove 1090, 500
	sleep 150
	mousemove 1090, 300
	sleep 150
	mousemove 1090, 210
	sleep 150
	click, left, up
	sleep 1000

	Search("BoosterModule_Hot.png","255","90","1860","980","BoosterModule_Hot", 90)
	sleep 500
	click %FoundX%, %FoundY% ;BoosterModule_Hot
	sleep 2000
	click 1440, 660 ;Right arrow for max items
	sleep 1000
	click 1190, 830 ;Purchase
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	
	click 1090, 930, Left, Down ;Scroll down
	sleep 150
	mousemove 1090, 700
	sleep 150
	mousemove 1090, 500
	sleep 150
	mousemove 1090, 300
	sleep 150
	mousemove 1090, 210
	sleep 150
	click, left, up
	sleep 1000

	Search("AdvancementModule_Hot.png","255","90","1860","980","AdvancementModule_Hot", 90)
	sleep 500
	click %FoundX%, %FoundY% ;AdvancementModule_Hot
	sleep 2000
	click 1440, 660 ;Right arrow for max items
	sleep 1000
	click 1190, 830 ;Purchase
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
}

click 55, 55 ;<
sleep 2000

;Activities, Mia's Kitchen, Daily Bounty ====================================================================
send {Alt down}
sleep 100
send 3
sleep 100
send {Alt Up} ;DUAL SWORDS
sleep 2000

Loop, 20 { ;Claim weekly activities
ImageSearch, FoundX, FoundY, 790, 390, 1815, 885, *100 img/Claim_Weekly.png
	If ErrorLevel = 0
	{
		ToolTip, Found X, 0,0
		click %FoundX%, %FoundY%
		sleep 500
	}
	Else
	{
		Tooltip, Claim_Weekly not found,0,0
		sleep 500
	}
}

If A_DDDD = Saturday
{
	Loop, 20 {
		click 860, 500 ;Claim (Individual Weekly)
		sleep 500
	}
	click 640, 260 ; Weekly 1
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 820, 270 ; Weekly 2
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 1000, 265 ; Weekly 3
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 1180, 265 ; Weekly 4
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 1360, 260 ; Weekly 5
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
	click 1540, 265 ; Weekly 6
	sleep 2000
	click 980, 1000 ;Blank
	sleep 2000
}

click 100, 360 ;Recommended
sleep 2000

Search("Mia.png","1195","870","1570","1025","Mia's Kitchen", 30) ; Mia's Kitchen
click %FoundX%, %FoundY%
sleep 2000
Loop, 60 {
	click 1710, 915 ;Taste
	sleep 1000
}
click 55, 55 ;<
sleep 2000

Search("DailyBounty.png","215","815","525","965","Daily Bounty", 30) ; Daily Bounty
click %FoundX%, %FoundY%
sleep 3000

ImageSearch, FoundX, FoundY, 1175, 780, 1530, 920, *30 img/Vera_disabled.png
If (ErrorLevel = 0) {
	Tooltip, Vera locked - choosing Aesperia. 0,0
}
Else {
	Search("Vera.png","1175","780","1530","920","Vera", 30) ; Vera
	click %FoundX%, %FoundY%
	sleep 1000
}

Search("Accept.png","910","935","1240","1030","Accept", 30) ; Accept
click %FoundX%, %FoundY%
sleep 1000
Loop, 8 {
	ImageSearch, FoundX, FoundY, 405, 845, 1810, 960, *50 img/Submit.png
	If ErrorLevel = 0
	{
		ToolTip, Found Submit, 0,0
		click %FoundX%, %FoundY%
		sleep 1000
	}
	Else
	Tooltip, Submit not found,0,0
	sleep 1000
}

click 555, 905 ; Track Down
sleep 1000
; click 55, 55 ;<
; sleep 2000
; click 55, 55 ;<
; sleep 2000

;Supply Run, Rewards, Pass ====================================================================
send {Alt down}
sleep 100
send 1
sleep 100
send {Alt Up} ;REWARDS
sleep 2000


ImageSearch, FoundX, FoundY, 15, 140, 290, 970, *50 img/SupplyRun.png
If (ErrorLevel = 0) {
	click %FoundX%, %FoundY% ;Supply Run
	sleep 2000
	click 705, 470 ;1
	Sleep, 2000
	send {escape}
	sleep 1000
	click 920, 470 ;2
	Sleep, 2000
	send {escape}
	sleep 1000
	click 1140, 470 ;3
	Sleep, 2000
	send {escape}
	sleep 1000
	click 480, 785 ;4
	Sleep, 2000
	send {escape}
	sleep 1000
	click 705, 785 ;5
	Sleep, 2000
	send {escape}
	sleep 1000
	click 925, 785 ;6
	Sleep, 2000
	send {escape}
	sleep 1000
	click 1145, 785 ;7
	Sleep, 2000
	send {escape}
	sleep 2000
}

click 1790,1030 left, down
sleep 150
mousemove 1200, 1030
sleep 150
mousemove 800, 1030
sleep 150
mousemove 400, 1030
sleep 150
mousemove 35, 1030
click left, up
sleep 1000

Search("Rewards.png","5","995","1910","1070","Rewards", 30)
click %FoundX%, %FoundY% ;Rewards
Sleep, 2000
click 496, 785 ;D1
Sleep, 2000
send {Esc}
sleep 2000
click 707, 785 ;D2
Sleep, 2000
send {Esc}
sleep 2000
click 948, 785 ;D3
Sleep, 2000
send {Esc}
sleep 2000
click 1162, 785 ;D4
Sleep, 2000
send {Esc}
sleep 2000
click 1359, 785 ;D5
Sleep, 2000
send {Esc}
sleep 2000
click 1568, 785 ;D6
Sleep, 2000
send {Esc}
sleep 2000
click 1796, 785 ;D7
Sleep, 2000
send {Esc}
sleep 2000

Search("Pass.png","45","140","270","520","Pass", 30)
click %FoundX%, %FoundY% ;Pass
sleep 3000

n = 0
Loop 
{
	ImageSearch, FoundX, FoundY, 1390, 905, 1680, 990, *30 img/ClaimAll.png
	If (Errorlevel = 0) 
	{
		Tooltip, Found Claim All,0,0
		click %FoundX%, %FoundY% ;Claim All
		break
	}
	Else 
	{
		Tooltip, Claim All not found,0,0
		If (n >= 5) && (n < 8)
		{
			send {escape}
			n = 10
		}
		n++
		sleep 1000
	}
}	
sleep 1000
send {escape}
click 55, 55 ;<
sleep 2000

;Crew ====================================================================
send {Esc}
sleep 2000
click 1385, 250 ;CREW
sleep 2000
ImageSearch, FoundX, FoundY, 1580, 815, 1815, 930, *50 img/Request_Crew.png
If (Errorlevel = 1) { ;Run only if in a crew
	crewVar=810
	Loop, 5 {
		ImageSearch, FoundX, FoundY, %crewVar%, 825, 1875, 910, *50 img/Accept_Crew.png
			If ErrorLevel = 0
			{
				ToolTip, Found Accept %crewVar%, 0,0
				click %FoundX%, %FoundY%
				crewVar := FoundX+5
				sleep 500
			}
			Else {
				Tooltip, Accept not found,0,0
				sleep 500
			}
	}

	Loop, 5 {
		ImageSearch, FoundX, FoundY, 810, 825, 1875, 910, *50 img/Submit_Crew.png
			If ErrorLevel = 0
			{
				ToolTip, Found Submit, 0,0
				click %FoundX%, %FoundY%
				sleep 1000
			}
			Else {
				Tooltip, Submit not found,0,0
				sleep 500
			}
	}

	click 976, 319 ;Weekly 1
	Sleep, 500
	Send, {Escape}
	Sleep, 500
	click 1146, 316 ;Weekly 2
	Sleep, 500
	Send, {Escape}
	Sleep, 500
	click 1308, 304 ;Weekly 3
	Sleep, 500
	Send, {Escape} 
	Sleep, 500
	click 1475, 307 ;Weekly 4
	Sleep, 500
	Send, {Escape}
	Sleep, 500
	click 1633, 308 ;Weekly 5
	Sleep, 500
	Send, {Escape}
	Sleep, 500
	click 1806, 310 ;Weekly 6
	Sleep, 500
	Send, {Escape}
	Sleep, 500
	click 1086, 1024 ;Daily
	Sleep, 2000
	click 1671, 612 ;Aid Request
	Sleep, 1000
	click 1672, 817 ;Donate
	Sleep, 2000
	click 1272, 583 ;Ok (If any)
	Sleep, 1000
	click 157, 311 ;Rewards
	Sleep, 2000

	click 1643, 734 ;Claim
	Sleep, 2000
	click 980, 1000 ;Blank
	sleep 1000
}
click 55, 55 ;<
sleep 2000

;Building Claim ===========================================================================================
click 1225, 260 ;Casual
sleep 2000
click 1140, 570 ;Building
sleep 2000
click 90, 1015 ;Claim
sleep 1000
click 55, 55 ;<
sleep 2000
send {escape}
sleep 2000

;Appointed Research =====================================================================================
If (AppointedResearch == 1)
{
	send b
	Search("Missions.png","1770","550","1895","605","Missions", 30)
	sleep 500
	click %FoundX%, %FoundY% ;Missions
	Search("ReactorCore.png","1160","125","1770","730","ReactorCore", 30)
	sleep 500
	click %FoundX%, %FoundY% ;Reactor Core
	Search("Use_Backpack.png","1250","125","1365","180","Use (Backpack)", 30)
	sleep 500
	click %FoundX%, %FoundY% ;Use (Backpack)
	sleep 500
	Loop, 60
	{
		send {WheelDown}
		sleep 50
	}
	sleep 500
	
	
	Search("RebuiltExoskeleton.png","575","770","1060","1005","Rebuilt Exoskeleton", 30)
	click %FoundX%, %FoundY% ;Rebuilt Exoskeleton
	sleep 2000

	ImageSearch, FoundX, FoundY, 755, 805, 1025, 885, *30 img/Research.png
	If  (ErrorLevel = 0)
	{
		Tooltip, Research found,0,0
		click %FoundX%, %FoundY% ;Research
		sleep 2000
		click 980, 1000 ;Blank
		sleep 1000
	}

	click 55, 55 ;<
	sleep 1000
	click 55, 55 ;<
	sleep 1000
	click 55, 55 ;<
	sleep 2000
}

;Mailbox =====================================================================================
send {escape}
sleep 2000
click 1320, 410 ;Friends
Search("Mailbox.png","1750","420","1880","510","Mailbox", 30)
sleep 500
click %FoundX%, %FoundY% ;Mailbox
Search("ClaimAll_Mailbox.png","40","905","290","1020","ClaimAll_Mailbox", 30)
sleep 500
click %FoundX%, %FoundY% ;Claim All
sleep 2000
click 980, 1000 ;Blank
sleep 1000
click 55, 55 ;<
sleep 1000
send {escape}
sleep 2000

;Commissary Weekly =============================================================
If A_DDDD = Tuesday
{
	send {escape}
	sleep 2000
	click 1540, 235 ;Commissary
	sleep 2000
	CommissaryBuy("BoosterModule.png","600","110","1910","715","Booster Module", 30)
	CommissaryBuy("AdvancementModule.png","600","110","1910","715","Advancement Module", 30)

	click 125, 305 ;Spacetime Store
	CommissaryBuy("DataRepeater.png","600","110","1910","715","Data Repeater", 30)
	CommissaryBuy("AdvancementModule2.png","600","110","1910","715","AdvancementModule2", 30)
	CommissaryBuy("BoosterModule2.png","600","110","1910","715","BoosterModule2", 30)

	click 130, 665 ;Support Store
	sleep 2000
	CommissaryBuy("GoldNucleus.png","600","110","1910","715","GoldNucleus", 30)
	CommissaryBuy("ProofOfPurchase.png","600","110","1910","715","ProofOfPurchase", 30)
	CommissaryBuy("SpacetimeCrystalFragments.png","600","320","1910","715","SpacetimeCrystalFragments", 30)

	click 1310, 640, Left, Down
	sleep 150
	mousemove 1310, 400
	sleep 150
	mousemove 1310, 200
	sleep 150
	mousemove 1310, 130
	sleep 150
	click left, Up
	sleep 1000

	CommissaryBuy("BlackNucleus.png","600","110","1910","715","BlackNucleus", 30)
	click 55, 55 ;<
	sleep 1000
	send {escape}
}

Tooltip, Daily Tasks complete,0,0

;Depreciated ======================================================================

; send {Alt down}
; sleep 100
; send 1
; sleep 100
; send {Alt Up} ;REWARDS
; sleep 2000

; ImageSearch, FoundX, FoundY, 5, 1000, 1915, 1065, *30 ThemedEvent.png
; If (ErrorLevel=0) {
	; Tooltip, Found Themed Event,0,0
	; click %FoundX%, %FoundY% ;Themed Event
	; Search("JoinNow.png","795","820","975","895","Join Now", 30)
	; click %FoundX%, %FoundY% ;Join Now
	; Search("Referral.png","620","85","760","130","ToF Referral Program", 30)
	; sleep 5000
	; Search("IWantToInvite.png","420","630","665","710","I Want To Invite", 30)
	; click %FoundX%, %FoundY% ;I Want to Invite
	; Search("LuckyDraw.png","315","345","510","405","Lucky Draw", 30)
	; click %FoundX%, %FoundY% ;Lucky Draw
	; Search("Share.png","306","665","525","720","Share", 30)
	; click %FoundX%, %FoundY% ;Share
	; Search("Copy.png","710","540","875","595","Copy", 30)
	; click %FoundX%, %FoundY% ;Copy
	; sleep 3000
	; click 995, 420 ;X
	; sleep 1000
	; click 1000, 405 ;X
	; Loop, 4 {
		; Search("Success.png","820","450","930","700","Success", 30)
		; click %FoundX%, %FoundY% ;Success
		; sleep 3000
	; }
	; Search("Start.png","1055","650","1215","700","Start", 30)
	; click %FoundX%, %FoundY% ;Start
	; sleep 1000
	; SendMode Event
	; SetKeyDelay 100
	; send {tab}{tab}{tab}{space}{down}{down}{Enter}{tab}{space}
	; Loop, 14 {
		; send {down}
	; }
	; send {Enter}
	; Search("Confirm.png","615","650","775","700","Confirm", 30)
	; click %FoundX%, %FoundY% ;Confirm

	; Loop, {
		; ImageSearch, FoundX, FoundY, 1055, 650, 1215, 700, *30 Start.png
		; If (ErrorLevel=0) {
			; Tooltip, Found Start,0,0
			; click %FoundX%, %FoundY% ;Start
		; }
		
		; ImageSearch, FoundX, FoundY, 715, 585, 875, 660, *30 confirm_2.png
		; If (ErrorLevel=0) {
			; Tooltip, Found confirm,0,0
			; click %FoundX%, %FoundY% ;confirm
		; }
		
		; ImageSearch, FoundX, FoundY, 700, 515, 875, 570, *30 InsufficientDraws.png
		; If (ErrorLevel=0) {
			; Tooltip, Found Insufficient Draws,0,0
			; break
		; }	
		; sleep 500
	; }
	; MouseMove 1400, 20 ;X
	; sleep 500
	; click 1400, 20 ;X
	; sleep 1000
	; click 55, 55 ;<
	; sleep 2000
; }