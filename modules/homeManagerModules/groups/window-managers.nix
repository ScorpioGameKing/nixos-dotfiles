{ lib, osConfig, ... }: {
  imports = [
    ./../programs/window-managers/niri.nix
  ];
  niri-configs.enable = lib.mkIf osConfig.niri.enable true;
}