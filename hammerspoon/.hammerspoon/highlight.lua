-- From: https://github.com/jwkvam/hammerspoon-config/blob/master/init.lua

-- Highlight current

local BORDER_WIDTH = 10

function redrawBorder()
    win = hs.window.focusedWindow()
    if win ~= nil then
        top_left = win:topLeft()
        size = win:size()
        if global_border ~= nil then
            global_border:delete()
        end
        global_border = hs.drawing.rectangle(hs.geometry.rect(
          top_left['x']-(BORDER_WIDTH/2),
          top_left['y']-(BORDER_WIDTH/2),
          size['w']+(BORDER_WIDTH),
          size['h']+(BORDER_WIDTH)))
        global_border:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=0.75})
        global_border:setFill(false)
        global_border:setRoundedRectRadii(BORDER_WIDTH,BORDER_WIDTH)
        global_border:setLevel("floating")
        global_border:setStrokeWidth(BORDER_WIDTH)
        global_border:show()
    end
end

redrawBorder()

allwindows = hs.window.filter.new(nil)
allwindows:subscribe(hs.window.filter.windowCreated, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowFocused, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowMoved, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowUnfocused, function () redrawBorder() end)
