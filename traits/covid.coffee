detect = (robot, res) ->
    if res.message.rawMessage.text?.match(/kacin|covid|c19|covid-19|coronavirus|'corona virus'|koronavirus|korona|rona|corona|pandemic|epidemic|'social distance'|mask|PPI/i)
        res.send "You really wanna talk about this shit? Okay, if you think talking about will make you feel better sure, be my guest!"
        robot.http("https://api.covid19api.com/summary")
            .get() (err, response, body) ->
                if (err)
                    console.log "Error on the API"
                    next()
                else
                    data = JSON.parse(body)
                    res.send "Only today The World confirmed  " + data.Global.NewConfirmed + " cases!"
                    res.send "Which sets the total number at " + data.Global.TotalConfirmed
                    res.send "'Ohhh but these are just new cases, people are not dying from it!' - you say"
                    res.send "Only today " + data.Global.NewDeaths + " people died"
                    res.send "And in total over " + Math.floor(data.Global.TotalDeaths) + " have died"
                    res.send "Feeling better already?"
                    res.send "Stay at home, wash your hands and wear a mask, vaccine is on the way!"
                    res.send "Jelko would say - 'Naslednja dva tedna bosta kljucna'"
                    res.send "Of course I could be wrong, in that case I'm happy to redirect you to - https://www.facebook.com/PotrcMarko "     
        return true
    else
        return false

module.exports = { detect }
