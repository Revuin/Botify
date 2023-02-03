#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

;V1.0.0

CommandLine := DllCall("GetCommandLine", "Str")
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

/*
AutoHotkey Version 1.1.30.00
Windows 10
AutoHotkey updater. Used for various programs. 
You can change the URL/ file name to whatever you want. It will download to whatever the current folder is. 
You also need to change line 22 to where the update version file is located.
*/



; below is the URL name you would like to download. Filename is the name of the filename
url = https://github.com/Revuin/Botify/archive/refs/heads/main.zip
Filename = main.zip

FileReadLine, VNum, %A_WorkingDir%\version.txt, 1 ;looks for local version text and stores as vnum
	if ErrorLevel = 1
	Vnum = 0
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://github.com/Revuin/Botify/blob/main/version.txt", true)
whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
whr.WaitForResponse() ;this is taken from the installer. Can also be located as an example on the urldownloadtofile page of the quick reference guide.
version := whr.ResponseText
MsgBox, 1, Press OK to download, Your current version is %Vnum%. This latest is %version%.
	IfMsgBox OK
		UrlDownloadToFile, *0 %url%, %A_WorkingDir%\%Filename%
		if ErrorLevel = 1
			MsgBox, There was some error updating the file. You may have the latest version, or it is blocked.
		else if ErrorLevel = 0
			MsgBox, The update/ download appears to have been successful or you clicked cancel. Please check the update folder. 
		else 
			MsgBox, some other crazy error occured. 
Return


F4::Reload
F2::ExitApp