local Audio = {}
local VOLUME_MIN = 0
local VOLUME_MAX = 100
local VOLUME_STEP = 5

local MODAL_TIMEOUT = 1
local MODAL_FADEIN_TIME = 0
local MODAL_FADEOUT_TIME = 0
local MODAL_W = 200
local MODAL_H = 200
local MODAL_MARGIN = 25
local ICON_W = 75
local ICON_H = 75
local MODAL_FROM_BOTTOM = 150

local modal = {
  drawing = nil,
  timer = nil
}

local deleteModal = function()
  modal.drawing.number:delete()
  modal.drawing.icon:delete()
  modal.drawing.background:delete()
  modal.drawing = nil
end

local updateTimer = function()
  if modal.timer then modal.timer:stop() end
  modal.timer = hs.timer.doAfter(MODAL_TIMEOUT, function() deleteModal() end)
end

local getIconImagePath = function()
  local imagePath = "./assets/volume/";

  local device = hs.audiodevice.defaultOutputDevice()
  local wasMuted = device:muted()
  local volume = device:volume()

  if wasMuted then
    return imagePath .. "volumeMute.eps"
  end

  if volume == VOLUME_MAX then
    return imagePath .. "volumeMax.eps"
  elseif volume == VOLUME_MIN then
    return imagePath .. "volumeMin.eps"
  end

  return imagePath .. "volume.eps"
end

local createModal = function(volume)
  local screenFrame = hs.screen.mainScreen():fullFrame()
  local modalX = (screenFrame.w / 2) - (MODAL_W / 2)
  local modalY = (screenFrame.h) - (MODAL_H + MODAL_FROM_BOTTOM)
  local iconX = (screenFrame.w / 2) - (ICON_W / 2)
  local iconY = (screenFrame.h) - (MODAL_H + MODAL_FROM_BOTTOM) + MODAL_MARGIN

  hs.drawing.disableScreenUpdates()
    modal.drawing = {
      background = hs.drawing.rectangle(hs.geometry(modalX, modalY, MODAL_W, MODAL_H))
        :setRoundedRectRadii(10, 10)
        :setStroke(false)
        :setFill(true)
        :setFillColor({white = 0.5, alpha= 0.75})
        :bringToFront()
        :show(MODAL_FADEIN_TIME),
      icon = hs.drawing.image(hs.geometry(iconX, iconY, ICON_W, ICON_H), getIconImagePath())
        :bringToFront(true)
        :show(MODAL_FADEIN_TIME),
      number = hs.drawing.text(hs.geometry(modalX, modalY+100, MODAL_W, MODAL_H), math.floor(volume))
        :setTextColor({white = 0, alpha = 1})
        :bringToFront(true)
        :setTextStyle({
            size = 72,
            alignment = "center"
        })
        :show(MODAL_FADEIN_TIME)
    }
  hs.drawing.enableScreenUpdates()

end

local updateModal = function(volume)
  updateTimer()
  hs.drawing.disableScreenUpdates()
    modal.drawing.background:hide(0):show(0)
    modal.drawing.icon:setImageFromPath(getIconImagePath()):hide(0):show(0)
    modal.drawing.number:setText(math.floor(volume)):hide(0):show(0)
  hs.drawing.enableScreenUpdates()
end

local showVolumeModal = function(volume)
  if not modal.drawing then
    createModal(volume)
  end
  updateModal(volume)
end

Audio.toggleMute = function()
  local device = hs.audiodevice.defaultOutputDevice()
  local wasMuted = device:muted()
  device:setMuted(not wasMuted)
  showVolumeModal(wasMuted and device:volume() or 0)
end

Audio.decVolume = function()
  local device = hs.audiodevice.defaultOutputDevice()
  local targetVolume = math.max(device:volume() - VOLUME_STEP, VOLUME_MIN)
  device:setMuted(false)
  device:setVolume(targetVolume)
  showVolumeModal(targetVolume)
end

Audio.incVolume = function()
  local device = hs.audiodevice.defaultOutputDevice()
  local targetVolume = math.min(device:volume() + VOLUME_STEP, VOLUME_MAX)
  device:setMuted(false)
  device:setVolume(targetVolume)
  showVolumeModal(targetVolume)
end

return Audio
