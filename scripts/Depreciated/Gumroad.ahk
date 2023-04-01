#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

tooltip, Ready,0,0
F1::

SubmitLicense:
Gui, EnterKey:Submit
submitreq = product_permalink=UtFRc&license_key=85DB562A-C11D4B06-A2335A6B-8C079166                 ; mykey is the variable that grabs the key entered by user
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("POST", "https://api.gumroad.com/v2/licenses/verify",  False)
req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
req.send(submitreq)
responseData := JSON.Load(req.responseText)
success := responseData.success
key := responseData.purchase.license_key
uses := responseData.uses

Tooltip submitreq = %submitreq% responseData = %responseData% success = %success% key = %key% uses=%uses%
pause




Search(file,x1,y1,x2,y2,object,timeout)
{
	global FoundX, FoundY
	Loop
	{
		ImageSearch, FoundX, FoundY, %x1%, %y1%, %x2%, %y2%, *50 %file%
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
				MsgBox, %object% not found, 0,0
				break
			}
		}
	}
	return FoundX, FoundY
}



F4::Reload
F2::ExitApp