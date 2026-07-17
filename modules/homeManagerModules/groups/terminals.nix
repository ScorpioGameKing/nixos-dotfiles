{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/terminals/wezterm.nix
    ./../programs/terminals/alacritty.nix
  ];

  options = { };

  config = lib.mkIf config.terminals.enable { };
}
