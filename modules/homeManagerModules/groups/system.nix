{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/shells/hm-settings.nix
    ./../programs/shells/udiskie.nix
    ./../programs/shells/udisks2.nix
  ];

}