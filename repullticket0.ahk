SetTitleMatchMode(2)  ; Allow partial matching of window titles
CoordMode("Mouse", "Window")  ; Use window (client area) coordinates for mouse clicks

Esc::ExitApp  ; Press Esc to exit the script at any time

; Define the loop to retry until confirmation
while true
{
    ; Activate the initial window and perform clicks
    if WinExist("Texas Football vs. Georgia | TexasSports.com")  ; Replace with a part of the window's title
    {
        WinActivate()  ; Activate the initial window
        WinWaitActive("Texas Football vs. Georgia | TexasSports.com")  ;
        Sleep(500)
        Click(1160, 590)  ; First click at (1160, 590) relative to the active window
        Sleep(1000)
        Click(1160, 700)  ; Second click at (1160, 700) relative to the active window
        Sleep(500)  ; Wait for the next window to load
    }

    ; Check for the Confirmation window first
    if WinExist("Confirmation")  ; Replace with part of the actual title
    {
        WinActivate()  ; Activate the Confirmation window
        MsgBox("Process completed. Exiting script.")
        ExitApp  ; Stop the script once confirmation is reached
    }

    ; Check for the Try Again window
    if WinExist("Sorry - Google Chrome")  ; Replace with a part of the actual title
    {
        WinActivate()  ; Activate the "Try Again" window
        WinWaitActive("Sorry - Google Chrome")  ;
        Sleep(500)
        Click(1050, 429)  ; Click the "Retry" button at coordinates (1050, 429)
        Sleep(500)  ; Wait before retrying the process
    }
    else
    {
        ; Get the current active window title in AutoHotkey v2.0
        currentWindowTitle := WinGetTitle("A")  ; "A" refers to the active window
        MsgBox("Unexpected window. Current window title: " . currentWindowTitle)
        ExitApp
    }
}
