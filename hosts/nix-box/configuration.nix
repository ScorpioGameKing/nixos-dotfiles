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