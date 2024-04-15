#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\navigation.ahk

GLOBAL IS_SPAWN_PERFECT = FALSE

GLOBAL Y_SPAWN := 20
GLOBAL Y_COMMAND_CENTER := 0

GLOBAL PREV_KEY := ""
GLOBAL COORDS_CACHE := [0, 0, 0]

GLOBAL X_MIN_MAX       := [-4.561, 9.104]
GLOBAL Y_LOBBY_PORTER  := 3
GLOBAL Z_MIN_MAX       := [230.766, 248.091]
GLOBAL IN_LOBBY_PORTER := FALSE
GLOBAL BOT_COORDS      := "C:\Users\" A_UserName "\EphineaPSO\addons\Coordinate Viewer\current_coordinates.txt"

Sleep 1000 * 3

while IN_LOBBY_PORTER == FALSE {
    loop, read, %BOT_COORDS%
        last_line := A_LoopReadLine 
        coords := StrSplit(last_line, ",")

        ; UNDER CONSTRUCTION
        handle_floor_context(coords.1, coords.2, coords.3)
}

ExitApp