hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})


-- Telegram Media Viewer
hl.window_rule({
    match = { class = 'org.telegram.desktop', title = 'Media viewer' },

    float = true,
    center = true,
    size = { '(monitor_w*0.66)', '(monitor_h*0.66)' }
})

-- EOG
hl.window_rule({
    match = { class = 'org.gnome.eog' },

    float = true,
    center = true,
    size = { '(monitor_w*0.66)', '(monitor_h*0.66)' }
})

-- Picture In Picture
hl.window_rule({
    match = { title = 'Картинка в картинке' },

    float = true,
    pin = true,
    keep_aspect_ratio = true,
    no_initial_focus = true,
    size = { '(monitor_w * 0.25)', '(monitor_h * 0.25)' },
    move = { 'monitor_w - window_w - 20', 'monitor_h - window_h - 20' }
})


-- Layer Rules
hl.layer_rule({
    match = { namespace = '^(hyprpicker|wayfreeze|selection)$' },
    no_anim = true
})
