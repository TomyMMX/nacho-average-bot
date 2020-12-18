# Description:
#   This file rperesents all of Nachos' different traits.
#   All of them together reresent all of the functionality he has.
#   A lot of it is just fun shit that makes up the loveable character Nacho is suposed to be.
#   But there are (or at lest we hope) some usefull parts that help when people spend a lot of time in Slack.

personality = require('../traits/personality')
carolSinger = require('../traits/carol-singer')
badWords = require('../traits/bad-words')
externalBot = require('../traits/external-bot')
recipe = require('../traits/recipe')
pug = require('../traits/pug')

module.exports = (robot) ->
    robot.receiveMiddleware (context, next, done) ->
        if !context.response.message.rawMessage
            next(done)
        else if carolSinger.detect robot, context.response
            done()
        else if personality.respond robot, context.response
            done()
        else if badWords.detect robot, context.response
            done()
        else if pug.detect robot, context.response
            done()
        else if externalBot.respond robot, context.response
            done()
        else
            next(done)

    robot.responseMiddleware (context, next, done) ->
        recipe.inject robot, context, next

    robot.hear /nacho/i, (res) ->
        res.send "Don't talk about me behind my back."