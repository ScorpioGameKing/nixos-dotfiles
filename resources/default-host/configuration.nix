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
      enable = false;
      brightnessctl.enable = false;
      nb-stylix = {
        enable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        autoEnable = false;
      };
      xwayland-satellite.enable = false;
    };

    display-managers = {
      enable = false;
      ly {
        enable = false;
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
      enable = false;
      libreoffice.enable = false;
      steam.enable = false;
    };

    tools = {
      enable = false;
      cmake.enable = false;
      gcc.enable = false;
      pinentry-all.enable = false;
      ripgrep.enable = false;
      tree-sitter.enable = false;
      wget.enable = false;
    };

    system = {
      enable = true;
      appimage = {
        enable = false;
      };
      boot = {
        enable = true;
        settings = {
          systemd-boot.enabled = true;
          canTouchEfiVariables = true;
        };
      };
      font = {
        enable = false;
      };
      hardware = {
        enable = false;
        graphics = {
          enable = false;
          enable32Bit = false;
        };
      };
      networking = {
        enable = true;
        networkmanager.enable = true; 
      };
      nix-settings = {
        enable = true;
        allowUnfree = false;
      };
      security = {
        enable = true;
      };
      services = {
        enable = true;
        printing.enable = false;
        libinput.enable = true;
      };
      time = {
        enable = true;
      };
    };

    users = {
      enable = false;
      scorpio.enable = false;
    };

    window-managers = {
      enable = false;
      niri.enable = false;
      hyprland = {
        enable = false;
        xwayland.enable = false;
      };
    };
  };
}