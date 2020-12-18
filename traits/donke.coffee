detect = (robot, res) ->
    if res.message.rawMessage.text?.match(/luka|doncic|'luka doncic'|ld77|77|ld|donke|donka|magic|goat/i)
        res.send "Did someone say GOAT?"
        robot.http("https://api-nba-v1.p.rapidapi.com/players/playerId/963")
            .header('Content-Type', 'application/json')
            .header('x-rapidapi-key', '757482f4d1mshaa1f0a3e2077150p1a75b2jsn32fd83c3730c')
            .header('x-rapidapi-host', 'api-nba-v1.p.rapidapi.com')
            .get() (err, response, body) ->
                if (err)
                    console.log "Error on the API"
                else
                    data = JSON.parse(body)
                    res.send "We are talking about " + data.api.players[0].lastName
                    res.send data.api.players[0].firstName 
                    res.send data.api.players[0].lastName
                    res.send "He is " + data.api.players[0].heightInMeters + "meter high"
                    res.send "A bit chubby at " + data.api.players[0].weightInKilograms + "kilograms"
                    res.send "He comes from the most beautiful country of " + data.api.players[0].country 
                    res.send "And please do remember the name and his jersey number " + "#" + data.api.players[0].leagues.standard.jersey    
                    res.send "Here is his song https://open.spotify.com/track/2uJA44kZqxZ6kW79Pjx36G?si=416snS3CQc-Mad70g05kqg"
                    res.send "And some highlights to make your day - https://www.youtube.com/watch?v=o7F_-80PIWs"
        return true
    else
        return false

module.exports = { detect }
