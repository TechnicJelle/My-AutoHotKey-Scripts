#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; Made in AutoHotkey Version 1.1.33.09 
;  by TechnicJelle (https://github.com/TechnicJelle/My-AutoHotKey-Scripts)

#IfWinActive, ahk_class MSPaintApp

hotkeysEnabled := True

p:: ;pencil
	if(hotkeysEnabled) {
		Send {Alt}1
		reload
	} else {
		Send p
	}
return

f:: ;fill bucket
	if(hotkeysEnabled) {
		Send {Alt}2
		reload
	} else {
		Send f
	}
return

^t:: ;text
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}3
		KeyWait, LButton, D
		KeyWait, LButton, U
		hotkeysEnabled := False
		; waits until text editing is done
		KeyWait, LButton, D
		KeyWait, LButton, U
		hotkeysEnabled := True
		Send {Alt}6
	} else {
		Send {Ctrl}t
	}
return

e:: ;eraser
	if(hotkeysEnabled) {
		Send {Alt}4
		reload
	} else {
		Send e
	}
return

c:: ;colour picker
	if(hotkeysEnabled) {
		Send {Alt}5
		reload
	} else {
		Send c
	}
return

^r up:: ;rect select
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}6
		reload
	} else {
		Send {Ctrl}r
	}
return

^+r up:: ;free select
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		keywait, Shift ;wait until shift is released
		Send {Alt}7
		reload
	} else {
		Send {Ctrl}{Shift}r
	}
return

^+t up:: ;transparent selection
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		keywait, Shift ;wait until shift is released
		Send {Alt}8
		reload
	} else {
		Send {Ctrl}{Shift}t
	}
return

^i up:: ;invert selection
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}9
		reload
	} else {
		Send {Ctrl}i
	}
return

b:: ;brush
	if(hotkeysEnabled) {
		Send {Alt}09{Enter}
		reload
	} else {
		Send b
	}
return

1:: ;line thickness 1
	if(hotkeysEnabled) {
		Send {Alt}08{Enter}
		reload
	} else {
		Send 1
	}
return

2:: ;line thickness 2
	if(hotkeysEnabled) {
		Send {Alt}08{Down 1}{Enter}
		reload
	} else {
		Send 2
	}
return

3:: ;line thickness 3
	if(hotkeysEnabled) {
		Send {Alt}08{Down 2}{Enter}
		reload
	} else {
		Send 3
	}
return

4:: ;line thickness 4
	if(hotkeysEnabled) {
		Send {Alt}08{Down 3}{Enter}
		reload
	} else {
		Send 4
	}
return

z:: ;colour 1
	if(hotkeysEnabled) {
		Send {Alt}07{Enter}
		reload
	} else {
		Send z
	}
return

x:: ;colour 2
	if(hotkeysEnabled) {
		Send {Alt}06{Enter}
		reload
	} else {
		Send x
	}
return

l:: ;line tool
	if(hotkeysEnabled) {
		Send {Alt}HSH{Enter}
		reload
	} else {
		Send l
	}
return

r:: ;rulers
	if(hotkeysEnabled) {
		Send {Alt}VR{Enter}{Alt}H{Esc 2}
		reload
	} else {
		Send r
	}
return

g:: ;gridlines
	if(hotkeysEnabled) {
		Send {Alt}VG{Enter}{Alt}H{Esc 2}
		reload
	} else {
		Send g
	}
return

^= up:: ;zoom in
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}VI{Enter}{Alt}H{Esc 2}
		reload
	} else {
		Send {Ctrl}=
	}
return

^- up:: ;zoom out
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}VO{Enter}{Alt}H{Esc 2}
		reload
	} else {
		Send {Ctrl}-
	}
return

^0 up:: ;zoom 100%
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send {Alt}VM{Enter}{Alt}H{Esc 2}
		reload
	} else {
		Send {Ctrl}0
	}
return

^+z up:: ;redo
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		keywait, Shift ;wait until shift is released
		Send ^y
		reload
	} else {
		Send {Ctrl}{Shift}z
	}
return

m:: ;mirror
	if(hotkeysEnabled) {
		Send {Alt}HROH
		reload
	} else {
		Send m
	}
return

^q up:: ;quit
	if(hotkeysEnabled) {
		keywait, Ctrl ;wait until control is released
		Send !{F4}
		reload
	} else {
		Send {Ctrl}q
	}
return
