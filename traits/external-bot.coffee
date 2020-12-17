apiKey = process.env.HUBOT_PERSONALITY_API_KEY
apiSecret = process.env.HUBOT_PERSONALITY_API_SECRET

respond = (robot, res) ->
    if !res.message.text?.match(robot.respondPattern(''))
        return false

    message = {
        message : {
            message: res.message.rawMessage.text,
            chatBotID: 162159,
            timestamp: Math.floor(new Date().getTime() / 1000),
        },
        user: {
            firstName: res.message.user.name,
            lastName: '',
            gender: null,
            externalID: res.message.user.id
        }
    }
    messageJSON = JSON.stringify(message)
    hash = require("crypto").createHmac("sha256", apiSecret).update(messageJSON).digest("hex")

    url = "https://www.personalityforge.com/api/chat/?apiKey=" + apiKey + "&hash=" + hash + "&message=" + encodeURI(messageJSON)
    robot.http(url).get() (err, response, body) ->
        # robot.messageRoom "D01HEHW3TSM", "Debug: " + body

        msg = JSON.parse body

        if msg.success == 1
            res.send msg.message.message
        else
            res.send "shshshshshshshhshs... I ... can...can't... shshshs... hear .... driving .... tunnel .... shhshshsh ..."

    return true


module.exports = { respond }