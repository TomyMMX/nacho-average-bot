# Description:
#   This file rperesents all of Nachos' different traits.
#   All of them together reresent all of the functionality he has.
#   A lot of it is just fun shit that makes up the loveable character Nacho is suposed to be.
#   But there are (or at lest we hope) some usefull parts that help when people spend a lot of time in Slack.

personality = require('../traits/personality')
carolSinger = require('../traits/carol-singer')
badWords = require('../traits/bad-words')
externalBot = require('../traits/external-bot')

module.exports = (robot) ->
    robot.receiveMiddleware (context, next, done) ->
        if personality.respond robot, context.response
            done()
        else if carolSinger.detect robot, context.response
            done()
        else if badWords.detect robot, context.response
            done()
        else if externalBot.respond robot, context.response
            done()
        else
            next(done)

    robot.hear /nacho/i, (res) ->
        res.send "Don't talk about me behind my back."