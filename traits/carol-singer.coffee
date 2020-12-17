

belaSnezinkaLyric = "Ko sem te vprašal, me ljubiš\n
                    Si mi zmajala z glavo\n
                    Rekla mi nisi besede\n
                    Čakal zaman sem to\n
                    Sivi oblaki na nebu\n
                    Jasno nebo so zastrli\n
                    Bela snežinka, ki pada\n
                    Glej, prvi sneg\n
                    Sneg je, glej, zunaj sneg je\n
                    Morda se spomniš še enkrat name\n
                    Sneg je, glej, zunaj sneg je\n
                    Morda se spomniš še enkrat name\n
                    Bela snežinka, ki pada\n
                    Spominja me nate\n
                    In na vse tiste dni, noči\n
                    Bela snežinka, ki pada\n
                    Spominja me nate\n
                    In na vse tiste dni, noči\n
                    Ko sem te vprašal, me ljubiš\n
                    Si mi zmajala z glavo\n
                    Rekla mi nisi besede\n
                    Čakal zaman sem to\n
                    Sneg je, glej, zunaj sneg je\n
                    Morda se spomniš še enkrat name\n
                    Sneg je, glej, zunaj sneg je\n
                    Morda se spomniš še enkrat name\n
                    Bela snežinka, ki pada\n
                    Spominja me nate\n
                    In na vse tiste dni, noči\n
                    Bela snežinka, ki pada\n
                    Spominja me nate\n
                    In na vse tiste dni, noči\n
                    Bela snežinka, ki pada\n
                    Spominja me nate\n
                    In na vse tiste dni, noči\n
                    Bela snežinka, ki pada"
                    
jingleBellsLyrics = "Dashing through the snow\n
                    In a one-horse open sleigh\n
                    O'er the fields we go\n
                    Laughing all the way\n
                    Bells on bobtails ring\n
                    Making spirits bright\n
                    What fun it is to ride and sing\n
                    A sleighing song tonight\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh, hey\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh\n
                    A day or two ago\n
                    I thought I'd take a ride\n
                    And soon, Miss Fanny Bright\n
                    Was seated by my side\n
                    The horse was lean and lank\n
                    Misfortune seemed his lot\n
                    He got into a drifted bank\n
                    And then we got upsot\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh, hey\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh\n
                    A day or two ago\n
                    The story I must tell\n
                    I went out on the snow\n
                    And on my back I fell\n
                    A gent was riding by\n
                    In a one-horse open sleigh\n
                    He laughed as there I sprawling lie\n
                    But quickly drove away\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh, hey\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh\n
                    Now the ground is white\n
                    Go it while you're young\n
                    Take the girls tonight\n
                    And sing this sleighing song\n
                    Just get a bobtailed bay\n
                    Two forty as his speed\n
                    Hitch him to an open sleigh\n
                    And crack, you'll take the lead\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh, hey\n
                    Jingle bells, jingle bells\n
                    Jingle all the way\n
                    Oh, what fun it is to ride\n
                    In a one-horse open sleigh"

line = 0
lyricsToWrite = null
timeoutId = null

externalBot = require('../traits/external-bot')
detect = (robot, res) ->
    text = res.message.rawMessage.text

    writeLyricLine = () ->
        arrayOfLyricLines = lyricsToWrite.split('\n')
        res.send arrayOfLyricLines[line]
        line += 1
        if line < arrayOfLyricLines.length
            timeoutId = setTimeout(writeLyricLine, Math.floor((Math.random() * 3500) + 500);)
        else
            res.send "Did you like the song? I know some others too."
            line = 0
            lyricsToWrite = null

    doCarol = (song) ->
        lyricsToWrite = song
        timeoutId = setTimeout(writeLyricLine, 1000)

    if lyricsToWrite != null
        if res.message.text?.match(robot.respondPattern(''))
            if text?.match(/shut.*up/i)
                clearTimeout(timeoutId);
                lyricsToWrite = null
                line = 0
                res.message.rawMessage.text = "R8FkwwjF4rCCuFgEJRO3ShutUp"
                externalBot.respond robot, res
            else if text?.length > 0
                res.reply "Shh... I am not done with my song yet..."

        # We ignore all messages until the song is done
        return true

    if text?.match(/bela snežinka/i)
        res.send "Here is the sing-a-long for Bela Snežinka: https://www.youtube.com/watch?v=kCMHxUrCaHE"
        res.send "I really like it and you can join me while I sing it ;)"
        doCarol belaSnezinkaLyric
        return true
    else if text?.match(/jingle bells/i)
        res.send "Did you say Jingle Bells? https://www.youtube.com/watch?v=TvE2ExOFakk"
        doCarol jingleBellsLyrics
        return true

    return false

module.exports = { detect }