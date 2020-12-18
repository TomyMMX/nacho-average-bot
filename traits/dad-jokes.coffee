## WORK IN PROGRESS / ideation phase

robot = {}

detect = (robot, res) ->
    if res?.match(/joke/i)
    	robot.http("https://icanhazdadjoke.com/search?term=hipster")
      .header('Accept', 'application/json')
      .get(data) (err, response, body) ->
      	console.log data
    else 
    	console.log "No joke for you today"

res = "joke"
detect(robot, res)
detect(null, res)