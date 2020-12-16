module.exports = (robot) ->
  rapidAPIKey = process.env.HUBOT_RAPID_API_KEY
  robot.receiveMiddleware (context, next, done) ->
    data = JSON.stringify({
      content: context.response.message.text
    })
    robot.http("https://neutrinoapi-bad-word-filter.p.rapidapi.com/bad-word-filter")
      .header('Content-Type', 'application/json')
      .header('x-rapidapi-key', rapidAPIKey)
      .header('x-rapidapi-host', 'neutrinoapi-bad-word-filter.p.rapidapi.com')
      .header('useQueryString', 'true')
      .post(data) (err, response, body) ->

        isBad = JSON.parse(body)['is-bad']
        if isBad
          # Detects a bad word on any of the channels he is on
          if !context.response.message.text?.match(robot.respondPattern(''))
            context.response.reply "I feel you have some unresolved anger issues today... here is a zen song on spotify that I think will help: https://open.spotify.com/track/7GhIk7Il098yCjg4BQjzvb"
          # Bad words are directed at Nacho
          else
            robot.http("https://evilinsult.com/generate_insult.php?lang=en&type=json").get() (err, response, body) ->
              context.response.send JSON.parse(body).insult

    next(done)