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
      ./nixosModules/groups/theme.nix
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
 
  # -------------------------
  # System Config Options
  # -------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 20;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-box"; 
  networking.networkmanager.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  services.displayManager.ly.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
  
  security.pam.services.swaylock = {};

  time.timeZone = "America/New_York";
  # -------------------------

  # -------------------------
  # Create our user
  # -------------------------
  users.users.scorpio= {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
  # -------------------------

  # -------------------------
  # Enable packages at system level
  # -------------------------
  programs.niri = {
    enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  # -------------------------
}
# -------------------------
