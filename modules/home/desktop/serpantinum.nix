{ inputs, config, osConfig, lib, pkgs, ... }: let
    option = config.modules.home.desktop.serpantinum;
    niri = config.modules.home.desktop.niri;
    colors = config.lib.stylix.colors.withHashtag;
in {

    imports = [ inputs.serpantinum.homeManagerModules.default ];

#--- [ Options ] ----------------------------------------------------
options.modules.home.desktop.serpantinum = {
    enable = lib.mkOption { type = lib.types.bool; default = false; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkIf option.enable { 

    home.packages = with pkgs; [
        pulseaudio
    ];

    programs.serpantinum = {
        enable = true;
        settings = {
            wallpaperDir = lib.mkDefault config.host.home.paths.wallpapers;

            theme = {
                colors = {
                    base = colors.base00;
                    mantle = colors.base00;
                    crust = colors.base00;
                    surface0 = colors.base01;
                    surface1 = colors.base02;
                    surface2 = colors.base03;
                    overlay0 = colors.base03;
                    overlay1 = colors.base05;
                    overlay2 = colors.base05;
                    subtext0 = colors.base04;
                    subtext1 = colors.base04;
                    text = colors.base05;
                    blue = colors.base0D;
                    green = colors.base0B;
                    mauve = colors.base0D;
                    peach = colors.base0A;
                    yellow = colors.base0A;
                    teal = colors.base0C;
                    red = colors.base08;
                    maroon = colors.base0F;
                    pink = colors.base0F;
                    sapphire = colors.base0D;
                };
            };
            matugen = false;

            fontFamily = config.stylix.fonts.sansSerif.name;
        };
    };


    xdg.configFile."niri/serpantinum.kdl".text = lib.mkIf osConfig.modules.system.desktop.niri.enable ''
        spawn-at-startup "serpantinumd start"
        spawn-at-startup "wl-paste --type text --watch cliphist store"
        spawn-at-startup "wl-paste --type image --watch cliphist store"
        spawn-at-startup "systemctl --user enable --now easyeffects"

        binds {
            Mod+Space { spawn-sh "serpantinum msg toggle launcher"; }
            Mod+V { spawn-sh "serpantinum msg toggle clipboard"; }

            Mod+L { spawn-sh "serpantinum lock"; }

            Mod+Shift+S { spawn-sh "serpantinum screenshot"; }
            Mod+Ctrl+S { spawn-sh "serpantinum screenshot --full"; }
        }

        layout {
            background-color "transparent"
        }

        layer-rule {
            match namespace="^wallpaper-bg"
            place-within-backdrop true
        }
    '';

};}
