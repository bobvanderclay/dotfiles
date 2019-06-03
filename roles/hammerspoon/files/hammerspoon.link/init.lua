spaces = require("hs._asm.undocumented.spaces")

hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()

-- local Audio = require "audio"
-- local Media = require "media"
-- local Switcher = require "switcher"

-- mash hotkeys
cmdAlt        = {"cmd", "alt"}
ctrlAlt       = {"ctrl", "alt"}
ctrlCmd       = {"ctrl", "cmd"}
mash 	      = {"cmd", "alt", "ctrl"}
mashShift     = {"ctrl", "alt", "shift"}
hyper         = {"cmd", "ctrl", "alt", "shift"}

-- require "pomodoor"
-- require "cheatsheet"
-- require "highlight"

-- require "redshift"
require "spaces"
require "layout"
require "window"

hs.window.animationDuration = 0

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

-- Takitapart window commands
hs.hotkey.bind(mash, "home", function() takitapartWindowKeystroke("home") end)
hs.hotkey.bind(mash, "end", function() takitapartWindowKeystroke("end") end)
hs.hotkey.bind(mash, "help",  function() takitapartWindowKeystroke("help") end)
hs.hotkey.bind(mash, "pageup",  function() takitapartWindowKeystroke("pageup") end)
hs.hotkey.bind(mash, "forwarddelete",  function() takitapartWindowKeystroke("forwarddelete") end)
hs.hotkey.bind(mash, "pagedown",  function() takitapartWindowKeystroke("pagedown") end)
-- laptop variants
hs.hotkey.bind(mash, "i", function() takitapartWindowKeystroke("home") end)
hs.hotkey.bind(mash, "k", function() takitapartWindowKeystroke("end") end)
hs.hotkey.bind(mash, "u",  function() takitapartWindowKeystroke("help") end)
hs.hotkey.bind(mash, "o",  function() takitapartWindowKeystroke("pageup") end)
hs.hotkey.bind(mash, "j",  function() takitapartWindowKeystroke("forwarddelete") end)
hs.hotkey.bind(mash, "l",  function() takitapartWindowKeystroke("pagedown") end)

-- Move to next monitor / space
hs.hotkey.bind(mash, "up", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
  -- Move mouse with it, so we can use spaces commands on this screen.
  local rect = win:frame()
  local center = hs.geometry.rectMidPoint(rect)
  hs.mouse.setAbsolutePosition(center)
end)
hs.hotkey.bind(mash, "down", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
  -- Move mouse with it, so we can use spaces commands on this screen.
  local rect = win:frame()
  local center = hs.geometry.rectMidPoint(rect)
  hs.mouse.setAbsolutePosition(center)
end)
hs.hotkey.bind(mash, 'left', nil, function() moveToSpaceInDirection(hs.window.focusedWindow(), "west") end)
hs.hotkey.bind(mash, 'right', nil, function() moveToSpaceInDirection(hs.window.focusedWindow(), "east") end)

--
-- hs.hotkey.bind({ "alt" }, "tab", hs.hints.windowHints)

-- pomodoro key binding
-- hs.hotkey.bind(mash, "9", function() pom_enable() end)
-- hs.hotkey.bind(mash, "0", function() pom_disable() end)
-- hs.hotkey.bind(hyper, "0", function() pom_reset_work() end)

-- hs.hotkey.bind(mash, "tab", Switcher.activate)

local log = hs.logger.new('thing', 'debug')

-- System Volume.
-- hs.hotkey.bind({}, "F13", function() 
--     hs.eventtap.event.newSystemKeyEvent("MUTE", true):post()
--     hs.eventtap.event.newSystemKeyEvent("MUTE", false):post()
-- end)

-- hs.hotkey.bind({}, "F14", function() 
--     hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
--     hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
-- end)

-- hs.hotkey.bind({}, "F15", function() 
--     hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
--     hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
-- end)

-- Apollo Console.
hs.hotkey.bind({}, "F13", function() 
    -- print("here")
    hs.eventtap.keyStroke({"fn", "cmd"}, "F10")
end)

hs.hotkey.bind({}, "F14", function() 
    hs.eventtap.keyStroke({"fn", "cmd"}, "F11")
end)

hs.hotkey.bind({}, "F15", function() 
    hs.eventtap.keyStroke({"fn", "cmd"}, "F12")
end)

hs.hotkey.bind(mash, "F13", function ()
    hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()    
    hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()    
end)

hs.hotkey.bind(mash, "F14", function ()
    hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()    
    hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()    
end)

hs.hotkey.bind(mash, "F15", function ()
    hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()    
    hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()    
end)
