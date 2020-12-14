local hyperKey = {"cmd", "ctrl", "alt", "shift"}

-- move to left by 50
hs.hotkey.bind(hyperKey, "s", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x - 50
    win:setFrame(f)
end)

-- move to right by 50
hs.hotkey.bind(hyperKey, "d", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x + 50
    win:setFrame(f)
end)

-- resize to half and move to left
hs.hotkey.bind(hyperKey, "a", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = 0
    f.y = 0
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- resize to 1/4 and stick to left top corner
hs.hotkey.bind(hyperKey, "r", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = 0
    f.x = 0
    f.h = max.h / 2
    f.w = max.w / 2
    win:setFrame(f)
end)

-- resize to 1/4 and stick to right top corner
hs.hotkey.bind(hyperKey, "t", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = 0
    f.x = max.w / 2
    f.h = max.h / 2
    f.w = max.w / 2
    win:setFrame(f)
end)

-- resize to 1/4 and stick to left bottom corner
hs.hotkey.bind(hyperKey, "c", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.h / 2 + 26
    f.x = 0
    f.h = max.h / 2
    f.w = max.w / 2
    win:setFrame(f)
end)

-- resize to 1/4 and stick to right bottom corner
hs.hotkey.bind(hyperKey, "v", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.h / 2 + 26
    f.x = max.w / 2
    f.h = max.h / 2
    f.w = max.w / 2
    win:setFrame(f)
end)

-- resize to half and move to left
hs.hotkey.bind(hyperKey, "d", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x + 50
    win:setFrame(f)
end)

-- resize to half and move to right
hs.hotkey.bind(hyperKey, "g", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = 0
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- resize to fit into full screen size
hs.hotkey.bind(hyperKey, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)


-- We use 0 to reload the configuration
hs.hotkey.bind(hyperKey, "0", function()
    hs.reload()
end)

-- Notify about the config reload
hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()