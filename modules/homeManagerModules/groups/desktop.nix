{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/desktop/dunst.nix
    ./../programs/desktop/mako.nix
    ./../programs/desktop/quickshell.nix
    ./../programs/desktop/swaybg.nix
    ./../programs/desktop/swaylock.nix
    ./../programs/desktop/waybar.nix
    ./../programs/desktop/waypaper.nix
  ];

}