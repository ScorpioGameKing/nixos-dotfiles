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
      ./hardware-configuration.nix
      ./../../modules/nixosModules/default.nix
    ];
  
  # ---------------------------
  # Module Configuration
  # ---------------------------

  # Tools
  wget.enable = true;
  cmake.enable = true;
  gcc.enable = true;
  nodejs.enable = true;
  ripgrep.enable = true;
  tree-sitter.enable = true;
  pinentry-all.enable = true;
  
  # Display Managers
  ly.enable = true;
  
  # Window Managers
  niri.enable = true;
  
  # Desktop Enviroment
  nb-stylix.enable = true;
  xwayland-satellite.enable = true;
  
  # GUI Apps
  steam.enable = true;
}