#NoEnv
#Persistent
#SingleInstance force

UP(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {w down}
    Sleep 300
    SendEvent {w up}
    PREV_KEY := "w"
}

LEFT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {a down}
    Sleep 1000
    SendEvent {a up}
    PREV_KEY := "a"
}

DOWN(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {s down}
    Sleep 100
    SendEvent {s up}
    PREV_KEY := "s"
}

RIGHT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {d down}
    Sleep 1000
    SendEvent {d up}
    PREV_KEY := "d"
}

UP_AND_RIGHT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {w down}
    SendEvent {d down}
    Sleep 300
    SendEvent {w up}
    SendEvent {d up}
    PREV_KEY := "wd"
}

UP_AND_LEFT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {w down}
    SendEvent {a down}
    Sleep 300
    SendEvent {w up}
    SendEvent {a up}
    PREV_KEY := "wa"
}


DOWN_AND_RIGHT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {s down}
    SendEvent {d down}
    Sleep 100
    SendEvent {s up}
    SendEvent {d down}
    PREV_KEY := "sd"
}

DOWN_AND_LEFT(x, y, z) {
    cache_coords(x, y, z)
    SendEvent {s down}
    SendEvent {a down}
    Sleep 100
    SendEvent {s up}
    SendEvent {a down}
    PREV_KEY := "sa"
}

position_camera() {
    SendEvent {Up down}
    Sleep 500
    SendEvent {Up up}

    SendEvent {Up down}
    Sleep 300
    SendEvent {Up up}
}

face_right() {
    SendEvent {d down}
    Sleep 100
    SendEvent {d up}
}

face_left() {
    SendEvent {a down}
    Sleep 100
    SendEvent {a up}
}

x_context(x) {

}

z_context(z) {

}

coords_check(x, y, z) {
    if (x ) {

    }
}

cache_coords(x, y, z) {
    COORDS_CACHE[1] := x
    COORDS_CACHE[2] := y
    COORDS_CACHE[3] := z
}

handle_spawn(x, y, z) {
    if (x == 0 && y == 20 && z == 135) {
        DOWN(x, y, z)
        position_camera()
    }

    if ((x > X_MIN_MAX[1] && x < X_MIN_MAX[2]) && y != 3) {
        UP(x, y, z)
    }
}

move_to_porter(x, y, z) {
    if ((x > X_MIN_MAX[1] && x < X_MIN_MAX[2]) && y != 3) {
        UP(x, y, z)
    }
}

handle_porter(x, y, z) {
    if ((x > X_MIN_MAX[1] && x < X_MIN_MAX[2])) {
        if (z < Z_MIN_MAX[1]) {
            UP(z, y, z)
        }
        if (z > Z_MIN_MAX[2]) {
            DOWN(z, y, z)
        }
        if (z > Z_MIN_MAX[1] && z < Z_MIN_MAX[2]) {
            ExitApp
        }
    }
}

handle_floor_context(x, y, z) {
    SWITCH y {
        CASE 0:
        CASE 3: handle_porter(x, y, z)
        CASE 20: handle_spawn(x, y, z)
        DEFAULT: move_to_porter(x, y, z)
    }
}