{ osConfig, config, lib, pkgs, ... }: let
    option = config.modules.home.desktop.niri;
in {

    imports = [
        ./config/autostart.nix
        ./config/binds.nix
        ./config/theming.nix
        ./config/windowrules.nix
    ];

#--- [ Options ] ----------------------------------------------------
options.modules.home.desktop.niri = {
    opacity = lib.mkOption { type = lib.types.float; default = 0.9; };
    perWindowLayout = lib.mkOption { type = lib.types.bool; default = true; };
    userConfig = lib.mkOption { type = lib.types.lines; default = ""; };

    configLines = lib.mkOption { type = lib.types.lines; default = ""; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkIf osConfig.modules.system.desktop.niri.enable {

    home.packages = with pkgs; [
        xwayland-satellite
    ];

    xdg.configFile."niri/user.kdl".text = option.userConfig;
    xdg.configFile."niri/config.kdl".text = ''
        ${option.configLines}

        recent-windows {
            binds {
            }
        }

        hotkey-overlay {
            skip-at-startup
        }

        input {
            keyboard {
                xkb {
                    layout "us,ru"
                    options "grp:caps_toggle" 
                }
                track-layout "${if option.perWindowLayout then "window" else "global"}"
            }
            touchpad {
                tap
            }
            focus-follows-mouse max-scroll-amount="0%"
        }

        include optional=true "./serpantinum.kdl"
        include "./user.kdl"
    '';

    modules.home.firefox.hideNavigation = lib.mkDefault true;
    modules.home.zenBrowser.hideNavigation = lib.mkDefault true;

};}
