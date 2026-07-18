# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ pkgs, ... }:

{

  # -------------------------
  # Import Module Groups
  # -------------------------

  imports =
    [ 
      ./../../../../systems/laptops/lenovo-ideapad-1/hardware-configuration.nix
      ./../../../../modules/nixosModules/default.nix
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

      ly = {
        enable = true;
        settings = {
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
    };

    gui-apps = {
      enable = true;

      steam.enable = true;
    };

    system = {
      enable = true;

      boot.enable = true;
      font.enable = true;
      hardware.enable = true;
      networking.enable = true;
      nix-settings.enable = true;
      security.enable = true;
      services.enable = true;
      time.enable = true;
    };

    tools = {
      enable = true;

      cmake.enable = true;
      gcc.enable = true;
      nodejs.enable = true;
      pinentry-all.enable = true;
      python3.enable = true;
      python314Packages-colorama.enable = true;
      python314Packages-raylib-python-cffi.enable = true;
      ripgrep.enable = true;
      tree-sitter.enable = true;
      wget.enable = true;
    };

    users = {
      enable = true;

      scorpio.enable = true;
    };

    window-managers = {
      enable = true;

      niri.enable = true;
    };
  };
}