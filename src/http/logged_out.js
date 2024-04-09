const axios = require("axios")

function postMessage() {
    return axios({
        url: process.env.BANNER_BOT_WORKER_ENDPOINT,
        method: "POST",
        data: JSON.stringify({
            messages: [{
                msg: "LOGGED_OUT"
            }]
        }),
        headers: {
            Authorization: `${process.env.QUEUE_AUTH_SECRET}`,
            "Content-Type": "application/json"
        }
    })
}

postMessage()
.then(res => console.log(res.data))
.catch(err => console.log(err))