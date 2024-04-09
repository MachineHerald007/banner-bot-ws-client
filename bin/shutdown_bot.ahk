#NoEnv
#Persistent
#SingleInstance force

EPHINEA_FOLDER     := "C:\Users\" A_UserName "\EphineaPSO"
LOGGED_OUT_EXE     := EPHINEA_FOLDER "\logged_out.exe"
EXIT_AHK_PROCESSES := A_ScriptDir "\exit_ahk_processes.exe"

Process,Close,PsoBB.exe
Run %EXIT_AHK_PROCESSES%
Run %LOGGED_OUT_EXE%

ExitApp