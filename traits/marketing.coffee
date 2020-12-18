detect = (robot, res) ->
    if res.message.rawMessage.text?.match(/marketing|colors|colours|gradients|bunny|css|'yellow lemon'|hex|rgb|transparent|nitro/i)
        res.send "OMG!!!! My marketing soulmate! We speak the same language"
        res.send "Have you seen this latest rebrand on Celtra? It is so awesome!" 
        res.send "Check this out and thank me later! The gradients are out of this world, not to mention the bunny!"
        res.send "https://celtra.com/blog/introducing-the-celtra-rebrand/"
        return true
    else
        return false

module.exports = { detect }
