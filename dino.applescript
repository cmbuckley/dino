-- window bounds are {x1, y1, x2, y2}, we want {x, y, w, h}
on boundsToRect(theBounds)
	set boxWidth to 100
	set boxHeight to 50

	set item 2 of theBounds to (item 2 of theBounds) + 110 -- remove window chrome
	set item 1 of theBounds to (((item 3 of theBounds) - (item 1 of theBounds)) * 0.27) + (item 1 of theBounds) - (boxWidth / 2)
	set item 2 of theBounds to (((item 4 of theBounds) - (item 2 of theBounds)) * 0.59) + (item 2 of theBounds) - (boxHeight / 2)
	set item 3 of theBounds to boxWidth
	set item 4 of theBounds to boxHeight
	return theBounds
end boundsToRect

-- concatenate list to string
on join(theList, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set joined to theList as string
	set AppleScript's text item delimiters to ""
	return joined
end join

-- open the game
tell application "Google Chrome"
	open location "chrome://dino"
	set dinoBounds to the bounds of the front window
end tell
delay 1

-- start the game
tell application "System Events" to tell process "Google Chrome"
	keystroke space
end tell
delay 3

-- a region a little in front of the dino and above the ground
set keyRect to join(boundsToRect(dinoBounds), ",")

repeat 300 times -- 30 seconds
	do shell script "screencapture -x -R " & keyRect & " /tmp/dino.png"
	-- get a 1x1 pixel average of the contents, it should be white
	set scriptOutput to do shell script "/usr/local/bin/convert /tmp/dino.png -scale 1x1\\! txt:- | egrep -o '#\\w+'"
	if scriptOutput is not "#FFFFFFFF" then -- obstacle
		tell application "System Events" to tell process "Google Chrome"
			keystroke space
		end tell
	end if
	delay 0.1
end repeat
