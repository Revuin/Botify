#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
#SingleInstance Force

CommandLine := DllCall("GetCommandLine", "Str") ;Runs as administrator
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
	Try {
		If (A_IsCompiled) {
			Run *RunAs "%A_ScriptFullPath%" /restart
		} Else {
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
		}
	}
	ExitApp
}

Hotkey, F2, off
Hotkey, F3, off

pause = 0


;GUI =============================================================================================================
Gui Font, s13
Gui Add, Button, x34 y200 w91 h53, Start   ▶
Gui Font
Gui Font, s13
Gui Add, Button, x154 y200 w91 h53, Stop   ⏹
Gui Font
Gui Font, s13
Gui Add, Button, x282 y200 w91 h53, Pause   ⏸
Gui Font
Gui Font, s12
Gui Add, Text, x72 y182 w25 h17 +0x200 , F1
Gui Font
Gui Font, s12
Gui Add, Text, x192 y182 w25 h17 +0x200 , F2
Gui Font
Gui Font, s12
Gui Add, Text, x320 y182 w25 h17 +0x200 , F3
Gui Font
Gui Add, Picture, x72 y15 w251 h89, K:\My Drive\ToF\Gumroad\Botify logo.png
Gui Font, s10
Gui Add, DropDownList, x117 y136 w173 vDlist1, Frontier Clash||Dimensional Trials|Daily Tasks|Attack Loop
Gui Font
Gui Font, s11 Bold
Gui Add, Text, x153 y112 w101 h23 +0x200 , Select a bot
Gui Font
Gui Font, s11, Segoe UI
Gui Add, Button, x291 y136 w33 h24, ?
Gui Font

GuiControl, Disable, Stop   ⏹
GuiControl, Disable, Pause   ⏸

; Gui Add, Button, x11 y127 w80 h23, Test

Gui Show, w407 h270, Botify
return

;END GUI =============================================================================================================

GuiEscape:
GuiClose:
    ExitApp

Hotkey, F1, On
StartMain:
return

Button?:
	GuiControlGet, Dlist1
	; MsgBox %Dlist1%

	If (Dlist1 = "Frontier Clash")
	{
		MsgBox, Get support points and vehicle parts `n`n1. Matches with players for Frontier Clash Normal`n2. Enables Auto Battle
	}
	Else if (Dlist1 = "Dimensional Trials")
	{
		MsgBox, Get weapon materials and support points `n`n1. Matches with players for Dimensional Trials `n2. Enables Auto Battle
	}
return

F2::
ButtonStop⏹: ;Stop
Reload
	; Hotkey, F1, on
	; Hotkey, F3, off
	; GuiControl, Enable, Started   ▶
	; GuiControl, Text, Started   ▶, Start   ▶
	; GuiControl, Disable, Stop   ⏹
	; If (pause = 1)
	; {
		; Pause,,1
		; pause = 0
		; GuiControl, Text, Unpause, Pause   ⏸
	; }
	; GuiControl, Disable, Pause   ⏸
; Goto StartMain

F3:: ;Pause
ButtonPause⏸:
	If (pause = 0)
	{
		GuiControl, Text, Pause   ⏸, Unpause
		pause = 1
		Pause,,1
	}
	Else
	{
		Pause,,1
		pause = 0
		GuiControl, Text, Unpause, Pause   ⏸
	}
return

