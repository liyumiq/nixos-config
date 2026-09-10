{ inputs, config, lib, pkgs, ... }: let
    option = config.modules.home.spotify;
    stylix = config.core.stylix;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {

    imports = [ inputs.spicetify-nix.homeManagerModules.default ];

#--- [ Options ] ----------------------------------------------------
options.modules.home.spotify = {
    enable = lib.mkOption { type = lib.types.bool; default = false; };
};


#--- [ Config ] -----------------------------------------------------
config = lib.mkIf option.enable {

    programs.spicetify = {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
            adblock
        ];

        theme = spicePkgs.themes.catppuccin;
        colorScheme = "${stylix.flavor}";
    };
};}
