{ inputs, config, lib, ... }: let
    option = config.modules.system.aagl;
    anyEnabled =
        option.genshin.enable ||
        option.honkai3rd.enable ||
        option.starRail.enable ||
        option.zzz.enable ||
        option.wuwa.enable;
in {

    imports = [ inputs.aagl.nixosModules.default ];

#--- [ Options ] ----------------------------------------------------
options.modules.system.aagl = {
    genshin.enable = lib.mkOption { type = lib.types.bool; default = false; };
    honkai3rd.enable= lib.mkOption { type = lib.types.bool; default = false; };
    starRail.enable = lib.mkOption { type = lib.types.bool; default = false; };
    zzz.enable = lib.mkOption { type = lib.types.bool; default = false; };
    wuwa.enable = lib.mkOption { type = lib.types.bool; default = false; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkMerge [

    (lib.mkIf anyEnabled {
        nix.settings = {
            substituters = [ "https://ezkea.cachix.org" ];
            trusted-public-keys = [
                "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
            ];
        };
    })

    (lib.mkIf option.genshin.enable {
        programs.anime-game-launcher.enable = true;
    })

    (lib.mkIf option.starRail.enable {
        programs.honkers-railway-launcher.enable = true;
    })

    (lib.mkIf option.honkai3rd.enable {
        programs.honkers-launcher.enable = true;
    })

    (lib.mkIf option.zzz.enable {
        programs.sleepy-launcher.enable = true;
    })

    (lib.mkIf option.wuwa.enable {
        programs.wavey-launcher.enable = true;
    })

];}
