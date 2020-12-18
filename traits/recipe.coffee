rapidAPIKey = process.env.HUBOT_RAPID_API_KEY

inject = (robot, ctx, next) ->
    text = ctx.strings[0]
    match = text?.match(/I found a good recipe with (.*)/i)
    if match
        console.log match[1]

        robot.http("https://tasty.p.rapidapi.com/recipes/list?from=0&size=30&tags=under_30_minutes&q=" + match[1])
            .header('Content-Type', 'application/json')
            .header('x-rapidapi-key', rapidAPIKey)
            .header('x-rapidapi-host', 'tasty.p.rapidapi.com')
            .get() (err, response, body) ->
                if (err)
                    ctx.strings[0] = "Not really in the mood to search for recepies right now."
                    next()
                else
                    data = JSON.parse(body)
                    len = data.results.length

                    if len > 0
                        which = Math.floor(Math.random() * (len-1))
                        ctx.strings[0] = "I only have this one book..."
                        ctx.strings.push 'https://tasty.co/recipe/' + data.results[which].slug
                    else
                        ctx.strings[0] = "Not really in the mood to search for recepies right now."
                    next()
    else
        next()


module.exports = { inject }