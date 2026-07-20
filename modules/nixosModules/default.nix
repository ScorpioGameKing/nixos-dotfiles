{ pkgs, lib, config, ...}: {

  imports = [
      ./groups/system.nix
      ./groups/users.nix
      ./groups/display-managers.nix
      ./groups/window-managers.nix
      ./groups/gui-apps.nix
      ./groups/desktop.nix
      ./groups/tools.nix
  ];

  options = {
    nixos-modules.enable = lib.mkEnableOption "enables NixOS Modules";
    
    # --------------------------------------------------------------------
    # Desktop Options
    # --------------------------------------------------------------------

    nixos-modules.desktop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables desktop";
          nb-stylix = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nb-stylix";
                base16Scheme = lib.mkOption {
                  type = lib.types.path;
                  default = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
                };
                autoEnable = lib.mkEnableOption "enables autoEnable";
              };
            };
          };
          xwayland-satellite = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables xwayland-satellite";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.desktop.enable { };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # Display Managers Options
    # --------------------------------------------------------------------
    
    nixos-modules.display-managers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables display-managers";
          ly = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables ly";
                settings = lib.mkOption {
                  type = lib.types.submodule {
                    options = {
                      animation = lib.mkOption {
                        type = lib.types.str;
                        default = "colormix";
                      };
                      cmatrix_min_codepoint = lib.mkOption {
                        type = lib.types.str;
                        default = "0x3000";
                      };
                      cmatrix_max_codepoint = lib.mkOption {
                        type = lib.types.str;
                        default = "0x30FF";
                      };
                      colormix_col1 = lib.mkOption {
                        type = lib.types.str;
                        default = "0x00282828";
                      };
                      colormix_col2 = lib.mkOption {
                        type = lib.types.str;
                        default = "0x00504945";
                      };
                      colormix_col3 = lib.mkOption {
                        type = lib.types.str;
                        default = "0x00EBDBB2";
                      };
                      clock = lib.mkOption {
                        type = lib.types.str;
                        default = "%I:%M %p";
                      };
                      box_title = lib.mkOption {
                        type = lib.types.str;
                        default = "NixOS";
                      };
                      corner_top_left = lib.mkOption {
                        type = lib.types.str;
                        default = "shutdown,restart,britup,britdown,password,tty";
                      };
                      corner_top_right = lib.mkOption {
                        type = lib.types.str;
                        default = "clock,battery,numlock,capslock";
                      };
                    };
                  };
                };
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.display-managers.enable { };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # GUI Apps Options
    # --------------------------------------------------------------------
    
    nixos-modules.gui-apps = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables gui-apps";
          steam = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables steam";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.gui-apps.enable { };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # System Options
    # --------------------------------------------------------------------
    
    nixos-modules.system = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables system";
          boot = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables boot";
                settings = lib.mkOption {
                  type = lib.types.submodule {
                    options = {
                      systemd-boot-enabled = lib.mkEnableOption "enables systemd boot";
                      touchEfiVariables = lib.mkEnableOption "enables canTouchEfiVariables";
                      systemd-boot-config-limit = lib.mkOption {
                        type = lib.types.int;
                        default = 20;
                      };
                      kernelPkgs = lib.mkOption {
                        type = lib.types.package;
                        default = pkgs.linuxPackages_latest;
                      };
                    };
                  };
                };
              };
            };
          };
          font = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables font";
              };
            };
          };
          hardware = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables hardware";
              };
            };
          };
          networking = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables networking";
              };
            };
          };
          nix-settings = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nix-settings";
              };
            };
          };
          security = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables security";
              };
            };
          };
          services = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables services";
              };
            };
          };
          time = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables time";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.system.enable { 
          boot.systemd-boot-enabled = true;
          boot.touchEfiVariables = true;
          boot.kernelPkgs = pkgs.linuxPackages_latest;
        };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # Tools Options
    # --------------------------------------------------------------------
    
    nixos-modules.tools = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables tools";
          cmake = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables cmake";
              };
            };
          };
          gcc = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables gcc";
              };
            };
          };
          nodejs = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables nodejs";
              };
            };
          };
          pinentry-all = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables pinentry-all";
              };
            };
          };
          ripgrep = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables ripgrep";
              };
            };
          };
          tree-sitter = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables tree-sitter";
              };
            };
          };
          wget = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables wget";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.tools.enable { };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # Users Options
    # --------------------------------------------------------------------
    
    nixos-modules.users = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables users";
          scorpio = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables user: scorpio";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.users.enable { };
      };
    };
    # --------------------------------------------------------------------
    
    # --------------------------------------------------------------------
    # Window Managers Options
    # --------------------------------------------------------------------
    
    nixos-modules.window-managers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables window-managers";
          niri = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables niri";
              };
            };
          };
        };
        config = lib.mkIf config.nixos-modules.window-managers.enable { };
      };
    };
  };
  # --------------------------------------------------------------------
  config = lib.mkIf config.nixos-modules.enable { };
}