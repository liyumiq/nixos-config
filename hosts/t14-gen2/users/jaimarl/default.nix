{

    imports = [
        ./packages.nix
        ./config/desktop-entries.nix
    ];

    #--- Host Options ---------------------------
    host.home = {

    };


    #--- Modules --------------------------------
    core.stylix = {

    };

    modules.home = {
        desktop = {
            hyprland = {
                animations.scale = 0.75;
                extraLua = ''
                    hl.bind('SUPER+Return', hl.dsp.exec_cmd('kitty'))
                    hl.bind('SUPER+E', hl.dsp.exec_cmd('kitty zsh -ic "y; exec zsh"'))
                    hl.bind('SUPER+Grave', hl.dsp.exec_cmd('kitty nvim'))
                    hl.bind('SUPER+B', hl.dsp.exec_cmd('zen-twilight'))
                    hl.bind('SUPER+SHIFT+B', hl.dsp.exec_cmd('zen-twilight --private-window'))

                    hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
                    hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
                    hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+'))
                    hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-'))

                    hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl s 5%+'))
                    hl.bind('SHIFT+XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl s 100%'))
                    hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl s 5%-'))
                    hl.bind('SHIFT+XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl s 0%'))
                '';
            };
            serpantinum.enable = true;
        };
        kitty.enable = true;
        zenBrowser.enable = true;
        spotify.enable = true;
        discord.enable = true;
    };


    #--- Options --------------------------------
    programs.git = {
        enable = true;
        settings.user.name = "jaimarl";
        settings.user.email = "jaimarl.me@gmail.com";
    };

    services.syncthing = {
        enable = true;
        settings = {
            devices = {
                "Pixel 8 Pro" = { id = "2SAK7XX-O236DZ6-RTZQCD6-HN4WKO4-K7UX5QE-SXXAG74-OUEPV5O-SCLHGAZ"; };
            };
            folders = {
                "Vault" = {
                    path = "~/Vaults/Personal";
                    devices = [ "Pixel 8 Pro" ];
                };
            };
        };
    };

}
