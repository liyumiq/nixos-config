{
    imports = [
        ./boot/tuigreet.nix
        ./boot/swap.nix
        ./boot/zram.nix
        
        ./hardware/bluetooth.nix
        ./hardware/wifi.nix

        ./aagl.nix
        ./steam.nix
        ./virtualisation.nix
    ];
}
