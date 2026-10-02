{ pkgs, ... }: {

    extraGroups = [ "wheel" "video" "render" "input" ];
    shell = pkgs.zsh;

}
