{ config, ... }: {
    
    imports = [
        ../../hardware.nix
        ./packages.nix
        ./services.nix
    ];

config = {

    #--- Host Options ---------------------------
    host.system = {
        hostname = "nix-btw";
        hasBattery = true;
    };


    #--- Modules --------------------------------
    core = {
        bootloader.useGrub = true;
        audio.monoPlayback.enable = true;
    };

    modules.system = {
        boot = {
            tuigreet.enable = true;
            swap.enable = true;
            zram.enable = true;
        };
        desktop.hyprland.enable = true;
        hardware = {
            bluetooth.enable = true;
        };
        steam.enable = true;
        virtualisation.enable = true;
    };


    #--- Options --------------------------------

};}
