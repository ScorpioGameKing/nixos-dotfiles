{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/shells/bash.nix
    ./../programs/shells/nushell.nix
  ];

}
