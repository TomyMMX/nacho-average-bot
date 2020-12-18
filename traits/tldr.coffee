
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
        Now GTFO with your nonsense\n"
                   

line = 0
tldrToWrite = null

writeTldr = () ->
  arrayOfLyricLines = tldrToWrite.split('\n')
  console.log arrayOfLyricLines[line]
  line += 1
  if line < arrayOfLyricLines.length
  	setTimeout(writeTldr, 1000)
  else
  	line = 0
  	tldrToWrite = null

detect = (robot, res) ->
    if res?.length > 100
    	tldrToWrite = tldr
    	setTimeout(writeTldr, 1000)
    else 
    	console.log "All good, you're within limits"

module.exports = { detect }