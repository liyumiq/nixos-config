local nix = require('nix')

hl.on('hyprland.start', function()
    hl.exec_cmd(nix.packages.wl_clip_persist .. ' -c regular')
    hl.exec_cmd(nix.packages.per_window_layout)
end)
