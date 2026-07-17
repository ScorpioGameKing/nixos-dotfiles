{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/shells/bash.nix
    ./../programs/shells/nushell.nix
  ];

  options = { };
  
  config = lib.mkIf config.shells.enable { };
}
