{ config, ... }: {
    
    imports = [
        ../../hardware.nix
        ./packages.nix
        ./services.nix
    ];

config = {

    #--- Host Options ---------------------------
    host.system = {
        hostname = "nix-home";
    };


    #--- Modules --------------------------------
    core = {
        audio.monoPlayback.enable = true;
        graphics.nvidia.enable = true;
    };

    modules.system = {
        aagl.genshin.enable = true;
        steam.enable = true;
        boot = {
            tuigreet.enable = true;
            swap.enable = true;
            zram.enable = true;
        };
    };


    #--- Options --------------------------------

};}
