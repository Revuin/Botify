

IfWinNotExist ahk_class UnrealWindow ;Start game again if it's closed
{
	Tooltip, Launching game,0,0
	RegRead, reg1, HKEY_CURRENT_USER\SOFTWARE\Classes\toflauncher\DefaultIcon
	Run %reg1%
	sleep 5000
	IfWinNotActive ("Tower of Fantasy") ;Focus on launcher
	{
		WinActivate, Tower of Fantasy
	}
	mousemove 0,0
	Loop
	{
		ImageSearch, FoundX, FoundY, 10, 240, 145, 290, *100 img/Confirm_Launcher.png
		If (ErrorLevel = 0)
		{
			Tooltip, Found Confirm,0,0
			click %FoundX%, %FoundY%
			sleep 500
			mousemove 0,0
		}
		
		ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Update.png
		If (ErrorLevel = 0)
		{
			Tooltip, Found Update,0,0
			click %FoundX%, %FoundY%
			sleep 500
			mousemove 0,0
		}
	
		ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Launch.png
		If (ErrorLevel = 0)
		{
			Tooltip, Found Launch,0,0
			sleep 2000
			
			ImageSearch, FoundX, FoundY, 15, 725, 375, 850, *50 img/Launch.png
			If (ErrorLevel = 0)
			{
				click %FoundX%, %FoundY%
				break
			}
		}	
	}
	Search("CloseX.png","1690","170","1790","270","Close Button", 300)
	click %FoundX%, %FoundY%
	sleep 7000
	click 940, 530 ;Login
	
	
	Loop 
	{
		Tooltip, Searching for Loading screen,0,0
		ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
		If (ErrorLevel=0) 
		{
			Tooltip, Loading screen found,0,0
			sleep 500
			ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
			If (ErrorLevel=0) 
			{
				Tooltip, Loading screen found,0,0
				sleep 500
			}
			Else
			{
				ImageSearch, FoundX, FoundY, 460, 970, 1390, 1080, *5 img/Loading.png
				If (ErrorLevel=0) 
				{
					Tooltip, Loading screen found,0,0
					sleep 500
				}
				Else
				{
					Tooltip, Loading screen not found,0,0
					break
				}
			}
		}
		sleep 500
	}
}