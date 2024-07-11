; <^>!		AltGr
; #		Win
; !		Alt
; ^		Ctrl
; +		Shift

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
MSPaintIconsPath := "C:\Windows\SystemResources\mspaint.exe.mun" 
Menu, Tray, Icon, %MSPaintIconsPath%, -2 ; Sets a nice Paint icon for script in tray

; Made in AutoHotkey Version 1.1.33.09 
; by TechnicJelle (https://github.com/TechnicJelle/My-AutoHotKey-Scripts)
; Glauco: This script was edited for a german keyboard: z hotkeys are now with y
; TODO: Include colors as numbers hotkeys

#IfWinActive, ahk_class MSPaintApp

hotkeysEnabled := True

Handler(sendKey, defaultKey) {
    global hotkeysEnabled
    if (hotkeysEnabled) {
        Send %sendKey%
    } else {
        Send %defaultKey%
    }
}

; Hotkey definitions with comments
p::		Handler("{Alt}1", "p") 				; pencil
f::		Handler("{Alt}2", "f") 				; fill bucket
e::		Handler("{Alt}4", "e") 				; eraser
c::		Handler("{Alt}5", "c") 				; color picker
r::		Handler("{Alt}6", "r") 				; rect select
b::		Handler("{Alt}09{Enter}", "b") 			; brush
1::		Handler("{Alt}08{Enter}", "1") 			; line thickness 1
2::		Handler("{Alt}08{Down 1}{Enter}", "2") 		; line thickness 2
3::		Handler("{Alt}08{Down 2}{Enter}", "3") 		; line thickness 3
4::		Handler("{Alt}08{Down 3}{Enter}", "4") 		; line thickness 4
y::		Handler("{Alt}07{Enter}", "z") 			; color 1
x::		Handler("{Alt}06{Enter}", "x") 			; color 2
l::		Handler("{Alt}HSH{Enter}", "l") 		; line tool
o::		Handler("{Alt}HSH{Tab 2}{Enter}", "o") 		; oval tool
s::		Handler("{Alt}HSH{Tab 3}{Enter}", "s") 		; square tool
g::		Handler("{Alt}VG{Enter}{Alt}H{Esc 2}", "g") 	; gridlines
m::		Handler("{Alt}HROH", "m") 			; mirror
^+r up::	Handler("{Alt}7", "^+r") 			; free select
^+t up::	Handler("{Alt}8", "^+t")			; transparent selection
^i up::		Handler("{Alt}9", "^i")			     	; invert selection
^r up::		Handler("{Alt}VR{Enter}{Alt}H{Esc 2}", "^r") 	; rulers
^= up::		Handler("{Alt}VI{Enter}{Alt}H{Esc 2}", "^=") 	; zoom in
^- up::		Handler("{Alt}VO{Enter}{Alt}H{Esc 2}", "^-") 	; zoom out
^0 up::		Handler("{Alt}VM{Enter}{Alt}H{Esc 2}", "^0") 	; zoom 100%
^+y up::	Handler("^y", "^+z") 				; redo
^w up::		Handler("!{F4}", "^w") 				; exit

t:: ; text
    global hotkeysEnabled
    if (hotkeysEnabled) {
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
        Send t
    }
return

^q up:: ; quit without saving, but copy to clipboard
    global hotkeysEnabled
    if (hotkeysEnabled) {
        Send ^a
        Send ^c
        Send !{F4}{Tab}{Enter}
    } else {
        Send {Ctrl}q
    }
return
