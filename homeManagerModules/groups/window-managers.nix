{ lib, config, ... }: {
  imports = [
    ./../programs/window-managers/niri.nix
  ];
  niri.enable = lib.mkIf osConfig.niri.enable true;
}