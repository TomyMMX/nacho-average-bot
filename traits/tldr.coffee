
tldr = "Do you really\n
        think\n
        anyone\n
        will\n
        read\n
        your\n
        long\n
        gibberish?\n
        Don't be a fucking boomer and use an emoji or a gif\n
        Like all normal people do!\n
        Now GTFO with your nonsense"

line = 0

detect = (robot, res) ->
    writeTldr = () ->
        if line == 0
            res.reply "TLDR; ??"
        lines = tldr.split('\n')
        res.send lines[line]
        line += 1
        if line < lines.length
            setTimeout(writeTldr, 600)

    if res.message.rawMessage.text?.length > 100
        line = 0
        setTimeout(writeTldr, 1000)
        return true

    return false

module.exports = { detect }