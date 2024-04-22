#NoEnv
#Persistent
#SingleInstance force

GLOBAL Pi := 3.141592653589793

; Function to calculate the arctangent of y/x, with correct signs in each quadrant
ATan2(y, x) {
    if (x = 0) {
        if (y > 0)
            return 90
        else if (y < 0)
            return -90
        else
            return 0
    }
    angle := atan(y / x) * (180 / Pi)
    if (x < 0)
        return angle + 180
    if (y < 0)
        return angle + 360
    return angle
}

Sqrt(x) {
    return x ** 0.5
}

IsInRange(value, minRange, maxRange) {
    return (value >= minRange && value <= maxRange)
}

Distance(x1, y1, z1, x2, y2, z2) {
    return Sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2 + (z2 - z1) ** 2)
}

Direction(x1, y1, z1, x2, y2, z2) {
    dx := x2 - x1
    dy := y2 - y1
    dz := z2 - z1
    
    angle_xy := ATan2(dy, dx)
    angle_xz := ATan2(dz, Sqrt(dx ** 2 + dy ** 2))
    
    return { "angle_xy": angle_xy, "angle_xz": angle_xz }
}