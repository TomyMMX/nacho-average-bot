## WORK IN PROGRESS / ideation phase
detect = (robot, res) ->
    if res.message.text?.match(/joke|jokes|funny|sala|vic/i)
      robot.http("https://icanhazdadjoke.com/")
      .header('Accept', 'application/json')
      .get() (err, response, body) ->
        res.send JSON.parse(body).joke
        return true
    return false


module.exports = { detect }

