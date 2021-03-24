#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

f_12            := "excel,mspaint,MSPUB,outlook,PBIDesktop,powerpnt,VISIO,WINPROJ,winword"
control_s       := "SumatraPDF"
control_alt_s   := "notepad++"
control_shift_s := "atom,inkscape,Notepad,PaintDotNet,sublime_text,Typora"

loop parse, f_12, `,
    GroupAdd f_12, % "ahk_exe " A_LoopField ".exe"
loop parse, control_s, `,
    GroupAdd control_s, % "ahk_exe " A_LoopField ".exe"
loop parse, control_alt_s, `,
    GroupAdd control_alt_s, % "ahk_exe " A_LoopField ".exe"
loop parse, control_shift_s, `,
    GroupAdd control_shift_s, % "ahk_exe " A_LoopField ".exe"
GroupAdd control_shift_s, ahk_exe soffice.bin

#IfWinActive ahk_group control_shift_s
    ^F12::^+s
#IfWinActive ahk_group control_alt_s
    ^F12::^!s
#IfWinActive ahk_group control_s
    ^F12::^s
#IfWinActive ahk_group f_12
    ^F12::Send {F12}
#IfWinActive
