{ inputs, config, osConfig, lib, pkgs, ... }: let
    option = config.modules.home.desktop.serpantinum;
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
            wallpaperDir = config.host.home.paths.wallpapers;

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

    modules.home.desktop.hyprland.extraLua = lib.mkIf osConfig.modules.system.desktop.hyprland.enable ''
        hl.on("hyprland.start", function()
            hl.exec_cmd('serpantinumd start')
            hl.exec_cmd('wl-paste --type text --watch cliphist store')
            hl.exec_cmd('wl-paste --type image --watch cliphist store')
            hl.exec_cmd('systemctl --user enable --now easyeffects')
        end)

        hl.bind('SUPER+Space', hl.dsp.exec_cmd('serpantinum msg toggle launcher'))
        hl.bind('SUPER+V', hl.dsp.exec_cmd('serpantinum msg toggle clipboard'))

        hl.bind('SUPER+L', hl.dsp.exec_cmd('serpantinum lock'))
        hl.bind('XF86PowerOff', hl.dsp.exec_cmd('serpantinum lock'))

        hl.bind('SUPER+SHIFT+S', hl.dsp.exec_cmd('serpantinum screenshot'), { locked = true })
        hl.bind('SUPER+SHIFT+ALT+S', hl.dsp.exec_cmd('serpantinum screenshot --edit'), { locked = true })
        hl.bind('SUPER+CTRL+S', hl.dsp.exec_cmd('serpantinum screenshot --full'), { locked = true })
        hl.bind('SUPER+CTRL+ALT+S', hl.dsp.exec_cmd('serpantinum screenshot --full --edit'), { locked = true })

        hl.layer_rule({
            match = { namespace = '^(quickshell|qs.*|traymenu|osd)$' },
            no_anim = true
        })
    '';

};}
