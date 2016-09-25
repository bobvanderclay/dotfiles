-- Layouts


-- TODO: Determine which setup I'm running.

primaryDisplay = hs.screen'0,0'
secondayDisplay = hs.screen'1,0'

desktopLayout = {
  {"iTerm2", nil, secondayDisplay, hs.layout.right50, nil, nil},
  {"Finder", nil, secondayDisplay, hs.layout.left50, nil, nil},
}

hs.hotkey.bind(mash, 'L', function()
  hs.layout.apply(desktopLayout)
end)
