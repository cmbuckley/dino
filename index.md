---
layout: showcase
title: dino
image:
  meta:
    src: /dino.png
    alt: Chrome Dino
---

I was inspired by a great [video of someone using a light sensor and a servo to play `chrome://dino`](https://imgur.com/gallery/u8bkoIX), so I decided that it must be pretty easy to make a software version of it!

The script starts the game and then repeatedly takes a screen shot a certain distance ahead of the dino. The screen shot it taken just above the path, so should be a single colour if there are no obstacles coming up. The script then counts the unique colours, and jumps if there is more than one.

## Requirements

* Written in AppleScript, so only works on Mac. (I found that AppleScript was the only thing that could open `chrome://dino` to begin with. I didn't originally intend on writing it all in AppleScript!)
* The script sends keystrokes and takes screen captures, so needs Accessibility and Screen Recording permissions.
* Uses [ImageMagick](https://imagemagick.org/) to calculate on-screen content.

## Limitations

* Assumes height of browser Chrome, which is probably only accurate if you have the Bookmarks Bar enabled.
* The capture location (based on window percentage) is probably very brittle.
* Manages to deal with birds, but may need to duck as well.
* Currently has no hope of working when it gets faster.
* Arbitrarily runs for 30 seconds and sends spaces to any active window. Should detect game over.

## Why?

Why the hell not?
