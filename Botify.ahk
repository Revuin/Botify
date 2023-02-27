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
Hotkey, $MButton, off

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
Gui Add, DropDownList, x117 y136 w173 vDlist1, 2-3 Star Gates|Attack Loop|Boss Chest|Daily Tasks||Critical Abyss|Dimensional Trials|Dream Machine|Frontier Clash|Event|JO Carnival Party|JO Sadness Valley|Join game and Auto battle|Left-click| Turbo|Raid|Sequential Phantasm|Void Rifts
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

;Buttons ==================================================================================================================
GuiEscape:
GuiClose:
    ExitApp

Hotkey, F1, On
StartMain:
return

Button?:
	GuiControlGet, Dlist1
	; MsgBox %Dlist1%
	
	If (Dlist1 = "2-3 Star Gates")
	{
		MsgBox, Joins 2-3 star nanofiber/booster gates and enables auto-battle. `n`n1. Open chat`n2. Go to the recruit section`n3. Run bot
	}
	Else if (Dlist1 = "Attack Loop")
	{
		MsgBox, AFK farm nearby enemies using left clicks, skills (key 1)`, and relics (key 2 & 3). `n`nUseful for raids and world bosses
	}
	Else if (Dlist1 = "Boss Chest")
	{
		MsgBox, Spams F and uses Perfect Decipher once the boss chest is available`n`n1. Stand next to a world boss chest`n2. Start bot
	}
	Else if (Dlist1 = "Critical Abyss")
	{
		MsgBox, Plays Critical Abyss. IMPORTANT: Equip jetpack to keyboard button. Recommended to equip Lin to R 2`n`nUses jetpack to fly to the middle area and kills nearby enemy players
	}
	Else if (Dlist1 = "Daily Tasks")
	{
		MsgBox, Claims all available rewards and completes certain daily tasks`n`nFeatures:`nReward Recovery`nBuy 1x Vitality solution`nDaily supply box`nMia's Kitchen`nWeekly rewards`nDaily bounty (Clicks submit for any bounties that can be completed)`nSupply Run`nRewards`nBattle Pass`nCrew`nBuilding`nAppointed Research (Core only) (Will be updated to the newest equipment instead in the future)`nMailbox
	}
	Else if (Dlist1 = "Dimensional Trials")
	{
		MsgBox, Plays Dimensional Trials and enables auto-battle for weapon materials
	}
	Else if (Dlist1 = "Dream Machine")
	{
		MsgBox, Kills the 2 named enemies in Aesperia repeatedly`n`nRecommended to equip Samir to R and Cocoritter to Q
	}
	Else if (Dlist1 = "Event")
	{
		MsgBox, Plays the Half-Anniversary Event. Recommended to run this overnight because it'll get last place each time`, which rewards only 100 tokens
	}
	Else if (Dlist1 = "Frontier Clash")
	{
		MsgBox, Plays Frontier Clash and enables auto-battle for exp`, support points`, and vehicle parts
	}
	Else if (Dlist1 = "JO Carnival Party")
	{
		MsgBox, (In development) Not fully working because it does not go to the chest right now. `n`nRecommended to equip Lin or long range weapon to R
	}
	Else if (Dlist1 = "JO Sadness Valley")
	{
		MsgBox, (In development) Not fully working. Detecting the boss stage platform doesn't work reliably right now. If you want to try making this work`, replace img/SadnessValleyEnd.png with a screenshot of the ground to the bottom-left of your character's feet once you're at the boss stage platform`n`nJumps off repeatedly until the boss stage is detected. Next, it runs up to boss`, enables auto-battle`, and opens chest once boss is dead
	}
	Else if (Dlist1 = "Join game and Auto battle")
	{
		MsgBox, Used for games with long queues or when waiting for a party leader to start a game. Clicks the Approve button once it appears and enables auto-battle.`n`n1. Start matching for a game`n2. Run bot
	}
	Else if (Dlist1 = "RAID")
	{
		MsgBox, (In development) Not fully working. Detection for the rewards end screen is untested. Joins the top 3 Raids with the highest rewards. Run up to boss and press F6 to start an attack loop
	}
	Else if (Dlist1 = "Sequential Phantasm")
	{
		MsgBox, Plays all 3 Sequential Phantasm stages. Recommended to equip Lin to R
	}
	Else if (Dlist1 = "Left-click Turbo")
	{
		MsgBox, Holding middle click will spam left click
	}
	Else if (Dlist1 = "Void Rifts")
	{
		MsgBox, Plays Void Rifts. Will keep trying to teleport to boss room and then wait 60 seconds to fight boss
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
		Loading_Launch:
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
							goto Loading_Launch
							}
						Else
							break
				}
		}
	}
	
	IfWinNotActive ("ahk_class UnrealWindow") ;Focus on game
	{
		WinActivate ahk_class UnrealWindow
	}
	
	SetTimer, Focus, 5000, On

	GuiControlGet, Dlist1
	If (Dlist1 = "")
	{
	}
	; If (Dlist1 = "2-3 Star Gates")
	; {
		; #Include scripts/2-3 Star Gates.ahk
	; }
	Else if (Dlist1 = "Attack Loop")
	{
		Loop
		{
			#Include scripts/Attack Loop.ahk
		}
	}
	Else if (Dlist1 = "Boss Chest")
	{
		#Include scripts/Boss Chest.ahk
	}
	Else if (Dlist1 = "Critical Abyss")
	{
		#Include scripts/Critical Abyss.ahk
	}
	Else if (Dlist1 = "Daily Tasks")
	{
		#Include scripts/Daily Tasks.ahk
	}
	Else if (Dlist1 = "Dimensional Trials")
	{
		Loop
		{
			#Include scripts/Dimensional Trials.ahk
		}
	}
	Else if (Dlist1 = "Dream Machine")
	{
		#Include scripts/Dream Machine.ahk
	}
	Else if (Dlist1 = "Event")
	{
		#Include scripts/Event.ahk
	}
	Else if (Dlist1 = "Frontier Clash")
	{
		Loop
		{
			#Include scripts/Frontier Clash.ahk
		}
	}
	Else if (Dlist1 = "JO Carnival Party")
	{
		Loop
		{
			#Include scripts/JO Carnival Party.ahk
		}
	}
	Else if (Dlist1 = "JO Sadness Valley")
	{
		#Include scripts/JO Sadness Valley.ahk
	}
	Else if (Dlist1 = "Join game and Auto battle")
	{
		#Include scripts/Join game and Auto battle.ahk
	}
	Else if (Dlist1 = "Left-click Turbo")
	{
		Hotkey, $MButton, on
		#Include scripts/Left-click Turbo.ahk
	}
	Else if (Dlist1 = "RAID")
	{
		Loop, 3
		{
			#Include scripts/RAID.ahk
		}
	}
	Else if (Dlist1 = "Sequential Phantasm")
	{
		Loop, 3
		{
			#Include scripts/Sequential Phantasm.ahk
		}
	}
	; Else if (Dlist1 = "Void Rifts")
	; {
		; #Include scripts/Void Rifts.ahk
	; }
	Else
	{
		MsgBox, Error, Selection not available
	}
return



;Functions and labels
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
	IfWinNotActive ("ahk_class UnrealWindow") ;Focus on game
	{
		WinActivate ahk_class UnrealWindow
	}
	
	PixelGetColor, p1, 577, 466 ;Check for disconnected message
	PixelGetColor, p2, 594, 463
	PixelGetColor, p3, 825, 469
	PixelGetColor, p4, 1138, 470
	PixelGetColor, p5, 1343, 476
	If (p1=0x000000 and p2=0x000000 and p3=0x000000 and p4=0x000000 and p5=0x000000)
	{
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

	IfWinExist, ahk_class #32770 ;Press OK if crash error message appears
	{	
		WinActivate ahk_class #32770
		send {Enter}
	}

	IfWinNotExist ahk_class UnrealWindow ;Start game again if it's closed
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


CommissaryBuy(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 img/%file%
		If (ErrorLevel = 0)
		{
			ToolTip, %object% Found, 0,0
			click %FoundX%, %FoundY%
			sleep 1000
			click 1410, 990 ;Right arrow for max items
			sleep 500
			Loop
			{
				ImageSearch, FoundX, FoundY, 1520, 845, 1915, 1035, *30 img/Purchase_Weekly.png
				If (ErrorLevel=0)
				{
					Tooltip, Found Purchase,0,0
					click %FoundX%, %FoundY% ;Purchase
					break
				}
				Else
				{
					Tooltip, Purchase_Weekly not found,0,0
					sleep 500
				}
			}
			Loop, 5
			{
				ImageSearch, FoundX, FoundY, 1105, 520, 1415, 630, *30 img/OK.png
				If (ErrorLevel=0)
				{
					Tooltip, Found OK,0,0
					click %FoundX%, %FoundY% ;OK
					sleep 1000
					break, 2
				}
				Else
				{
					Tooltip, OK not found,0,0
					sleep 500
				}
			}
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