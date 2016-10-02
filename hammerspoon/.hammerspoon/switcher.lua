Switcher = {
  wf = hs.window.filter.new(),
  chooser = hs.chooser.new(function(selected) end)
}


populateChooser = function()

  local choices = {}
  local windowList = Switcher.wf:getWindows()

  hs.fnutils.each(windowList, function(window)
    table.insert(choices, {
      ["text"] = window:title(),
      ["subText"] = window:application():title()
    })
  end)

  return choices

end

-- chooser = hs.chooser.new(function(selected) end)
-- chooser:choices(populateChooser)
Switcher.chooser:choices({{["text"] = "Only Choice"}})


Switcher.activate = function()
  Switcher.chooser:show()
end

return Switcher
