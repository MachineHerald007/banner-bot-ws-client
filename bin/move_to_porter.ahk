#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\commands.ahk
#include %A_ScriptDir%\lobby_navigation.ahk

GLOBAL LOBBY_NUMBER          := % A_Args.1

GLOBAL POS_TYPE              := ""
GLOBAL PREV_MOVEMENT_KEY     := ""
GLOBAL PORTER_DISTANCE       := 0
GLOBAL NORMAL_SPAWN_DISTANCE := 0
GLOBAL RIGHT_SPAWN_DISTANCE  := 0
GLOBAL LEFT_SPAWN_DISTANCE   := 0
GLOBAL IN_LOBBY_PORTER       := FALSE
GLOBAL COORDS_CACHE          := [0, 0, 0]
GLOBAL X_MIN_MAX             := [-6.960, 9.104]
GLOBAL Z_MIN_MAX             := [231, 248.091]
GLOBAL P_SPAWN_COORD         := [0, 20, 135]
GLOBAL R_SPAWN_COORD         := [105, 20, 48]
GLOBAL L_SPAWN_COORD         := [-105, 20, 48]
GLOBAL PORTER_COORD          := [5.388, 3.000, 240.00]
GLOBAL BOT_COORDS            := "C:\Users\" A_UserName "\EphineaPSO\addons\Coordinate Viewer\current_coordinates.txt"

while IN_LOBBY_PORTER == FALSE {
    loop, read, %BOT_COORDS%
        last_line := A_LoopReadLine 
        coords := StrSplit(last_line, ",")
        MoveToPorter(coords.1, coords.2, coords.3)
}
ChangeLobby(LOBBY_NUMBER)
ExitApp