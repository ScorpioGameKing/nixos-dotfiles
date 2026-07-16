{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nix-box"; 

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  programs.niri = {
    enable = true;
  };
  services.displayManager.ly.enable = true;

  services.printing.enable = true;

  services.libinput.enable = true;

  users.users.scorpio= {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.xwayland.enable = true;
  programs.gamemode.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
    cmake
    gcc
    nodejs
    ripgrep
    tree-sitter
    eza
    zoxide
    fzf
    pinentry-all
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.agave
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}

