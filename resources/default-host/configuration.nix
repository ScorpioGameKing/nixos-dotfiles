# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ ... }:

{

  # ---------------------------
  # We Dont't Touch stateVersion
  # ---------------------------
  system.stateVersion = "26.05";
  # ---------------------------

  # -------------------------
  # Import Module Groups
  # -------------------------

  imports =
    [ 
      ./hardware-configuration.nix
      ./../../modules/nixosModules/default.nix
    ];
  
  # ---------------------------
  # Module Configuration
  # ---------------------------

  nixos-modules = {
    enable = true;

    desktop = {
      enable = true;
      nb-stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        autoEnable = true;
      };
      xwayland-satellite.enable = true;
    };

    display-managers = {
      enable = true;
      ly {
        enable = true;
        animation = "colormix";
        cmatrix_min_codepoint = "0x3000";
        cmatrix_max_codepoint = "0x30FF";
        colormix_col1 = "0x00282828";
        colormix_col2 = "0x00504945"; 
        colormix_col3 = "0x00EBDBB2";
        clock = "%I:%M %p";
        box_title = "NixOS";
        corner_top_left = "shutdown,restart,britup,britdown,password,tty";
        corner_top_right = "clock,battery,numlock,capslock";
      };
    };

    gui-apps = {
      enable = true;
      libreoffice.enable = true;
      steam.enable = true;
    };

    tools = {
      enable = true;
      cmake.enable = true;
      gcc.enable = true;
      pinentry-all.enable = true;
      ripgrep.enable = true;
      tree-sitter.enable = true;
      wget.enable = true;
    };

    system = {
      enable = true;
      appimage = {
        enable = true;
      };
      boot = {
        enable = true;
        settings = {
          systemd-boot.enabled = true;
          canTouchEfiVariables = true;
        };
      };
      font = {
        enable = true;
      };
      hardware = {
        enable = true;
        graphics = {
          enable = true;
          enable32Bit = true;
        };
      };
      networking = {
        enable = true;
        networkmanager.enable = true; 
      };
      nix-settings = {
        enable = true;
        allowUnfree = true;
      };
      security = {
        enable = true;
      };
      services = {
        enable = true;
        printing.enable = true;
        libinput.enable = true;
      };
      time = {
        enable = true;
      };
    };

    users = {
      enable = true;
      scorpio.enable = true;
    };

    window-managers = {
      enable = true;
      niri.enable = true;
      hyprland = {
        enable = false;
        xwayland.enable = false;
      };
    };
  };
}