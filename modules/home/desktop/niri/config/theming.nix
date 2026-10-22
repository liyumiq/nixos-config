{ osConfig, config, lib, ... }: let
    option = config.modules.home.desktop.niri;

    colors = config.lib.stylix.colors.withHashtag;
in {

#--- [ Config ] -----------------------------------------------------
config = lib.mkIf osConfig.modules.system.desktop.niri.enable {

    modules.home.desktop.niri.configLines = ''
        prefer-no-csd

        cursor {
            xcursor-theme "${config.stylix.cursor.name}"
            xcursor-size ${toString config.stylix.cursor.size}
        }

        layout {
            always-center-single-column
            gaps 6

            focus-ring {
                off
            }
            border {
                width 2
                active-color "${colors.base0D}"
                inactive-color "${colors.base03}"
                urgent-color "${colors.base08}"
            }

            struts {
                left 24
                right 24
            }
        }
    '';

};}
