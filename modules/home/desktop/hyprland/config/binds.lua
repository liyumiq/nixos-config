local nix = require('nix')

-- Window Management
hl.bind('SUPER+Q', hl.dsp.window.close())
hl.bind('F11', hl.dsp.window.fullscreen())

hl.bind('SUPER+W', function ()
    local win = hl.get_active_window()
    if not win then return end

    local mon = hl.get_active_monitor()
    local scale = mon.scale or 1.0
    local w = math.floor((mon.width / scale) * 0.66)
    local h = math.floor((mon.height / scale) * 0.66)

    hl.dispatch(hl.dsp.window.float())

    local is_fullscreen = win.fullscreen and (win.fullscreen == true or win.fullscreen > 0)
    if is_fullscreen then
        hl.dispatch(hl.dsp.window.fullscreen({ action = 'unset' }))
        hl.dispatch(hl.dsp.window.float({ action = 'on' }))
    end

    if win.floating then
        hl.dispatch(hl.dsp.window.center())
        hl.dispatch(hl.dsp.window.resize({ x = w, y = h }))
    end
end)


-- Navigation
hl.bind('SUPER+Left', hl.dsp.focus({ direction = 'left' }))
hl.bind('SUPER+Right', hl.dsp.focus({ direction = 'right' }))
hl.bind('SUPER+Up', hl.dsp.focus({ direction = 'up' }))
hl.bind('SUPER+Down', hl.dsp.focus({ direction = 'down' }))

hl.bind('SUPER+SHIFT+Left', hl.dsp.window.swap({ direction = 'left' }))
hl.bind('SUPER+SHIFT+Right', hl.dsp.window.swap({ direction = 'right' }))
hl.bind('SUPER+SHIFT+Up', hl.dsp.window.swap({ direction = 'up' }))
hl.bind('SUPER+SHIFT+Down', hl.dsp.window.swap({ direction = 'down' }))


-- Workspaces
for i = 1, 9 do
    hl.bind('SUPER+' .. i, hl.dsp.focus({ workspace = i }))
    hl.bind('SUPER+SHIFT+' .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind('SUPER+X', hl.dsp.workspace.toggle_special({ special_name = 'special' }))
hl.bind('SUPER+SHIFT+X', hl.dsp.window.move({ workspace = 'special', follow = false }))


-- Layouts
hl.bind('SUPER+R', hl.dsp.layout('colresize +conf'))
hl.bind('SUPER+Tab', function ()
    local layouts   = { 'scrolling', 'master' }
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    local next_layout = 'master'

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

    hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
end)


-- Screen
hl.bind('SUPER+SHIFT+P', hl.dsp.exec_cmd(nix.packages.hyprpicker .. ' -a -u 150'))

local function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= 1 then
        current = 1
    else
        current = nix.zoom.toggleFactor
    end
    current = math.max(1, math.min(nix.zoom.max, current))
    hl.config({ cursor = { zoom_factor = current } })
end

hl.bind("SUPER+Z", zoom)
hl.bind("SUPER+Equal", function() zoom(nix.zoom.step) end)
hl.bind("SUPER+Minus", function() zoom(-nix.zoom.step) end)


-- Mouse
hl.bind("SUPER+mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER+mouse:273", hl.dsp.window.resize(), { mouse = true })
