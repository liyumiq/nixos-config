{

    imports = [
        ./packages.nix
        ./config/desktop-entries.nix
    ];

    #--- Host Options ---------------------------
    host.home = {

    };


    #--- Modules --------------------------------
    core.stylix = {

    };

    modules.home = {
        desktop = {
            hyprland = {
                animations.scale = 0.75;
                extraLua = ''
                    hl.monitor({
                        output = 'eDP-1',
                        mode = '1920x1080@60',
                        scale = 1,
                        mode = 'preferred'
                    })

                    hl.bind('SUPER+Return', hl.dsp.exec_cmd('kitty'))
                    hl.bind('SUPER+E', hl.dsp.exec_cmd('kitty zsh -ic "y; exec zsh"'))
                    hl.bind('SUPER+Grave', hl.dsp.exec_cmd('kitty nvim'))
                    hl.bind('SUPER+B', hl.dsp.exec_cmd('zen-twilight'))
                    hl.bind('SUPER+SHIFT+B', hl.dsp.exec_cmd('zen-twilight --private-window'))

                    hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
                    hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
                    hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+'))
                    hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-'))

                    hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl s 5%+'))
                    hl.bind('SHIFT+XF86MonBrightnessUp', hl.dsp.exec_cmd('brightnessctl s 100%'))
                    hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl s 5%-'))
                    hl.bind('SHIFT+XF86MonBrightnessDown', hl.dsp.exec_cmd('brightnessctl s 0%'))
                '';
            };
            serpantinum.enable = true;
        };
        kitty.enable = true;
        zenBrowser.enable = true;
        spotify.enable = true;
        discord.enable = true;
    };


    #--- Options --------------------------------
    programs.git = {
        enable = true;
        settings.user.name = "jaimarl";
        settings.user.email = "jaimarl.me@gmail.com";
    };

    services.syncthing = {
        enable = true;
        settings = {
            devices = {
                "Pixel 8 Pro" = { id = "2SAK7XX-O236DZ6-RTZQCD6-HN4WKO4-K7UX5QE-SXXAG74-OUEPV5O-SCLHGAZ"; };
            };
            folders = {
                "Vault" = {
                    path = "~/Vaults/Personal";
                    devices = [ "Pixel 8 Pro" ];
                };
            };
        };
    };

    programs.serpantinum.settings = builtins.fromJSON ''
        {
          "bar": {
            "autohide": false,
            "autohideTimeout": 1000,
            "modules": {
              "left": [
                "left",
                "workspaces",
                "media"
              ],
              "center": [
                "timedate",
                "info",
                "weather"
              ],
              "right": [
                "tray",
                [
                  "kb",
                  "wifi",
                  "bt",
                  "vol",
                  "bat"
                ]
              ]
            },
            "opacity": 100,
            "position": "top",
            "style": "fill",
            "time": {
              "format": "HH:mm:ss"
            },
            "width": 100,
            "workspacesStyle": "pacman",
            "workspaceCount": 9,
            "timeStyle": "classic",
            "distinctPills": false,
            "groupColors": {}
          },
          "display": {
            "monitors": {
              "eDP-1": {
                "enabled": false,
                "scale": 1
              }
            }
          },
          "dock": {
            "enabled": false
          },
          "fontFamily": "SF Pro Display",
          "general": {
            "avatarPath": "",
            "language": "ru",
            "location": {},
            "muteSfx": false,
            "weatherInterval": 15,
            "weatherUnit": "metric",
            "sfxVolume": 100,
            "screenshotCaptureOnRelease": false,
            "quickactions": true
          },
          "idle": {
            "actions": {
              "dim": {
                "command": "",
                "enabled": true,
                "id": "dim",
                "isCustom": false,
                "mprisInhibit": false,
                "respectInhibitors": true,
                "resumeCommand": "",
                "timeout": 290
              },
              "dpms": {
                "command": "",
                "enabled": true,
                "id": "dpms",
                "isCustom": false,
                "mprisInhibit": false,
                "respectInhibitors": true,
                "resumeCommand": "",
                "timeout": 360
              },
              "lock": {
                "command": "",
                "enabled": true,
                "id": "lock",
                "isCustom": false,
                "mprisInhibit": false,
                "respectInhibitors": true,
                "resumeCommand": "",
                "timeout": 300
              },
              "suspend": {
                "command": "",
                "enabled": true,
                "id": "suspend",
                "isCustom": false,
                "mprisInhibit": false,
                "respectInhibitors": true,
                "resumeCommand": "",
                "timeout": 600
              }
            },
            "enabled": true
          },
          "launcher": {},
          "matugen": false,
          "notifications": {
            "dnd": false,
            "position": "top right",
            "sound": true,
            "soundFile": "/nix/store/nnmg0qbzqalpnn888dkapbhcc13wc4sd-serpantinum-2.2.4/share/serpantinum/assets/sounds/notifications/Botanica.wav"
          },
          "osd": {},
          "syspanel": {
            "clipExpandProgress": 0,
            "clipExpanded": false,
            "clipState": 1
          },
          "theme": {
            "borderRadius": 10,
            "colors": {
              "base": "#24273a",
              "blue": "#8aadf4",
              "crust": "#24273a",
              "green": "#a6da95",
              "mantle": "#24273a",
              "maroon": "#f0c6c6",
              "mauve": "#8aadf4",
              "overlay0": "#6e738d",
              "overlay1": "#cad3f5",
              "overlay2": "#cad3f5",
              "peach": "#eed49f",
              "pink": "#f0c6c6",
              "red": "#ed8796",
              "sapphire": "#8aadf4",
              "subtext0": "#a5adcb",
              "subtext1": "#a5adcb",
              "surface0": "#363a4f",
              "surface1": "#494d64",
              "surface2": "#6e738d",
              "teal": "#8bd5ca",
              "text": "#cad3f5",
              "yellow": "#eed49f"
            },
            "fontFamily": "SF Pro Display",
            "matugen": false
          },
          "wallpaperDir": "$HOME/Pictures/Wallpapers",
          "widgets": {}
        }
    '';

}
