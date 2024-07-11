#SingleInstance force

Menu, Tray, Icon, C:\Windows\SystemResources\mspaint.exe.mun, 2 
Sleep 2000

Loop, 100
{
	Sleep, 500
	iconIndex := A_Index + 1  ; This makes the loop start at 2, avoiding errors
	try {
		Menu, Tray, Icon, C:\Windows\SystemResources\mspaint.exe.mun, %iconIndex% 
		ToolTip, Current icon is %iconIndex%
	} catch e {
		ToolTip, An exception was thrown at icon %iconIndex%!`nSpecifically: %e%
		Sleep, 1000
	}
}

Sleep, 2000 ; Wait a bit
ExitApp ; To exit after running
; Reload ; To reload everytime i save a change
