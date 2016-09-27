spaces = require("hs._asm.undocumented.spaces")

local Audio = require "audio"
local Media = require "media"


-- mash hotkeys
cmdAlt        = {"cmd", "alt"}
ctrlAlt       = {"ctrl", "alt"}
ctrlCmd       = {"ctrl", "cmd"}
mash 	        = {"cmd", "alt", "ctrl"}
mashShift     = {"ctrl", "alt", "shift"}
hyper         = {"cmd", "ctrl", "alt", "shift"}

-- require "pomodoor"
-- require "cheatsheet"
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
hs.grid.GRIDWIDTH 	= 6 -- Want thirds and halves
hs.grid.GRIDHEIGHT 	= 2 -- Only halfsies

-- takitapart window moving system.
-- up to two keycommands.

local firstKey = nil
local secondKey = nil

function takitapartWindowKeystroke(key)
  local win = hs.window.focusedWindow()

  if not firstKey then
    -- First key
    if key == "help" or key == "forwarddelete" then
      -- set window half left
      hs.grid.set(win, '0,0 3x2')
    elseif key == "home" then
      -- set window top half
      hs.grid.set(win, '0,0 6x1')
    elseif key == "end" then
      -- set window bottom half
      hs.grid.set(win, '0,1 6x1')
    elseif key == "pageup" or key == "pagedown" then
      -- set window half right
      hs.grid.set(win, '3,0 3x2')
    end

    -- save first key and set timeout
    firstKey = key
    hs.timer.doAfter(0.5, function() firstKey = nil secondKey = nil end)

  elseif not secondKey then
    -- Second key
    if (firstKey == "home" and key == "home") then
        -- top middle third
         hs.grid.set(win, '2,0 2x1')
    elseif (firstKey == "end" and key == "end") then
        -- bottom middle third
        hs.grid.set(win, '2,1 2x1')
    elseif (firstKey == "help" and key == "help") then
        -- upper left quarter
         hs.grid.set(win, '0,0 3x1')
    elseif (firstKey == "pageup" and key == "pageup") then
        -- upper right quarter
        hs.grid.set(win, '3,0 3x1')
    elseif (firstKey == "forwarddelete" and key == "forwarddelete") then
        -- lower left quarter
        hs.grid.set(win, '0,1 3x1')
    elseif (firstKey == "pagedown" and key == "pagedown") then
        -- lower right quarter
        hs.grid.set(win, '3,1 3x1')
    elseif (firstKey == "help" and key == "home") or
      (firstKey == "home" and key == "help") then
        -- upper left two thirds
        hs.grid.set(win, '0,0 4x1')
    elseif (firstKey == "pageup" and key == "home") or
      (firstKey == "home" and key == "pageup") then
        -- upper right two thirds
        hs.grid.set(win, '2,0 4x1')
    elseif (firstKey == "forwarddelete" and key == "end") or
      (firstKey == "end" and key == "forwarddelete") then
        -- lower left two thirds
        hs.grid.set(win, '0,1 4x1')
    elseif (firstKey == "end" and key == "pagedown") or
      (firstKey == "pagedown" and key == "end") then
        -- lower right two thirds
        hs.grid.set(win, '2,1 4x1')
    elseif (firstKey == "help" and key == "forwarddelete") or
      (firstKey == "forwarddelete" and key == "help") then
        -- left third
        hs.grid.set(win, '0,0 2x2')
    elseif (firstKey == "home" and key == "end") or
      (firstKey == "end" and key == "home") then
        -- middle third
        hs.grid.set(win, '2,0 2x2')
    elseif (firstKey == "pagedown" and key == "pageup") or
      (firstKey == "pageup" and key == "pagedown") then
        -- right third
        hs.grid.set(win, '4,0 2x2')
    elseif (firstKey == "help" and key == "pageup") or
      (firstKey == "pageup" and key == "help") then
        -- top half
        hs.grid.set(win, '0,0 6x1')
    elseif (firstKey == "pagedown" and key == "forwarddelete") or
      (firstKey == "forwarddelete" and key == "pagedown") then
        -- bottom half
        hs.grid.set(win, '0,1 6x1')
    elseif (firstKey == "help" and key == "end") or
      (firstKey == "end" and key == "help") or
      (firstKey == "forwarddelete" and key == "home") or
      (firstKey == "home" and key == "forwarddelete") then
        -- left two thirds
        hs.grid.set(win, '0,0 4x2')
    elseif (firstKey == "home" and key == "pagedown") or
      (firstKey == "pagedown" and key == "home") or
      (firstKey == "pageup" and key == "end") or
      (firstKey == "end" and key == "pageup") then
        -- right two thirds
        hs.grid.set(win, '2,0 4x2')
    elseif (firstKey == "help" and key == "pagedown") or
      (firstKey == "pagedown" and key == "help") or
      (firstKey == "pageup" and key == "forwarddelete") or
      (firstKey == "forwarddelete" and key == "pageup") then
        -- maximize
        hs.grid.maximizeWindow()
    end

    -- save second key and set timeout
    secondKey = key

  else

     -- Third key
     if (firstKey == "help" and secondKey == "help" and key == "help") then
        -- upper left third
         hs.grid.set(win, '0,0 2x1')
     elseif (firstKey == "forwarddelete" and secondKey == "forwarddelete" and key == "forwarddelete") then
        -- upper right third
        hs.grid.set(win, '0,1 2x1')
     elseif (firstKey == "pageup" and secondKey == "pageup" and key == "pageup") then
         -- lower left third
         hs.grid.set(win, '4,0 2x1')
     elseif (firstKey == "pagedown" and secondKey == "pagedown" and key == "pagedown") then
        -- lower right third
        hs.grid.set(win, '4,1 2x1')
     end

     firstKey = nil
     secondKey = nil

  end

end






-- Takitapart window commands
hs.hotkey.bind(mash, "home", function() takitapartWindowKeystroke("home") end)
hs.hotkey.bind(mash, "end", function() takitapartWindowKeystroke("end") end)
hs.hotkey.bind(mash, "help",  function() takitapartWindowKeystroke("help") end)
hs.hotkey.bind(mash, "pageup",  function() takitapartWindowKeystroke("pageup") end)
hs.hotkey.bind(mash, "forwarddelete",  function() takitapartWindowKeystroke("forwarddelete") end)
hs.hotkey.bind(mash, "pagedown",  function() takitapartWindowKeystroke("pagedown") end)

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
hs.hotkey.bind(mash, "F13", Media.previous)
hs.hotkey.bind(mash, "F14", Media.playpause)
hs.hotkey.bind(mash, "F15", Media.next)
