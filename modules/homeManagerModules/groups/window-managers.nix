{ lib, osConfig, config, ... }: {
  imports = [
    ./../programs/window-managers/niri.nix
  ];

  options = { };

  config = lib.mkIf config.window-managers.enable { };
  
}