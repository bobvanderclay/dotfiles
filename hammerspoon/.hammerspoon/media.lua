-- FROM: https://gist.github.com/tdlm/60297192cbfea99bd132

local Media = {}

-- Config
local SPOTIFY_ENABLED = true
local ITUNES_ENABLED = true
local DEFAULT_APP = "spotify"
local MENUBAR_REFRESH_TIME = 5

--
local activeApp = false
local menuBar = hs.menubar.new()
menuBar:stateImageSize({w=10,h=10})
local imagePath = "./assets/media/";
local onStateImage = hs.image.imageFromPath(imagePath .. "play.eps")
local offStateImage = hs.image.imageFromPath(imagePath .. "paused.eps")
local itunesIcon = hs.image.imageFromPath(imagePath .. "itunes.eps"):setSize({w=16,h=16})
local spotifyIcon = hs.image.imageFromPath(imagePath .. "spotify.eps"):setSize({w=16,h=16})

-- Pick running app, or default.
local getActiveApp = function()

  local spotifyActive = false
  local itunesActive = false

  if SPOTIFY_ENABLED then
    if hs.spotify.isPlaying() then
      spotifyActive = true
    end
  end
  if ITUNES_ENABLED then
    if hs.itunes.isPlaying() then
      itunesActive = true
    end
  end

  if spotifyActive and not itunesActive then
    activeApp = "spotify"
  elseif itunesActive and not spotifyActive then
    activeApp = "itunes"
  else
    if not activeApp then
      activeApp = DEFAULT_APP
    end
  end

  return activeApp

end

local buildMenuIcon = function()

  local icon = ''

  local activeApp = getActiveApp()
  if activeApp == "itunes" then
    icon = itunesIcon
  elseif activeApp == "spotify" then
    icon = spotifyIcon
  end

  menuBar:setIcon(icon)

end

local getCurrentTrack = function()
  local activeApp = getActiveApp()
  if activeApp == "itunes" then
    return hs.itunes.getCurrentTrack()
  elseif activeApp == "spotify" then
    return hs.spotify.getCurrentTrack()
  else
    return ""
  end
end

local getCurrentArtist = function()
  local activeApp = getActiveApp()
  if activeApp == "itunes" then
    return hs.itunes.getCurrentArtist()
  elseif activeApp == "spotify" then
    return hs.spotify.getCurrentArtist()
  else
    return ""
  end
end

local getPlayPauseIndicator = function(app)
  if not app then
    app = getActiveApp()
  end

  if app == "itunes" then
    local playbackState = hs.itunes.getPlaybackState()
    if playbackState == hs.itunes.state_playing then
      return "►"
    elseif playbackState == hs.itunes.state_paused then
      return "❙❙"
    else
      return "◼"
    end
  elseif app == "spotify" then
    local playbackState = hs.spotify.getPlaybackState()
    if playbackState == hs.spotify.state_playing then
      return "►"
    elseif playbackState == hs.spotify.state_paused then
      return "❙❙"
    else
      return "◼"
    end
  else
    return ""
  end
end

local buildMenuTitle = function()
  local track = hs.styledtext.new(getCurrentTrack(), {
    font = {
      -- name = ".AppleSystemUIFontItalic",
      size = 13
    },
    paragraphStyle = {

    }
  })

  local artist = hs.styledtext.new("  " .. getCurrentArtist() .. " - ", {
    font = {
      size = 13
    }
  })

  local indicator = hs.styledtext.new("   " .. getPlayPauseIndicator(), {
    font = {
      size = 11
    }
  })

  menuBar:setTitle(artist .. track .. indicator)
end

local setActiveApp = function(app)
  if app == "itunes" and ITUNES_ENABLED then
    hs.spotify.pause()
    hs.itunes.playpause()
    activeApp = "itunes"
  elseif app == "spotify" and SPOTIFY_ENABLED then
    hs.itunes.pause()
    hs.spotify.playpause()
    activeApp = "spotify"
  else
    activeApp = getActiveApp()
  end
end

