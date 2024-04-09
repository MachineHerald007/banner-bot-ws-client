#NoEnv
#Persistent
#SingleInstance force

GLOBAL US_FODRA            := 0
GLOBAL JP_AULDRANT         := 1
GLOBAL EU_LUMIREIS         := 2
GLOBAL US_DEVALOKA         := 3
GLOBAL LOADING_SCREEN_WAIT := 1000 * 15
GLOBAL INPUT_INTERVAL      := 1000 * 60 * 10

AccountLogin() {
    Send {Enter} 
    Send {Enter}
}

SelectChar() {
    Send {Enter}
    Send {Enter}
}

SelectShipAndBlock(ship, block) {
    block := block - 1

    Send {Down %ship%}
    Send {Enter}
    Send {Down %block%}
    Send {Enter}
}

AvoidAFKDetection() {
   SetTimer, AvoidAFKDetection, %INPUT_INTERVAL%
   Send {Enter}
}

SetKeyDelay, 1000, 100

WinWait, ahk_exe PsoBB.exe
    Sleep %LOADING_SCREEN_WAIT%
    AccountLogin()

    Sleep %LOADING_SCREEN_WAIT%
    Send {Enter}

    Sleep %LOADING_SCREEN_WAIT%
    SelectChar()

    Sleep %LOADING_SCREEN_WAIT%
    SelectShipAndBlock(US_FODRA, 3)
    AvoidAFKDetection()
WinWaitClose, ahk_exe PsoBB.exe
    ExitApp