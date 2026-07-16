# -------------------------
# Scorpio's Nix-Box Configs
# -------------------------

{ config, lib, pkgs, ... }:

{
  # -------------------------
  # Nix Settings
  # -------------------------
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
  # -------------------------

  # -------------------------
  # Flake imports
  # -------------------------
  imports =
    [ 
      ./hardware-configuration.nix
      ./../../nixosModules/groups/system.nix
      ./../../nixosModules/groups/users.nix
      ./../../nixosModules/groups/dm.nix
      ./../../nixosModules/groups/wm.nix
      ./../../nixosModules/groups/gui-apps.nix
      ./../../nixosModules/groups/theme.nix
    ];
  # -------------------------

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
    eza          # Better ls
    zoxide       # Better cd
    fzf          # Fuzzy find files in the terminal
    pinentry-all # Current Solution to sign with git
    xwayland-satellite
  ];
  # -------------------------
}
# -------------------------
