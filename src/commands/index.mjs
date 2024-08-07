import { spawn } from "child_process"

export const getBotStatus = async (payload, ws) => {
    console.log("PAYLOAD: ", payload)
    const child = spawn("cmd.exe", ["/c", "bot_status.bat"])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}

//on fail, send http post request to bot-worker
export const enableBot = async (payload, ws) => {
    console.log("PAYLOAD[enable_bot]: ", payload)
    let arg2 = ".\\bin\\open_ephinea.exe "

    payload.value.forEach(option => {
        arg2 += option.value + " "
    })

    const child = spawn("cmd.exe", ["/c", arg2])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}

export const disableBot = async (payload, ws) => {
    console.log("PAYLOAD: ", payload)
    const child = spawn("cmd.exe", ["/c", ".\\bin\\shutdown_bot.exe"])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}

export const changeShip = async (payload, ws) => {
    console.log("PAYLOAD: ", payload)
    const child = spawn("cmd.exe", ["/c", `.\\bin\\command_handler.exe change_ship ${payload.value[0].value}`])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}

export const changeBlock = async (payload, ws) => {
    console.log("PAYLOAD: ", payload)
    const child = spawn("cmd.exe", ["/c", `.\\bin\\command_handler.exe change_block ${payload.value[0].value}`])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}

export const changeLobby = async (payload, ws) => {
    console.log("PAYLOAD: ", payload)
    const child = spawn("cmd.exe", ["/c", ".\\bin\\shutdown_bot.exe"])

    child.stdout.on("data", function (data) {
        console.log("stdout: " + data)
    })

    child.stderr.on("data", function (data) {
        console.log("stderr: " + data)
    })

    child.on("exit", function (code) {
        console.log("child process exited with code " + code)
    })
}