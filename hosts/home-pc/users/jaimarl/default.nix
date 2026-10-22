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
            niri.userConfig = ''
                output "DP-3" {
                    mode "1920x1080@144"
                    scale 1
                    focus-at-startup
                    hot-corners {
                        off
                    }
                }
                output "HDMI-A-1" {
                    mode "1920x1080@60"
                    scale 1
                    hot-corners {
                        off
                    }
                }

                Mod+Return repeat=false { spawn "kitty"; }
                Mod+E repeat=false { spawn-sh "kitty zsh -ic 'y; exec zsh'"; }
                Mod+Grave repeat=false { spawn-sh "kitty nvim"; }
                Mod+B repeat=false { spawn-sh "zen-twilight"; }
                Mod+Shift+B repeat=false { spawn-sh "zen-twilight --private-window"; }

                XF86AudioMute repeat=false { spawn-sh "${pkgs.playerctl}/bin/playerctl play-pause"; }

                Mod+C repeat=false { spawn-sh "~/Projects/spam.sh"; }
            '';
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
