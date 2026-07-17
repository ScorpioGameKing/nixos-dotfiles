{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/gui-apps/brave.nix
    ./../programs/gui-apps/vscodium.nix
    ./../programs/gui-apps/equibop.nix
  ];

  options = { };

  config = lib.mkIf config.hm-modules.gui-apps.enable { };
}