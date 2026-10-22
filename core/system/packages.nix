{ pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        devenv
        git
        neovim
        btop
    ];

    programs = {

    };

}