F1:: ;Start
ButtonStart▶:
	Hotkey, F1, off
	Hotkey, F2, on
	Hotkey, F3, on
	GuiControl, Disable, Start   ▶
	GuiControl, Text, Start   ▶, Started   ▶
	GuiControl, Enable, Stop   ⏹
	GuiControl, Enable, Pause   ⏸
	
	IfWinNotExist ahk_class UnrealWindow ;Start game if it's not open
	{	
		Tooltip, Starting game,0,0
		RegRead, reg1, HKEY_CURRENT_USER\SOFTWARE\Classes\toflauncher\DefaultIcon
		Run %reg1%
		Search("Launch.png","15","725","375","850","Launch button", 200)
		sleep 1000
		Search("Launch.png","15","725","375","850","Launch button", 200)
		click %FoundX%, %FoundY%
		Search("CloseX.png","1690","170","1790","270","Close Button", 300)
		click %FoundX%, %FoundY%
		sleep 500
		click 940, 530 ;Login
	}
	
	IfWinNotActive ("ahk_class UnrealWindow")
	{
		WinActivate ahk_class UnrealWindow
	}

	GuiControlGet, Dlist1
	If (Dlist1 = "Frontier Clash") ;Frontier Clash FC# START ====================================================================================================================================
	{
		Loop
		{
			gtfo = 0
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
			click 240, 585 ;Challenge
			sleep 2000
			Loop {
				Tooltip, Searching for Frontier Clash,0,0
				ImageSearch, FoundX, FoundY, 360, 205, 1670, 315, *100 img/FrontierClash.png
				If (ErrorLevel = 0) {
					MouseMove %FoundX%, %FoundY%
					sleep 1000
					click 110, 570, relative
					sleep 1000
					mousemove 990, 170
					sleep 2000
					break
				}
				Else {
					Loop, 2 {
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
					sleep 1000
				}
			}
			
			Tooltip, Searching for Go,0,0
			Search("Go.png","1355","720","1615","835","Go", 30)
			click 1640, 800 ;x dropdown
			sleep 500
			click 1640, 860 ;x1 attempt
			sleep 500
			Search("Go.png","1355","720","1615","835","Go", 30)
			click %FoundX%, %FoundY% ;Go
			Tooltip, Searching for Match,0,0
			Search("Match.png","1135","520","1360","630","Match", 30)
			click %FoundX%, %FoundY% ;Match
			sleep 3000
			
			Loop {
				Tooltip, Searching for Assist_Unchecked,0,0
				ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack img/Assist.png ;Search for Assist_Unchecked
				If (ErrorLevel=0) 
				{
					Tooltip, Found Assist_Unchecked,0,0
					click %FoundX%, %FoundY% ;Assist checkbox
					sleep 500
					mousemove 945, 210 ;Blank
					sleep 500
				}
				sleep 200
				
				Tooltip, Searching for Assist_Checked,0,0
				ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack img/Assist_Checked.png ;Search for Assist_Checked
				If (ErrorLevel=0) 
				{
					Tooltip, Found Assist_Checked waiting 4 seconds,0,0
					sleep 4000
					ImageSearch, FoundX, FoundY, 755, 825, 1140, 950, *50 *TransBlack img/Assist_Checked.png ;Search for Assist_Checked
					If (ErrorLevel=0) 
					{
						Tooltip, Found Assist_Checked,0,0
						ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img/Approve.png ;Search for Approve
						If (ErrorLevel=0) 
						{
							Tooltip, Found Approve,0,0
							click %FoundX%, %FoundY% ;Approve
						}
					}
				}
				sleep 200
				
				Tooltip, Searching for Go,0,0
				ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go.png
				If (ErrorLevel=0) 
				{
					Tooltip, Found Go,0,0
					click %FoundX%, %FoundY% ;Go
				}
				sleep 200
				
				Tooltip, Searching for Go_FC_2,0,0
				ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go_FC_2.png
				If (ErrorLevel=0) 
				{
					Tooltip, Found Go_FC_2,0,0
					click %FoundX%, %FoundY% ;Go
				}
				sleep 200
				
				Tooltip, Searching for Match,0,0
				ImageSearch, FoundX, FoundY, 1135, 520, 1360, 630, *30 img/Match.png
				If (ErrorLevel=0) 
				{
					Tooltip, Found Match,0,0
					click %FoundX%, %FoundY% ;Match
				}

				sleep 200
				
				Tooltip, Searching for Loading screen,0,0
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
				If (ErrorLevel=0) {
					Tooltip, Loading screen found,0,0
					break
				}
				sleep 200
			}
			
			Loading:
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
						goto Loading
					Else {
						break
					}
				}
			}
			
			sleep 8000
			send {Alt Down}
			sleep 500
			click 1155, 920 ; Auto Attack
			send {Alt Up}
			AutoRepeat("w", 2500) ;Walk
			AutoRepeat("a", 2000) ;Walk
			sleep 500
			send f
			AutoRepeat("w", 600) ;Walk
			sleep 500
			send f
			AutoRepeat("d", 100) ;Walk
			AutoRepeat("w", 600) ;Walk
			sleep 500
			send f
			
			Loop {
				ImageSearch, FoundX, FoundY, 1135, 910, 1185, 940, *100 *TransBlack img/Auto_On.png
				If (ErrorLevel = 0) {
					Tooltip, Found Auto On,0,0
					break
				}
				Else {
					Tooltip, Enable Auto,0,0
					send {Alt Down}
					sleep 500
					click 1155, 920 ; Auto Attack
					send {Alt Up}
				}
				sleep 500
			}
			
			F6::
			n=0
			SetTimer, Focus, 30000, On
			start := A_Now
			
			Loop {
				If WinActive("ahk_class UnrealWindow") {
					Tooltip, Spam weapon,0,0
					send rf

					end := A_Now
					end -= start, Seconds
					
					If (end >= 3) {
						Tooltip, Search for skip or Channel blue dot,0,0
						start := A_Now
						ImageSearch, FoundX, FoundY, 835, 890, 1110, 1010, *50 img/Skip.png
						If (ErrorLevel=0) {
							Tooltip, Skip found,0,0
							click %FoundX%, %FoundY% ;Skip
							sleep 2000
							click 980, 1000 ;Blank
							sleep 2000
							click 980, 1000 ;Blank
							sleep 2000
							send {Escape}
							sleep 1000
							click 270, 65 ;Exit
							sleep 2000
							click 1270, 580 ;OK
							break
						}
						
						PixelGetColor, p1, 19, 62
						PixelGetColor, p2, 20, 63
						PixelGetColor, p3, 21, 64
						If (p1=0xEDA63E and p2=0xEDA63E and p3=0xEDA63E) {
							Tooltip, Channel blue dot found,0,0
							sleep 5000
							break
						}
						sleep 500
					}
				}
			}
		}

		EndCheck:
			ImageSearch, FoundX, FoundY, 835, 890, 1110, 1010, *50 img/Skip.png
				If (ErrorLevel=0) {
					Tooltip, Skip found,0,0
					SetTimer, EndCheck, Delete
					gtfo = 1
				}
				Else {
					Tooltip, Skip not found %n%,0,0
					n++
				}
		return
		;Frontier Clash FC# END ====================================================================================================================================
	}
	
	Else if (Dlist1 = "Dimensional Trials") ;Dimensional Trials DT# START ====================================================================================================================================
	{
		Matrix = 0
		lowVit = 0

		Tooltip, Ready,0,0

		SetTimer, Focus, 30000, On
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
			send 3
			sleep 100
			send {Alt Up} ;DUAL SWORDS
			sleep 1500
			click 255, 470 ;Select
			sleep 1000
			click 765, 825 ;Go

			If (Matrix = 1) {
				click 680, 505 ;Matrix Drill
				sleep 1000
			}
			
			Search("Go.png","1355","720","1615","835","Go", 30)
			click %FoundX%, %FoundY% ;Go
			sleep 2000
			
			ImageSearch, FoundX, FoundY, 1035, 485, 1440, 640, *50 img/Purchase.png
			If (ErrorLevel=0) {
				Tooltip, Low vitality,0,0
				lowVit = 1
				click 655, 580 ;Continue
			}
			
			Search("Match.png","1135","520","1360","630","Match", 30)
			click %FoundX%, %FoundY% ;Match
			Search("Approve.png","885","445","1480","800","Approve", 300)
			click %FoundX%, %FoundY% ;Approve
			If (lowVit = 1) {
				Tooltip, Continue (low vitality),0,0
				sleep 1000
				click 655, 580 ;Continue
			}

			Loop {
				Tooltip, Searching for Approve or Loading screen,0,0
				ImageSearch, FoundX, FoundY, 885, 445, 1480, 800, *50 img.Approve.png
					If (ErrorLevel=0) {
						Tooltip, Found Approve,0,0
						click %FoundX%, %FoundY%
						If (lowVit = 1) {
							Tooltip, Continue (low vitality),0,0
							sleep 1000
							click 655, 580 ;Continue
						}
					}
					Else {
						sleep 500
					}
					
					ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go.png
					If (ErrorLevel=0) {
						click %FoundX%, %FoundY%
					}
					
					ImageSearch, FoundX, FoundY, 1355, 720, 1615, 835, *30 img/Go_FC_2.png
					If (ErrorLevel=0) {
						click %FoundX%, %FoundY%
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
						send {Alt Down}
						sleep 500
						click 1155, 920 ; Auto Attack
						send {Alt Up}
						break
					}
			}
		}
	}
	;Dimensional Trials DT# END ====================================================================================================================================


	Else if (Dlist1 = "Daily Tasks") ;Daily Tasks Daily# START ====================================================================================================================================
	{
		Weekly = 0
		AppointedResearch = 0
		
		Loop 10 ;Check for Reward Recovery
		{ 
			ImageSearch, FoundX, FoundY, 0, 730, 1910, 910, *50 img/Claim.png
			If ErrorLevel = 0
			{
				ToolTip, Found X, 0,0
				click %FoundX%, %FoundY%
				sleep 2000
				click 980, 1000 ;Blank
				sleep 2000
				click 980, 1200 ;Blank
				sleep 2000
			}
			Else
			{
			Tooltip, Reward Recovery not found,0,0
			sleep 1000
			}
		}
			
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
		;START Daily Box, Vitality solution ====================================================================
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
		click 55, 55 ;<
		sleep 2000
		;END Daily Box, Vitality solution ====================================================================

		;START Activities, Mia's Kitchen, Daily Bounty ====================================================================
		send {Alt down}
		sleep 100
		send 3
		sleep 100
		send {Alt Up} ;DUAL SWORDS
		sleep 2000

		Loop, 20 { ;Claim weekly activities
		ImageSearch, FoundX, FoundY, 720, 450, 985, 560, *50 img/Claim_Weekly.png
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

		If (Weekly = 1) {
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

		click 240, 350 ;Recommended
		sleep 2000

		Search("Mia.png","345","190","1675","340","Mia's Kitchen", 30) ; Mia's Kitchen
		MouseMove %FoundX%, %FoundY%
		click 110, 570, relative
		sleep 2000
		Loop, 60 {
			click 1710, 915 ;Taste
			sleep 1000
		}
		click 55, 55 ;<
		sleep 2000

		Search("DailyBounty.png","355","180","1655","330","Daily Bounty", 30) ; Daily Bounty
		MouseMove %FoundX%, %FoundY%
		click 110, 570, relative
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
		;END Activities, Mia's Kitchen, Daily Bounty ====================================================================

		;START Supply Run, Rewards, Pass ====================================================================
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
		Loop {
		ImageSearch, FoundX, FoundY, 1390, 905, 1680, 990, *30 img/ClaimAll.png
		If (Errorlevel = 0) {
			Tooltip, Found Claim All,0,0
			click %FoundX%, %FoundY% ;Claim All
			break
		}
		Else {
			Tooltip, Claim All not found %n%,0,0
			If (n >= 5)
				send {escape}
				n = 0
			}
			n++
			sleep 1000
		}	
		sleep 1000
		send {escape}
		click 55, 55 ;<
		sleep 2000
		;END Supply Run, Rewards, Pass ====================================================================

		;START Crew ====================================================================
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

		;END Crew ====================================================================

		;START Building Claim ===========================================================================================
		click 1225, 260 ;Casual
		sleep 2000
		click 1140, 570 ;Building
		Search("Go_Building.png","1340","785","1575","905","Go_Building", 30)
		click %FoundX%, %FoundY% ;Go
		Search("OK.png","1105","520","1415","630","OK", 30)
		click %FoundX%, %FoundY% ;OK

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
		Loading_Building:
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
							goto Loading_Building
						}
						Else
							break
				}
		}
		sleep 5000
		send {Escape}
		sleep 2000
		click 1225, 260 ;Casual
		sleep 2000
		click 1140, 570 ;Building
		sleep 1000
		Search("Claim_Building.png","315","610","510","675","Claim_Building", 30)
		click %FoundX%, %FoundY% ;Claim
		sleep 1000
		send {escape}
		sleep 1000
		click 270, 70 ;Exit Icon
		Search("OK.png","1105","520","1415","630","OK", 30)
		click %FoundX%, %FoundY% ;OK

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
		Loading_Building2:
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
						goto Loading_Building2
					}
					Else
						break
				}
		}
		sleep 5000
		;END Building Claim ===========================================================================================

		;START Appointed Research =====================================================================================
		If (AppointedResearch = 1)
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
			Search("RuinResearch.png","100","90","1910","355","Ruin Research", 30)
			click %FoundX%, %FoundY% ;Ruin Research
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
		;END Appointed Research =====================================================================================

		;START Mailbox =====================================================================================
		send {escape}
		sleep 2000
		click 1320, 410 ;Friends
		Search("Mailbox.png","1605","50","1755","110","Mailbox", 30)
		sleep 500
		click %FoundX%, %FoundY% ;Mailbox
		Search("ClaimAll_Mailbox.png","40","905","290","980","ClaimAll_Mailbox", 30)
		sleep 500
		click %FoundX%, %FoundY% ;Claim All
		sleep 2000
		click 980, 1000 ;Blank
		sleep 1000
		click 55, 55 ;<
		sleep 1000
		send {escape}
		;END Mailbox =====================================================================================

	}
	;Daily Tasks END ====================================================================================================================================
	
	Else if (Dlist1 = "Attack Loop")
	{
		Loop {
			Tooltip, Attacking,0,0
			send r
			sleep 500
			Loop, 3 {
				send 1
				sleep 200
			}
			sleep 1000
			send {Space}
			click left, down
			sleep 100
			click left, up
			sleep 900
			send {Space}
			sleep 500
			Loop, 70 {
				send 23{Tab}
				sleep 100
				click left, down
				sleep 100
				click left, up
				sleep 100
			}
			Tooltip, Attacking,0,0
			Loop, 20 {
				send q
				sleep 100
				send 1
				sleep 100
			}
			send {shift}
			sleep 500
		}
	}
	
	
	
