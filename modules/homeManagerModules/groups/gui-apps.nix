{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/gui-apps/brave.nix
    ./../programs/gui-apps/vscodium.nix
    ./../programs/gui-apps/equibop.nix
  ];

}