# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ ... }:

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
      nb-stylix.enable = true;
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