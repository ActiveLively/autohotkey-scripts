SetTitleMatchMode(2)  ; Allow partial matching of window titles
CoordMode("Mouse", "Window")  ; Use window (client area) coordinates for mouse clicks

Esc::ExitApp  ; Press Esc to exit the script at any time

; Define the loop to retry until confirmation
while true
{
    ; Wait for the initial window to load and activate
    if WinExist("Texas Football vs. Georgia | TexasSports.com")  ; Replace with a part of the window's title
    {
        WinActivate()  ; Activate the initial window
        WinWaitActive("Texas Football vs. Georgia | TexasSports.com")  ; Ensure the window is fully active
        Sleep(500)
        Click(1160, 590)  ; First click at (1160, 590) relative to the active window
        
        ; Wait for the new page to load
        WinWaitActive("New Page Title")  ; Replace with part of the new page title
        ; Once the new page is active, perform the next click
        Click(1160, 700)  ; Second click at (1160, 700) relative to the active window
        Sleep(500)  ; Wait a bit before proceeding to ensure stability
    }

    ; Check for the Confirmation window
    if WinExist("Confirmation")  ; Replace with part of the actual title
    {
        WinActivate()  ; Activate the Confirmation window
        MsgBox("Process completed. Exiting script.")
        ExitApp  ; Stop the script once confirmation is reached
    }

    ; Check for the "Try Again" window
    if WinExist("Sorry - Google Chrome")  ; Replace with a part of the actual title
    {
        WinActivate()  ; Activate the "Try Again" window
        WinWaitActive("Sorry - Google Chrome")  ; Ensure the window is fully active
        Sleep(500)
        Click(1050, 429)  ; Click the "Retry" button at coordinates (1050, 429)

        ; Wait for the page to load again after clicking retry
        WinWaitActive("Texas Football vs. Georgia | TexasSports.com")  ; Replace with part of the new page title
        ; Once it reloads, restart the process
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
