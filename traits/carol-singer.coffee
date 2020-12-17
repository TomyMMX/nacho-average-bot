detect = (robot, res) ->
    text = res.message.rawMessage.text
    
    return false

module.exports = { detect }