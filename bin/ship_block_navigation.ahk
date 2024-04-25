#NoEnv
#Persistent
#SingleInstance force
#include %A_ScriptDir%\math_lib.ahk

UP(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    Sleep 30
    SendEvent {w up}
    PREV_MOVEMENT_KEY := "w"
}

LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {a down}
    Sleep 30
    SendEvent {a up}
    PREV_MOVEMENT_KEY := "a"
}

DOWN(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    Sleep 30
    SendEvent {s up}
    PREV_MOVEMENT_KEY := "s"
}

RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {d down}
    Sleep 30
    SendEvent {d up}
    PREV_MOVEMENT_KEY := "d"
}

UP_AND_RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    SendEvent {d down}
    Sleep 30
    SendEvent {w up}
    SendEvent {d up}
    PREV_MOVEMENT_KEY := "wd"
}

UP_AND_LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {w down}
    SendEvent {a down}
    Sleep 30
    SendEvent {w up}
    SendEvent {a up}
    PREV_MOVEMENT_KEY := "wa"
}


DOWN_AND_RIGHT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    SendEvent {d down}
    Sleep 30
    SendEvent {s up}
    SendEvent {d down}
    PREV_MOVEMENT_KEY := "sd"
}

DOWN_AND_LEFT(x, y, z) {
    CacheCoords(x, y, z)
    SendEvent {s down}
    SendEvent {a down}
    Sleep 30
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

MoveToCounter(x, y, z) {
    COUNTER_DISTANCE      := Distance(x, y, z, COUNTER_COORD[1], COUNTER_COORD[2], COUNTER_COORD[3])
    NORMAL_SPAWN_DISTANCE := Distance(x, y, z, P_SPAWN_COORD[1], P_SPAWN_COORD[2], P_SPAWN_COORD[3])
    RIGHT_SPAWN_DISTANCE  := Distance(x, y, z, R_SPAWN_COORD[1], R_SPAWN_COORD[2], R_SPAWN_COORD[3])
    LEFT_SPAWN_DISTANCE   := Distance(x, y, z, L_SPAWN_COORD[1], L_SPAWN_COORD[2], L_SPAWN_COORD[3])

    if ((COUNTER_DISTANCE >= -14 && COUNTER_DISTANCE < 14) && (z >= 53 && z <= 60)) {
        AT_COUNTER := TRUE
        return
    }

    if (IsInRange(NORMAL_SPAWN_DISTANCE, 0, 80) && POS_TYPE == "") {
        POS_TYPE := "to_counter"
    }

    if (IsInRange(RIGHT_SPAWN_DISTANCE, 0, 80) && POS_TYPE == "") {
        POS_TYPE := "r_spawn"
    }

    if (IsInRange(LEFT_SPAWN_DISTANCE, 0, 80) && POS_TYPE == "") {
        POS_TYPE := "l_spawn"
    }

    SWITCH POS_TYPE {
        CASE "r_spawn":
                            if (z < 56 && POS_TYPE != "to_r_norm") {
                                POS_TYPE := "to_r_norm"
                                FaceLeft()
                                PositionCamera()
                            } else if (x > 3) {
                                UP(x, y, z)
                            } else {
                                POS_TYPE := "to_counter"
                                FaceRight()
                                PositionCamera()
                            }
        CASE "l_spawn":
                            if (z < 56 && POS_TYPE != "to_l_norm") {
                                POS_TYPE := "to_l_norm"
                                FaceRight()
                                PositionCamera()
                            } else if (x < -3) {
                                UP(x, y, z)
                            } else {
                                POS_TYPE := "to_counter"
                                FaceLeft()
                                PositionCamera()
                            }
        case "to_counter":
                            if ((x > X_MIN_MAX[1] && x < X_MIN_MAX[2])) {
                                UP(x, y, z)
                            } else if (x < X_MIN_MAX[1]) {
                                RIGHT(x, y, z)
                            } else if (x > X_MIN_MAX[2]) {
                                LEFT(x, y, z)
                            }
        case "to_r_norm":
                            if (z < 56) {
                                UP(x, y, z)
                            } else {
                                POS_TYPE := "r_spawn"
                                FaceRight()
                                PositionCamera()
                            }
        case "to_l_norm":
                            if (z < 56) {
                                UP(x, y, z)
                            } else {
                                POS_TYPE := "l_spawn"
                                FaceLeft()
                                PositionCamera()
                            }
    }
}