local nowPlayingStyled = function(app)

  local trackText, artistText, albumText

  if app == 'itunes' then
    trackText = hs.itunes.getCurrentTrack()
    artistText = hs.itunes.getCurrentArtist()
    albumText = hs.itunes.getCurrentAlbum()
  else
    trackText = hs.spotify.getCurrentTrack()
    artistText = hs.spotify.getCurrentArtist()
    albumText = hs.spotify.getCurrentAlbum()
  end

  local track = hs.styledtext.new(trackText .. '\n', {
    font = {
      name = ".AppleSystemUIFontBold",
      size = 13
    }
  })

  local artist = hs.styledtext.new(artistText .. '\n', {
    font = {
      size = 13
    }
  })

  local album = hs.styledtext.new(albumText, {
    font = {
      name = ".AppleSystemUIFontItalic",
      size = 13
    }
  })



  return track .. artist .. album

end

buildMenu = function()

  getActiveApp()
  buildMenuIcon()
  buildMenuTitle()

  local menuItems = {}

  if ITUNES_ENABLED then
    local state
    if hs.itunes.isPlaying() then
      state = "on"
    else
      state = "off"
    end
    table.insert(menuItems, {
        image = itunesIcon,
        title = nowPlayingStyled('itunes'),
        state = state,
        onStateImage = onStateImage,
        offStateImage = offStateImage,
        fn = function() setActiveApp("itunes") buildMenu() end
    })
    table.insert(menuItems, {
      title = "-"
    })
  end

  if SPOTIFY_ENABLED then
    local state
    if hs.spotify.isPlaying() then
      state = "on"
    else
      state = "off"
    end
    table.insert(menuItems, {
        image = spotifyIcon,
        title = nowPlayingStyled('spotify'),
        state = state,
        onStateImage = onStateImage,
        offStateImage = offStateImage,
        fn = function() setActiveApp("spotify") buildMenu() end
    })
    table.insert(menuItems, {
        title = "-"
    })
  end

  menuBar:setMenu(menuItems)

  buildMenuTimer = hs.timer.doAfter(MENUBAR_REFRESH_TIME, function() buildMenu() end)

end


Media.init = function()
  buildMenu()
end

Media.close = function()

end

Media.getCurrentAlbum = function()
  if activeApp == "itunes" then
    hs.itunes.getCurrentAlbum()
  elseif activeApp == "spotify" then
    hs.spotify.getCurrentAlbum()
  end
end

Media.getCurrentArtist = function()
  if activeApp == "itunes" then
    hs.itunes.getCurrentArtist()
  elseif activeApp == "spotify" then
    hs.spotify.getCurrentArtist()
  end
end

Media.getCurrentTrack = function()
  if activeApp == "itunes" then
    hs.itunes.getCurrentTrack()
  elseif activeApp == "spotify" then
    hs.spotify.getCurrentTrack()
  end
end

Media.next = function()
  if activeApp == "itunes" then
    hs.itunes.next()
  elseif activeApp == "spotify" then
    hs.spotify.next()
  end
end

Media.previous = function()
  if activeApp == "itunes" then
    hs.itunes.previous()
  elseif activeApp == "spotify" then
    hs.spotify.previous()
  end
end

Media.play = function()
  if activeApp == "itunes" then
    hs.itunes.play()
  elseif activeApp == "spotify" then
    hs.spotify.play()
  end
end

Media.pause = function()
  if activeApp == "itunes" then
    hs.itunes.pause()
  elseif activeApp == "spotify" then
    hs.spotify.pause()
  end
end

Media.playpause = function()
  if activeApp == "itunes" then
    hs.itunes.playpause()
  elseif activeApp == "spotify" then
    hs.spotify.playpause()
  end
end

Media.ff = function()
  if activeApp == "itunes" then
    hs.itunes.ff()
  elseif activeApp == "spotify" then
    hs.spotify.ff()
  end
end

Media.rw = function()
  if activeApp == "itunes" then
    hs.itunes.rw()
  elseif activeApp == "spotify" then
    hs.spotify.rw()
  end
end

Media.init()

return Media
