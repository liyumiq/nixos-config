{ inputs, config, lib, pkgs, ... }: let
    option = config.modules.system.desktop.niri;
in {

#--- [ Options ] ----------------------------------------------------
options.modules.system.desktop.niri = {
    enable = lib.mkOption { type = lib.types.bool; default = false; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkIf option.enable {

    programs.niri = {
        enable = true;
        useNautilus = false;
    };

};}
