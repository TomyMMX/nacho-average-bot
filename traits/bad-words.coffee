
Filter = require('bad-words')
filter = new Filter()

detect = (robot, res) ->
    isBad = filter.isProfane res.message.text
    if isBad
        # Detects a bad word on any of the channels he is on
        if !res.message.text?.match(robot.respondPattern(''))
            res.reply "I feel you have some unresolved anger issues today... here is a zen song on spotify that I think will help: https://open.spotify.com/track/7GhIk7Il098yCjg4BQjzvb"
        # Bad words are directed at Nacho
        else
            robot.http("https://evilinsult.com/generate_insult.php?lang=en&type=json").get() (err, response, body) ->
                res.send JSON.parse(body).insult
        return true
    else
        return false

module.exports = { detect }