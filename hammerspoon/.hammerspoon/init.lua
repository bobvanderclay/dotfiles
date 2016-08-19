-- Set grid size.
MARGINX = 15
MARGINY = 15

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + MARGINX
  f.y = max.y + MARGINY
  f.w = (max.w / 2) - (MARGINX * 1.5)
  f.h = max.h - (MARGINY * 2)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2) + (MARGINX / 2)
  f.y = max.y + MARGINY
  f.w = (max.w / 2) - (MARGINX * 1.5)
  f.h = max.h - (MARGINY * 2)
  win:setFrame(f)
end)
