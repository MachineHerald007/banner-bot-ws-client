#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\commands.ahk

GLOBAL SHIP                   := % A_Args.1
GLOBAL BLOCK                  := % A_Args.2
GLOBAL US_FODRA               := 0
GLOBAL JP_AULDRANT            := 1
GLOBAL EU_LUMIREIS            := 2
GLOBAL US_DEVALOKA            := 3
GLOBAL FODRA_DEFAULT_BLOCK    := 3 
GLOBAL AULDRANT_DEFAULT_BLOCK := 4
GLOBAL LUMIREIS_DEFAULT_BLOCK := 3
GLOBAL DEVALOKA_DEFAULT_BLOCK := 1
GLOBAL LOADING_SCREEN_WAIT    := 1000 * 15
GLOBAL INPUT_INTERVAL         := 1000 * 60 * 10

AccountLogin() {
    Send {Enter} 
    Send {Enter}
}

SelectChar() {
    Send {Enter}
    Send {Enter}
}

AvoidAFKDetection() {
   SetTimer, AvoidAFKDetection, %INPUT_INTERVAL%
   Send {Enter}
}

GetShipNumVal(ship) {
    SWITCH ship {
        CASE "fodra": return US_FODRA
        CASE "auldrant": return JP_AULDRANT
        CASE "lumireis": return EU_LUMIREIS
        CASE "devaloka": return US_DEVALOKA
        DEFAULT: return US_FODRA
    }
}

GetBlockNum(block) {
    if (!block) {
        return 
    }
}

SetKeyDelay, 1000, 150

WinWait, ahk_exe PsoBB.exe
    Sleep %LOADING_SCREEN_WAIT%
    AccountLogin()

    Sleep %LOADING_SCREEN_WAIT%
    Send {Enter}

    Sleep %LOADING_SCREEN_WAIT%
    SelectChar()

    Sleep %LOADING_SCREEN_WAIT%
    ; if no argument is passed, default is Fodra-block 3
    if (!SHIP) {
        FODRA(0)
    } else {
        if (!BLOCK) {
            SWITCH SHIP {
                CASE "fodra":    FODRA(US_FODRA)
                CASE "auldrant": AULDRANT(JP_AULDRANT)
                CASE "lumireis": LUMIREIS(EU_LUMIREIS)
                CASE "devaloka": DEVALOKA(US_DEVALOKA)
            }
        } else {
            SWITCH SHIP {
                CASE "fodra":    
                                if (BLOCK > FODRA_DEFAULT_BLOCK) {
                                    SelectShipAndBlock(US_FODRA, FODRA_DEFAULT_BLOCK)
                                } else {
                                    SelectShipAndBlock(US_FODRA, BLOCK)
                                }
                CASE "auldrant":
                                if (BLOCK >= AULDRANT_DEFAULT_BLOCK) {
                                    SelectShipAndBlock(JP_AULDRANT, AULDRANT_DEFAULT_BLOCK)
                                } else {
                                    BLOCK := BLOCK + 1
                                    SelectShipAndBlock(JP_AULDRANT, BLOCK)
                                }
                CASE "lumireis":
                                if (BLOCK >= LUMIREIS_DEFAULT_BLOCK) {
                                    SelectShipAndBlock(EU_LUMIREIS, LUMIREIS_DEFAULT_BLOCK)
                                } else {
                                    BLOCK := BLOCK + 1
                                    SelectShipAndBlock(EU_LUMIREIS, BLOCK)
                                }
                CASE "devaloka":
                                if (BLOCK >= DEVALOKA_DEFAULT_BLOCK) {
                                    SelectShipAndBlock(US_DEVALOKA, DEVALOKA_DEFAULT_BLOCK)
                                } else {
                                    BLOCK := BLOCK + 1
                                    SelectShipAndBlock(US_DEVALOKA, BLOCK)
                                }
            }
        }
    }

    AvoidAFKDetection()
WinWaitClose, ahk_exe PsoBB.exe
    ExitApp