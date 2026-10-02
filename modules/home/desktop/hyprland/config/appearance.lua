local nix = require('nix')

hl.monitor({
    output = 'eDP-1',
    mode = '1920x1080@60',
    scale = 1
})

hl.config({
    general = {
        -- Border
        border_size = 2,

        -- Gaps
        gaps_in = 5,
        gaps_out = 10,

        -- Colors
        col = {
            active_border = nix.colors.base0D,
            inactive_border = nix.colors.base03,
        }
    },
    decoration = {
        -- Rounding
        rounding = 10,
        rounding_power = 3,

        -- Opacity
        active_opacity = 0.90,
        inactive_opacity = 0.90,

        -- Blur
        blur = {
            size = 12,
            passes = 3,
            noise = 0.015,
            contrast = 1.3,
            brightness = 1.0,
            special = true
        }
    }
})
