{ pkgs, lib, config, ...}: {

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

    # CLI-App Options
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
            default = {};
          };
          lazygit = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables lazygit";
              };
            };
            default = {};
          };
          neovim = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables neovim";
              };
            };
            default = {};
          };
          oh-my-posh = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables oh-my-posh";
              };
            };
            default = {};
          };
          television = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables television";
              };
            };
            default = {};
          };
          yazi = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables yazi";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.cli-apps.enable { };
      };
      default = {};
    };

    # Desktop Options
    hm-modules.desktop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          mako = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables mako";
              };
            };
            default = {};
          };
          quickshell = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables quickshell";
              };
            };
            default = {};
          };
          swaybg = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables swaybg";
              };
            };
            default = {};
          };
          swaylock = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables swaylock";
              };
            };
            default = {};
          };
          waybar = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables waybar";
              };
            };
            default = {};
          };
          waypaper = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables waypaper";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.desktop.enable { };
      };
      default = { };
    };

    # GUI-App Options
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
            default = {};
          };
          vscodium = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables vscodium";
              };
            };
            default = {};
          };
          equibop = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables equibop";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.gui-apps.enable { };
      };
      default = { };
    };

    # Resources Options
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
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.resources.enable { };
      };
      default = { };
    };

    # Shells Options
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
            default = {};
          };
          nushell = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nushell";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.shells.enable { };
      };
      default = { };
    };

    # Terminals Options
    hm-modules.terminals = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables terminals";
          wezterm = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables wezterm";
              };
            };
            default = {};
          };
          alacritty = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables alacritty";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.terminals.enable { };
      };
      default = { };
    };

    # Tools Options
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
            default = {};
          };
            fastfetch = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fastfetch";
              };
            };
            default = {};
          };
          fuzzel = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fuzzel";
              };
            };
            default = {};
          };
          fzf = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables fzf";
              };
            };
            default = {};
          };
          gh = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gh";
              };
            };
            default = {};
          };
          git = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables git";
              };
            };
            default = {};
          };
          gpg = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gpg";
              };
            };
            default = {};
          };
          nix-search-tv = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nix-search-tv";
              };
            };
            default = {};
          };
          update-nix-fetchgit = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables update-nix-fetchgit";
              };
            };
            default = {};
          };
          zoxide = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables zoxide";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.tools.enable { };
      };
      default = { };
    };

    # Window-Managers Options
    hm-modules.window-managers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          niri-configs = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables niri-configs";
              };
              config = { enable = lib.mkIf osConfig.niri.enable true; };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.window-managers.enable { };
      };
      default = { };
    };

  };
  config = lib.mkIf config.hm-modules.enable { };
}