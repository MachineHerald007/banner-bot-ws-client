#NoEnv
#Persistent
#SingleInstance force

GLOBAL INPUT_INTERVAL := 1000 * 60 * 10

AvoidAFKDetection() {
   SetTimer, AvoidAFKDetection, %INPUT_INTERVAL%
   Send {Enter}
}

SetKeyDelay, 1000, 100
WinWait, ahk_exe PsoBB.exe
    AvoidAFKDetection()
WinWaitClose, ahk_exe PsoBB.exe
    ExitApp