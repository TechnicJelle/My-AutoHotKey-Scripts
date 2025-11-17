; Define the path to the mspaint.exe.mun file
munFile := "C:\Windows\SystemResources\mspaint.exe.mun"

; List of resource IDs (replace these with actual IDs from Resource Hacker/IconsExtract)
iconIDs := [2, 3, 4, 5]

; Function to set the tray icon and show feedback
SetTrayIcon(munFile, iconID) {
    global
    Menu, Tray, Icon, %munFile%, %iconID%
    if (ErrorLevel) {
        ToolTip, Error: Failed to load icon ID %iconID%
    } else {
        ToolTip, Successfully loaded icon ID %iconID%
    }
    Sleep, 2000  ; Show the tooltip for 2 seconds
    ToolTip  ; Clear the tooltip
}

; Function to cycle through the icons and provide feedback
CycleIcons() {
    global
    Loop {
        For index, iconID in iconIDs {
            ; Test using positive ID
            SetTrayIcon(munFile, iconID)
            ; Show tooltip and wait before changing to the next icon
            ToolTip, Testing icon ID %iconID%...
            Sleep, 2000
            ToolTip

            ; Optionally test using negative ID
            SetTrayIcon(munFile, -iconID)
            ToolTip, Testing negative icon ID %iconID%...
            Sleep, 2000
            ToolTip
        }
    }
}

; Start the icon cycling process
CycleIcons()
