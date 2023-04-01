#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


KeyWait, MButton, D
click left
; sleep 230
; click left
; sleep 250
sleep 246
send 2
; sleep 10
send 2


Reload

F4::Reload
F2::ExitApp