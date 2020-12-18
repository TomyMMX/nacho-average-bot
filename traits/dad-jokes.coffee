## WORK IN PROGRESS / ideation phase
detect = (robot, res) ->
    if res.message.text?.match(/joke/i)
    	robot.http("https://icanhazdadjoke.com/search?term=hipster")
      .header('Accept', 'application/json')
      .get() (err, response, body) ->
      	console.log body
    else 
    	console.log "No joke for you today"

module.exports = { detect }