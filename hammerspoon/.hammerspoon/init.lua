spaces = require("hs._asm.undocumented.spaces")

local Audio = require "audio"
local Media = require "media"


-- mash hotkeys
ctrlAlt       = {"cmd", "alt"}
cmdAlt        = {"ctrl", "alt"}
ctrlCmd       = {"ctrl", "cmd"}
mash 	        = {"cmd", "alt", "ctrl"}
mashShift     = {"ctrl", "alt", "shift"}
hyper         = {"cmd", "ctrl", "alt", "shift"}

require "pomodoor"
require "cheatsheet"
require "highlight"
require "redshift"
require "spaces"
require "layout"
require "media"


-- reload configurations
----------------------------------------------------------
function reloadConfig()
	hs.alert.show("Config loaded")
	hs.reload()
end

-- reload config
hs.hotkey.bind(mash, "R",  reloadConfig)
hs.hotkey.bind(mash, "C", hs.toggleConsole)
hs.pathwatcher.new(".", reloadConfig):start()

-- Hide Dock Icon.
hs.dockicon.hide()

-- init grid
hs.grid.MARGINX 	= 15
hs.grid.MARGINY 	= 15
hs.grid.GRIDWIDTH 	= 2
hs.grid.GRIDHEIGHT 	= 2

--Move windows
hs.hotkey.bind(mash, "Down", hs.grid.pushWindowDown)
hs.hotkey.bind(mash, "Up", hs.grid.pushWindowUp)
hs.hotkey.bind(mash, "Left", hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, "Right", hs.grid.pushWindowRight)

--
hs.hotkey.bind({ "alt" }, "tab", hs.hints.windowHints)

-- pomodoro key binding
hs.hotkey.bind(mash, "9", function() pom_enable() end)
hs.hotkey.bind(mash, "0", function() pom_disable() end)
hs.hotkey.bind(hyper, "0", function() pom_reset_work() end)

-- volume keys
hs.hotkey.bind({}, "F13", Audio.toggleMute)
hs.hotkey.bind({}, "F14", Audio.decVolume)
hs.hotkey.bind({}, "F15", Audio.incVolume)

-- Spotify
hs.hotkey.bind(mash, "F14", Media.playpause)
hs.hotkey.bind(mash, "F13", Media.previous)
hs.hotkey.bind(mash, "F15", Media.next)
