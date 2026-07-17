{ pkgs, lib, ...}: {
  imports = [
    ./../programs/desktop/quickshell.nix
    ./../programs/desktop/swaybg.nix
    ./../programs/desktop/swaylock.nix
    ./../programs/desktop/waybar.nix
    ./../programs/desktop/waypaper.nix
  ];
}