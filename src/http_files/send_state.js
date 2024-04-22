require('dotenv').config()
const axios = require("axios")

function post_message(bot_state) {
    return axios({
        url: process.env.BANNER_BOT_WORKER_ENDPOINT,
        method: "POST",
        data: JSON.stringify({
            messages: [{
                msg: bot_state
            }]
        }),
        headers: {
            Authorization: `${process.env.QUEUE_AUTH_SECRET}`,
            "Content-Type": "application/json"
        }
    })
}

post_message(process.argv[2])
.then(res => console.log(res.data))
.catch(err => console.log(err))