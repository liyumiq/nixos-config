{ inputs, config, osConfig, lib, pkgs, ... }: let
    option = config.modules.home.desktop.hyprland;
    colors = lib.filterAttrs (_: v: builtins.isString v) config.lib.stylix.colors.withHashtag; 
    confDir = "/etc/nixos/modules/home/desktop/hyprland";
in {

#--- [ Options ] ----------------------------------------------------
options.modules.home.desktop.hyprland = {
    animations = {
        enable = lib.mkOption { type = lib.types.bool; default = true; };
        scale = lib.mkOption { type = lib.types.number; default = 1; };
    };

    zoom = {
        max = lib.mkOption { type = lib.types.number; default = 3; };
        step = lib.mkOption { type = lib.types.number; default = 0.5; };
        toggleFactor = lib.mkOption { type = lib.types.number; default = 1.5; };
    };

    extraLua = lib.mkOption { type = lib.types.lines; default = ""; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkIf osConfig.modules.system.desktop.hyprland.enable {

    home.packages = with pkgs; [
    
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        package = null;
        portalPackage = null;
    };

    xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${confDir}/hyprland.lua";
    xdg.configFile."hypr/config".source = config.lib.file.mkOutOfStoreSymlink "${confDir}/config";

    xdg.configFile."hypr/nix.lua".text = ''
        -- Zoom & Float
        return {
            packages = {
                wl_clip_persist = '${pkgs.wl-clip-persist}/bin/wl-clip-persist',
                hyprpicker = '${pkgs.hyprpicker}/bin/hyprpicker'
            },
            animations = {
                enabled = ${lib.boolToString option.animations.enable},
                scale = ${toString option.animations.scale}
            },
            zoom = {
                max = ${toString option.zoom.max},
                step = ${toString option.zoom.step},
                toggleFactor = ${toString option.zoom.toggleFactor}
            },
            colors = {
                base00 = '${colors.base00}',
                base01 = '${colors.base01}',
                base02 = '${colors.base02}',
                base03 = '${colors.base03}',
                base04 = '${colors.base04}',
                base05 = '${colors.base05}',
                base06 = '${colors.base06}',
                base07 = '${colors.base07}',
                base08 = '${colors.base08}',
                base09 = '${colors.base09}',
                base0A = '${colors.base0A}',
                base0B = '${colors.base0B}',
                base0C = '${colors.base0C}',
                base0D = '${colors.base0D}',
                base0E = '${colors.base0E}',
                base0F = '${colors.base0F}'
            }
        }
    '';

    xdg.configFile."hypr/extra.lua".text = ''
        ${option.extraLua}
    '';

    modules.home.firefox.hideNavigation = lib.mkDefault true;
    modules.home.zenBrowser.hideNavigation = lib.mkDefault true;

};}
