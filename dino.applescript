-- returns a box within the bounds centered at {xPercent, yPercent}
on boundsToBox(theBounds, xPercent, yPercent, boxWidth, boxHeight)
	set chromeHeight to 110

	set windowRect to {¬
		item 1 of theBounds, ¬
		(item 2 of theBounds) + chromeHeight, ¬
		(item 3 of theBounds) - (item 1 of theBounds), ¬
		(item 4 of theBounds) - (item 2 of theBounds) - chromeHeight ¬
	}

	return {¬
		((item 3 of windowRect) * xPercent) + (item 1 of windowRect) - (boxWidth / 2), ¬
		((item 4 of windowRect) * yPercent) + (item 2 of windowRect) - (boxHeight / 2), ¬
		boxWidth, ¬
		boxHeight ¬
	}
end boundsToBox

-- concatenate list to string
on join(theList, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set joined to theList as string
	set AppleScript's text item delimiters to ""
	return joined
end join

-- send keypress to browser
on press(theKey)
	tell application "System Events" to tell process "Google Chrome"
		keystroke theKey
	end tell
end press

-- open the game
tell application "Google Chrome"
	open location "chrome://dino"
	set dinoBounds to the bounds of the front window
end tell
delay 1

-- start the game
press(space)
delay 3

-- a region a little in front of the dino and above the ground
set keyRect to join(boundsToBox(dinoBounds, 0.28, 0.59, 100, 50), ",")

repeat 300 times
	do shell script "screencapture -x -R " & keyRect & " /tmp/dino.png"
	-- get a 1x1 pixel average of the contents, it should be white
	set scriptOutput to do shell script "/usr/local/bin/convert /tmp/dino.png -scale 1x1\\! txt:- | egrep -o '#\\w+'"
	if scriptOutput is not "#FFFFFFFF" then -- obstacle
		press(space)
	end if
end repeat
