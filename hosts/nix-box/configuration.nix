# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ config, lib, pkgs, ... }:

{

  # -------------------------
  # Flake imports
  # -------------------------

  imports =
    [ 
      ./hardware-configuration.nix
      ./../../nixosModules/groups/system.nix
      ./../../nixosModules/groups/users.nix
      ./../../nixosModules/groups/display-managers.nix
      ./../../nixosModules/groups/window-managers.nix
      ./../../nixosModules/groups/gui-apps.nix
      ./../../nixosModules/groups/desktop.nix
      ./../../nixosModules/groups/tools.nix
    ];
  
  # ---------------------------
  # Flake Configuration
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