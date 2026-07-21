{ pkgs, lib, config, osConfig, ...}: {
  imports = [
    ./groups/cli-apps.nix
    ./groups/desktop.nix
    ./groups/gui-apps.nix
    ./groups/resources.nix
    ./groups/shells.nix
    ./groups/terminals.nix
    ./groups/tools.nix
    ./groups/window-managers.nix
  ];
  options = {
    hm-modules.enable = lib.mkEnableOption "enables Home Manager Modules";
    hm-modules.useLocalRepo = lib.mkEnableOption "enables the use of a local dotfile repoistory";
    hm-modules.localRepoPath = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    # --------------------------------------------------------------------
    # CLI-App Options
    # --------------------------------------------------------------------
    hm-modules.cli-apps = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables cli-apps";
          joshuto = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables joshuto";
              };
            };
          };
          lazygit = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables lazygit";
              };
            };
          };
          neovim = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables neovim";
              };
            };
          };
          oh-my-posh = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables oh-my-posh";
              };
            };
          };
          television = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables television";
              };
            };
          };
          yazi = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables yazi";
              };
            };
          };
        };
      };
      default = {};
    };
    # --------------------------------------------------------------------
    # Desktop Options
    # --------------------------------------------------------------------
    hm-modules.desktop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          dunst = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables home manager settings";
              };
            };
          };
          hyprpaper = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables hyprpaper";
              };
            };
          };
          mako = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables mako";
              };
            };
          };
          quickshell = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables quickshell";
              };
            };
          };
          swaybg = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables swaybg";
              };
            };
          };
          swaylock = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables swaylock";
              };
            };
          };
          waybar = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables waybar";
              };
            };
          };
          waypaper = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables waypaper";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # GUI-App Options
    # --------------------------------------------------------------------
    hm-modules.gui-apps = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables gui-apps";
          brave = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables brave";
              };
            };
          };
          equibop = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables equibop";
              };
            };
          };
          vscodium = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables vscodium";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # Resources Options
    # --------------------------------------------------------------------
    hm-modules.resources = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables resources";
          gruvbox-wallpapers = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gruvbox-wallpapers";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # Shells Options
    # --------------------------------------------------------------------
    hm-modules.shells = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables shells";
          bash = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables bash";
              };
            };
          };
          nushell = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nushell";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # System Options
    # --------------------------------------------------------------------
    hm-modules.system = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables system";
          hm-settings = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables home manager settings";
                username = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                };
                homeDirectory = lib.mkOption {
                  type = lib.types.str;
                  default = "";
                };
              };
            };
          };
          udiskie = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables udiskie";
                settings = lib.mkOption {
                  type = lib.types.submodule {
                    options = {
                      automount = lib.mkEnableOption "enables automounting";
                      notify = lib.mkEnableOption "enables notifications";
                    };
                  };
                };
              };
            };
          };
          udisks2 = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables udisks2";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # Terminals Options
    # --------------------------------------------------------------------
    hm-modules.terminals = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables terminals";
          alacritty = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables alacritty";
              };
            };
          };
          kitty = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables kitty";
              };
            };
          };
          wezterm = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables wezterm";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # Tools Options
    # --------------------------------------------------------------------
    hm-modules.tools = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables tools";
          eza = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables eza";
              };
            };
          };
            fastfetch = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fastfetch";
              };
            };
          };
          fuzzel = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fuzzel";
              };
            };
          };
          fzf = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fzf";
              };
            };
          };
          gh = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gh";
              };
            };
          };
          git = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables git";
              };
            };
          };
          gpg = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gpg";
              };
            };
          };
          nix-search-tv = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nix-search-tv";
              };
            };
          };
          update-nix-fetchgit = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables update-nix-fetchgit";
              };
            };
          };
          zoxide = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables zoxide";
              };
            };
          };
        };
      };
    };
    # --------------------------------------------------------------------
    # Window-Managers Options
    # --------------------------------------------------------------------
    hm-modules.window-managers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          niri = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables niri";
              };
            };
          };
          hyprland = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables hyprland";
              };
            };
          };
        };
        config = lib.mkIf config.hm-modules.window-managers.enable { };
      };
    };
  };
  # --------------------------------------------------------------------
  config = lib.mkIf config.hm-modules.enable { 
    hm-modules.window-managers = {
      niri.enable = osConfig.nixos-modules.window-managers.niri.enable;
      hyprland.enable = osConfig.nixos-modules.window-managers.hyprland.enable;
    };
  };
}