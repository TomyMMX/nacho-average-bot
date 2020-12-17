# Quick and dirty way to test trait response functions locally
# Should be run with coffee and node
# Needs node.js > 10 and coffeescript installed globaly (sudo npm install --global coffeescript)
# runs with: coffee local/test.coffee <trait-name> <msg>
# Example: coffee local/test.coffee bad-words "nacho fuck you"
# This is really limited. It only mocks a few of the possible properties/functions in robot and res

HttpClient = require('scoped-http-client')

traitFile = process.argv[2]
message = process.argv[3]

trait = require('../traits/' + traitFile)

res = {
    reply: console.log,
    send: console.log,
    message: {
        text: message
        rawMessage : {
            text: message
        }
    }
}
robot = {
    respondPattern: (s) -> /^nacho/i
    http: (url, options) -> HttpClient.create(url, options).header('User-Agent', 'Hubot/123')
}


trait.detect(robot, res)