{ pkgs, ... }: {

    extraGroups = [ "wheel" "ydotool" ];
    shell = pkgs.zsh;

}
