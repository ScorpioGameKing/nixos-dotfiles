{ pkgs, lib, ...}: {
  imports = [
    ./../programs/terminals/wezterm.nix
    ./../programs/terminals/alacritty.nix
  ];
}
