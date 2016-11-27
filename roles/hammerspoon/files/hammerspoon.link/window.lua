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
