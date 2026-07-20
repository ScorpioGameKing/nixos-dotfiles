{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/terminals/alacritty.nix
    ./../programs/terminals/kitty.nix
    ./../programs/terminals/wezterm.nix
  ];

}
