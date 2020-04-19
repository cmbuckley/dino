---
layout: showcase
title: dino
---

I was inspired by a great [video of someone using a light sensor and a servo to play `chrome://dino`](https://imgur.com/gallery/u8bkoIX), so I decided that it must be pretty easy to make a software version of it!

## Requirements

* Written in AppleScript, so only works on Mac. (I found that AppleScript was the only thing that could open `chrome://dino` to begin with. I didn't originally intend on writing it all in AppleScript!)
* The script sends keystrokes and takes screen captures, so needs Accessibility and Screen Recording permissions.
* Uses [ImageMagick](https://imagemagick.org/) to calculate on-screen content.

## Limitations

* Assumes height of browser Chrome, which is probably only accurate if you have the Bookmarks Bar enabled.
* The capture location (based on window percentage) is probably very brittle.
* I don't think it can deal with birds. (Probably needs to be able to duck as well.)
* Currently has no hope of working when it gets faster, let alone the "night stage".

## Why?

Why the hell not?
