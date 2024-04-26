#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\commands.ahk

GLOBAL US_FODRA            := 0
GLOBAL JP_AULDRANT         := 1
GLOBAL EU_LUMIREIS         := 2
GLOBAL US_DEVALOKA         := 3
GLOBAL COMMAND             := % A_Args.1
GLOBAL VALUE               := % A_Args.2
GLOBAL MOVE_TO_PORTER      := A_ScriptDir "\move_to_porter.ahk"
GLOBAL MOVE_TO_COUNTER     := A_ScriptDir "\move_to_counter.ahk"
GLOBAL AVOID_AFK_DETECTION := A_ScriptDir "\avoid_afk_detection.exe"

SetKeyDelay, 1000, 100

Process,Close,login_ephinea.exe
Process,Close,avoid_afk_detection.exe

Sleep 3000
SWITCH COMMAND {
    CASE "bot_status":
                        GetBotStatus()
    CASE "change_ship":
                        Run %MOVE_TO_COUNTER% %COMMAND% %VALUE%
    CASE "change_block":
                        Run %MOVE_TO_COUNTER% %COMMAND% %VALUE%
    CASE "change_lobby":
                        Run %MOVE_TO_PORTER% %VALUE%
}
Run %AVOID_AFK_DETECTION%
ExitApp