{ pkgs, lib, ...}: {
  imports = [
    ./../programs/shells/bash.nix
    ./../programs/shells/nushell.nix
  ];
}
