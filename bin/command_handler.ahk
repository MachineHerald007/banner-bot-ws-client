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
GLOBAL AVOID_AFK_DETECTION := A_ScriptDir "\avoid_afk_detection.exe"

SetKeyDelay, 1000, 100

Process,Close,login_ephinea.exe
Process,Close,avoid_afk_detection.exe

Sleep 5000
SWITCH COMMAND {
    CASE "bot_status":
                        GetBotStatus()
    CASE "change_ship":
                        WalkToCounterAndSelectTransport()
                        Send {Enter}
                        SWITCH VALUE {
                            CASE "fodra": FODRA(US_FODRA)
                            CASE "auldrant": AULDRANT(JP_AULDRANT)
                            CASE "lumireis": LUMIREIS(EU_LUMIREIS)
                            CASE "devaloka": DEVALOKA(US_DEVALOKA)
                        }
    CASE "change_block": 
                        WalkToCounterAndSelectTransport()
                        Send {Down}
                        Send {Enter}
                        ChangeBlock(VALUE)
    CASE "change_lobby":
                        ChangeLobby(VALUE)
}

Run %AVOID_AFK_DETECTION%
ExitApp