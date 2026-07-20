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
        config = lib.mkIf config.hm-modules.cli-apps.enable { };
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
        config = lib.mkIf config.hm-modules.desktop.enable { };
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
        config = lib.mkIf config.hm-modules.gui-apps.enable { };
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
        config = lib.mkIf config.hm-modules.resources.enable { };
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
        config = lib.mkIf config.hm-modules.shells.enable { };
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
        config = lib.mkIf config.hm-modules.system.enable { };
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
        config = lib.mkIf config.hm-modules.terminals.enable { };
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
        config = lib.mkIf config.hm-modules.tools.enable { };
      };
    };
    # --------------------------------------------------------------------
    # Window-Managers Options
    # --------------------------------------------------------------------
    hm-modules.window-managers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          niri-configs = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables niri-configs";
              };
              config = { enable = lib.mkIf osConfig.nixos-modules.window-managers.niri.enable true; };
            };
          };
        };
        config = lib.mkIf config.hm-modules.window-managers.enable { };
      };
    };
  };
  # --------------------------------------------------------------------
  config = lib.mkIf config.hm-modules.enable { };
}