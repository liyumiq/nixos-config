{ pkgs, ... }: {

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
                    hl.monitor({
                        output = 'DP-3',
                        mode = '1920x1080@144',
                        position = '0x0',
                        scale = 1,
                        mode = 'preferred'
                    })
                    hl.monitor({
                        output = 'HDMI-A-1',
                        mode = '1920x1080@60',
                        position = '1920x0',
                        scale = 1
                    })

                    hl.bind('SUPER+Return', hl.dsp.exec_cmd('kitty'))
                    hl.bind('SUPER+E', hl.dsp.exec_cmd('kitty zsh -ic "y; exec zsh"'))
                    hl.bind('SUPER+Grave', hl.dsp.exec_cmd('kitty nvim'))
                    hl.bind('SUPER+B', hl.dsp.exec_cmd('zen-twilight'))
                    hl.bind('SUPER+SHIFT+B', hl.dsp.exec_cmd('zen-twilight --private-window'))

                    hl.bind('XF86AudioMute', hl.dsp.exec_cmd('${pkgs.playerctl}/bin/playerctl play-pause'))
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

}
