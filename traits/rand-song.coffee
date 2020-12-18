SpotifyWebApi = require('spotify-web-api-node');

detect = (robot, res) ->
    if res.message.rawMessage.text?.match(/music/i)
        res.send "I heard you guys like anoying music https://open.spotify.com/track/6habFhsOp2NvshLv26DqMb"


module.exports = { detect }