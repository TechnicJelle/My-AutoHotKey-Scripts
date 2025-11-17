; <^>!\t\tAltGr
; #\t\tWin
; !\t\tAlt
; ^\t\tCtrl
; +\t\tShift

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
MSPaintIconsPath := "C:\Windows\SystemResources\mspaint.exe.mun"
Menu, Tray, Icon, %MSPaintIconsPath%, -2 ; Sets a nice Paint icon for script in tray

; Made in AutoHotkey Version 1.1.33.09
; by TechnicJelle (https://github.com/TechnicJelle/My-AutoHotKey-Scripts)
; Glauco: Edited for German keyboard: z hotkeys now y

#IfWinActive ahk_class MSPaintApp

Handler(sendKey, defaultKey) {
    if (sendKey != "")
        Send %sendKey%
    else
        Send %defaultKey%
}

; Hotkey definitions
p::    Handler("{Alt}1", "p")           ; pencil
f::    Handler("{Alt}2", "f")           ; fill bucket
e::    Handler("{Alt}4", "e")           ; eraser
c::    Handler("{Alt}5", "c")           ; color picker
r::    Handler("{Alt}6", "r")           ; rect select
b::    Handler("{Alt}09{Enter}", "b")    ; brush
1::    Handler("{Alt}08{Enter}", "1")    ; thickness 1
2::    Handler("{Alt}08{Down 1}{Enter}", "2")    ; thickness 2
3::    Handler("{Alt}08{Down 2}{Enter}", "3")    ; thickness 3
4::    Handler("{Alt}08{Down 3}{Enter}", "4")    ; thickness 4
y::    Handler("{Alt}07{Enter}", "z")     ; color 1
x::    Handler("{Alt}06{Enter}", "x")     ; color 2
l::    Handler("{Alt}HSH{Enter}", "l")     ; line tool
o::    Handler("{Alt}HSH{Tab 2}{Enter}", "o") ; oval
g::    Handler("{Alt}VG{Enter}{Alt}H{Esc 2}", "g") ; gridlines
m::    Handler("{Alt}HROH", "m")         ; mirror
^+r up::Handler("{Alt}7", "^+r")       ; free select
^+t up::Handler("{Alt}8", "^+t")       ; transparent select
^i up:: Handler("{Alt}9", "^i")        ; invert selection
^r up:: Handler("{Alt}VR{Enter}{Alt}H{Esc 2}", "^r") ; rulers
^= up:: Handler("{Alt}VI{Enter}{Alt}H{Esc 2}", "^=") ; zoom in
^- up:: Handler("{Alt}VO{Enter}{Alt}H{Esc 2}", "^-") ; zoom out
^0 up:: Handler("{Alt}VM{Enter}{Alt}H{Esc 2}", "^0") ; zoom 100%
^+y up::Handler("^y", "^+z")            ; redo
^w up:: Handler("!{F4}", "^w")         ; exit without save

; Text tool toggle: pause hotkeys during text editing
$t::
    Send {Alt}3               ; activate text tool
    Suspend, On                 ; disable other hotkeys
    KeyWait, LButton, D
    KeyWait, LButton, U
    KeyWait, LButton, D
    KeyWait, LButton, U
    Suspend, Off                ; re-enable hotkeys
    Send {Alt}6               ; deactivate text tool
return

^q up:: ; quick quit: copy all, then close without save
    Send ^a
    Send ^c
    Send !{F4}{Tab}{Enter}
return

; Cheatsheet: hold F1 to view available hotkeys
$*F1::
Gui, CheatGui:New, +AlwaysOnTop +ToolWindow -Caption
CheatText =
(
Available Hotkeys:
p: Pencil
f: Fill Bucket
e: Eraser
c: Color Picker
r: Rect Select
b: Brush
14: Line Thickness 14
y: Color 1
x: Color 2
l: Line Tool
o: Oval Tool
g: Gridlines
m: Mirror
Ctrl+Shift+r: Free Select
Ctrl+Shift+t: Transparent Select
Ctrl+i: Invert Selection
Ctrl+r: Rulers
Ctrl+=: Zoom In
Ctrl+-: Zoom Out
Ctrl+0: Zoom 100
Ctrl+Shift+y: Redo
Ctrl+w: Exit without save
t: Textbox
)
Gui, CheatGui:Add, Text,, %CheatText%
Gui, CheatGui:Show, AutoSize Center, Hotkey Cheatsheet
return

$*F1 up::
    Gui, CheatGui:Destroy
return

#If  ; Reset context-sensitivity
