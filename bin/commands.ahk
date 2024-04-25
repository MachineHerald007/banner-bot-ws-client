; This is a lib file, so it won't be compiled
#NoEnv

; defaults for all ships are their last blocks
; every ship but Fodra requires 1 less down input(don't ask me why)
GLOBAL FODRA_DEFAULT_BLOCK    := 3 
GLOBAL AULDRANT_DEFAULT_BLOCK := 4
GLOBAL LUMIREIS_DEFAULT_BLOCK := 3
GLOBAL DEVALOKA_DEFAULT_BLOCK := 1

FODRA(SHIP) {
    SelectShipAndBlock(SHIP, FODRA_DEFAULT_BLOCK)
}

AULDRANT(SHIP) {
    SelectShipAndBlock(SHIP, AULDRANT_DEFAULT_BLOCK)
}

LUMIREIS(SHIP) {
    SelectShipAndBlock(SHIP, LUMIREIS_DEFAULT_BLOCK)
}

DEVALOKA(SHIP) {
    SelectShipAndBlock(SHIP, DEVALOKA_DEFAULT_BLOCK)
}

SelectTransport() {
    ; opens counter menu
    Send {Enter}
    ; selects transport option
    Send {Down}
    Send {Enter}
}
 
SelectShipAndBlock(ship, block) {
    Send {Down %ship%}
    Send {Enter}
    ChangeBlock(block)
}

ChangeBlock(block) {
    block := block - 1
    Send {Down %block%}
    Send {Enter}
}

ChangeLobby(lobby_number) {
    Send {Down %lobby_number%}
    Send {Enter}
}

GetBotStatus() {

}