#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\math_lib.ahk

UP(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    Sleep 50
    SendEvent {w up}
    PREV_MOVEMENT_KEY := "w"
}

LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {a down}
    Sleep 50
    SendEvent {a up}
    PREV_MOVEMENT_KEY := "a"
}

DOWN(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    Sleep 50
    SendEvent {s up}
    PREV_MOVEMENT_KEY := "s"
}

RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {d down}
    Sleep 50
    SendEvent {d up}
    PREV_MOVEMENT_KEY := "d"
}

UP_AND_RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    SendEvent {d down}
    Sleep 50
    SendEvent {w up}
    SendEvent {d up}
    PREV_MOVEMENT_KEY := "wd"
}

UP_AND_LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    SendEvent {a down}
    Sleep 50
    SendEvent {w up}
    SendEvent {a up}
    PREV_MOVEMENT_KEY := "wa"
}


DOWN_AND_RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    SendEvent {d down}
    Sleep 50
    SendEvent {s up}
    SendEvent {d down}
    PREV_MOVEMENT_KEY := "sd"
}

DOWN_AND_LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    SendEvent {a down}
    Sleep 50
    SendEvent {s up}
    SendEvent {a down}
    PREV_MOVEMENT_KEY := "sa"
}

PositionCamera() {
    SendEvent {Up down}
    Sleep 500
    SendEvent {Up up}

    SendEvent {Up down}
    Sleep 300
    SendEvent {Up up}
}

FaceRight() {
    SendEvent {d down}
    Sleep 250
    SendEvent {d up}
    PREV_MOVEMENT_KEY := "d"
}

FaceLeft() {
    SendEvent {a down}
    Sleep 250
    SendEvent {a up}
    PREV_MOVEMENT_KEY := "a"
}

CacheCoords(x, y, z) {
    COORDS_CACHE[1] := x
    COORDS_CACHE[2] := y
    COORDS_CACHE[3] := z
}

MoveToPorter(x, y, z) {
    PORTER_DISTANCE       := Distance(x, y, z, PORTER_COORD[1], PORTER_COORD[2], PORTER_COORD[3])
    NORMAL_SPAWN_DISTANCE := Distance(x, y, z, P_SPAWN_COORD[1], P_SPAWN_COORD[2], P_SPAWN_COORD[3])
    RIGHT_SPAWN_DISTANCE  := Distance(x, y, z, R_SPAWN_COORD[1], R_SPAWN_COORD[2], R_SPAWN_COORD[3])
    LEFT_SPAWN_DISTANCE   := Distance(x, y, z, L_SPAWN_COORD[1], L_SPAWN_COORD[2], L_SPAWN_COORD[3])

    if (IsInRange(PORTER_DISTANCE, 2.5, 11)) {
        IN_LOBBY_PORTER := TRUE
        return
    }

    if (IsInRange(NORMAL_SPAWN_DISTANCE, 0, 50) && POS_TYPE == "") {
        POS_TYPE := "to_porter"
        DOWN(x, y, z)
        PositionCamera()
        SendEvent {a down}
        Sleep 30
        SendEvent {a up}
        PositionCamera()
    }

    if (IsInRange(RIGHT_SPAWN_DISTANCE, 0, 50) && POS_TYPE == "") {
        POS_TYPE := "r_spawn"
    }

    if (IsInRange(LEFT_SPAWN_DISTANCE, 0, 50) && POS_TYPE == "") {
        POS_TYPE := "l_spawn"
    }

    SWITCH POS_TYPE {
        CASE "r_spawn":
                        if (PORTER_DISTANCE > 208) {
                            UP_AND_LEFT(x, y, z)
                        } else if (x > 3) {
                            UP(x, y, z)
                        } else {
                            POS_TYPE := "to_porter"
                            FaceLeft()
                            PositionCamera()
                        }
        CASE "l_spawn":
                        if (PORTER_DISTANCE > 208) {
                            UP_AND_RIGHT(x, y, z)
                        } else if (x < -6) {
                            UP(x, y, z)
                        } else {
                            POS_TYPE := "to_porter"
                            FaceRight()
                            PositionCamera()
                        }
        case "to_porter":
                        if ((x > X_MIN_MAX[1] && x < X_MIN_MAX[2]) && PORTER_DISTANCE > 10) {
                            UP(x, y, z)
                        } else if (x < X_MIN_MAX[1]) {
                            LEFT(x, y, z)
                        } else if (x > X_MIN_MAX[2]) {
                            RIGHT(x, y, z)
                        }
    }
}
