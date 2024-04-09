import * as dotenv from 'dotenv'
dotenv.config()

import WebSocket from "ws"
import pws from "pws"
import {
    getBotStatus,
    enableBot,
    disableBot,
    changeShip,
    changeBlock,
    changeLobby
} from "./src/commands/index.mjs"

const URL = process.env.WS_SERVER_ENDPOINT
const ws = pws(URL, WebSocket)

ws.on("error", console.error)
ws.on("open", function open() {
  ws.send("CONNECTED")
})
ws.on("message", function message(data) {
  const payload = JSON.parse(data)
  switch(payload.command) {
    case "bot_status":
        return
        // return getBotStatus(payload, ws)
    case "enable_bot":
        return enableBot(payload, ws)
    case "disable_bot":
        return disableBot(payload, ws)
    case "change_ship":
        return changeShip(payload, ws)
    case "change_block":
        return changeBlock(payload, ws)
    case "change_lobby":
        return
        // return changeLobby(payload, ws)
    default:
        return
  }
})