require('nix')
require('config.animations')
require('config.appearance')
require('config.autostart')
require('config.binds')
require('config.windowrules')


-- General Config
hl.config({
    general = {
        layout = 'master'
    },
    master = {
        new_status = 'slave'
    },

    misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
    };

    input = {
        kb_layout = 'us,ru',
        kb_options = 'grp:caps_toggle'
    },

    cursor = {
        zoom_disable_aa = true
    }
})


require('extra')
