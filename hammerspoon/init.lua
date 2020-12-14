local hyperKey = {"cmd", "ctrl", "alt", "shift"}

hs.hotkey.bind(hyperKey, "s", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x - 50
    win:setFrame(f)
end)

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

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- resize to half and move to right
hs.hotkey.bind(hyperKey, "g", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- resize to full screen
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