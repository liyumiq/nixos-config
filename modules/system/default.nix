{
    imports = [
        ./boot/tuigreet.nix
        ./boot/swap.nix
        ./boot/zram.nix

        ./desktop/hyprland.nix
        
        ./hardware/bluetooth.nix
        ./hardware/wifi.nix

        ./aagl.nix
        ./steam.nix
        ./virtualisation.nix
    ];
}
