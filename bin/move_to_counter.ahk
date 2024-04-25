#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\commands.ahk
#include %A_ScriptDir%\ship_block_navigation.ahk

GLOBAL COMMAND               := % A_Args.1
GLOBAL VALUE                 := % A_Args.2

GLOBAL US_FODRA              := 0
GLOBAL JP_AULDRANT           := 1
GLOBAL EU_LUMIREIS           := 2
GLOBAL US_DEVALOKA           := 3

GLOBAL POS_TYPE              := ""
GLOBAL PREV_MOVEMENT_KEY     := ""
GLOBAL COUNTER_DISTANCE      := 0
GLOBAL NORMAL_SPAWN_DISTANCE := 0
GLOBAL RIGHT_SPAWN_DISTANCE  := 0
GLOBAL LEFT_SPAWN_DISTANCE   := 0
GLOBAL AT_COUNTER            := FALSE
GLOBAL COORDS_CACHE          := [0, 0, 0]
GLOBAL X_MIN_MAX             := [-11.4, 12.481]
GLOBAL Z_MIN_MAX             := [57.635, 58.472]
GLOBAL P_SPAWN_COORD         := [0, 20, 135]
GLOBAL R_SPAWN_COORD         := [105, 20, 48]
GLOBAL L_SPAWN_COORD         := [-105, 20, 48]
GLOBAL COUNTER_COORD         := [0, 0, 58.500]
GLOBAL BOT_COORDS            := "C:\Users\" A_UserName "\EphineaPSO\addons\Coordinate Viewer\current_coordinates.txt"
GLOBAL COMMAND_HANDLER       := A_ScriptDir "\command_handler.ahk"

SetKeyDelay, 1000, 150
Sleep 2000

while AT_COUNTER == FALSE {
    loop, read, %BOT_COORDS%
        last_line := A_LoopReadLine 
        coords := StrSplit(last_line, ",")
        MoveToCounter(coords.1, coords.2, coords.3)
}

if (COMMAND == "change_ship") {
    SelectTransport()
    Send {Enter}
    SWITCH VALUE {
        CASE "fodra": FODRA(US_FODRA)
        CASE "auldrant": AULDRANT(JP_AULDRANT)
        CASE "lumireis": LUMIREIS(EU_LUMIREIS)
        CASE "devaloka": DEVALOKA(US_DEVALOKA)
    }
} else {
    SelectTransport()
    Send {Down}
    Send {Enter}
    ChangeBlock(VALUE)
}

ExitApp