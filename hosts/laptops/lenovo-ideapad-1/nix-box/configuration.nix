# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ pkgs, ... }:

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
      ly.enable = true;
    };

    gui-apps = {
      enable = true;
      steam.enable = true;
    };

    tools = {
      enable = true;
      cmake.enable = true;
      gcc.enable = true;
      #nodejs.enable = true;
      pinentry-all.enable = true;
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