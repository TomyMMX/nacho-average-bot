detect = (robot, res) ->
    if res.message.rawMessage.text?.match(/pug|pugs/i)
        robot.http("http://pugme.herokuapp.com/random").get() (err, response, body) ->
            res.send "Did someone say pug?"
            res.send JSON.parse(body).pug
        return true
    else
        return false

module.exports = { detect }