return



Search(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 img/%file%
		If ErrorLevel = 0
		{
			ToolTip, %object% Found, 0,0
			break
		}
		Else
		{
			If (n<timeout)
			{
				sleep 1000
				n++
				ToolTip, Searching for %object% %n%/%timeout%, 0,0
			}
			Else
			{
				n=0
				Msgbox, %object% not found, 0,0
				break
			}
		}
	}
	return FoundX, FoundY, ErrorLevel
}



AutoRepeat(Key, Duration:=0)
{
	End := A_TickCount + Duration
	While, A_TickCount < End
	{
		SendInput, {%Key% DownR}
		Sleep, 30
	}
	SendInput, {%Key% Up}
}

Focus:
	IfWinNotActive ("ahk_class UnrealWindow")
	{
		WinActivate ahk_class UnrealWindow
	}
	
	PixelGetColor, p1, 577, 466
	PixelGetColor, p2, 594, 463
	PixelGetColor, p3, 825, 469
	PixelGetColor, p4, 1138, 470
	PixelGetColor, p5, 1343, 476
	If (p1=0x000000 and p2=0x000000 and p3=0x000000 and p4=0x000000 and p5=0x000000) {
		Tooltip, Disconnect found,0,0
		sleep 1000
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 img/OK_Disconnect.png
		If (ErrorLevel = 0) {
			Tooltip, OK found,0,0
			click %FoundX%, %FoundY%
		}
		ImageSearch, FoundX, FoundY, 1150, 520, 1360, 635, *50 img/OK_Disconnect_2.png
		If (ErrorLevel = 0) {
			Tooltip, OK_2 found,0,0
			click %FoundX%, %FoundY%
		}
	}

IfWinNotExist ahk_class UnrealWindow
{	
	Tooltip, Game crashed,0,0
	RegRead, reg1, HKEY_CURRENT_USER\SOFTWARE\Classes\toflauncher\DefaultIcon
	Run %reg1%
	Search("Launch.png","15","725","375","850","Launch button", 200)
	sleep 1000
	Search("Launch.png","15","725","375","850","Launch button", 200)
	click %FoundX%, %FoundY%
	Search("CloseX.png","1690","170","1790","270","Close Button", 300)
	click %FoundX%, %FoundY%
	sleep 500
	click 940, 530 ;Login
}
return