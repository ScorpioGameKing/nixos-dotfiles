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
      ./../../nixosModules/groups/theme.nix
    ];
  
  # ---------------------------
  # Flake Configuration
  # ---------------------------

  niri.enable = true;
  ly.enable = true;
  steam.enable = true;
  nb-stylix.enable = true;

  # -------------------------
  # System Wide Package Installs
  # -------------------------

  environment.systemPackages = with pkgs; [
    wget         # 
    cmake        # Build C Stuff
    gcc          # Compile C Stuff
    nodejs       # We have this here for neovim plugins(?)
    ripgrep      # Grep go BRRRRRR
    tree-sitter  # I like syntax-highlighting anywhere possible
    pinentry-all # Current Solution to sign with git
    xwayland-satellite
  ];
}