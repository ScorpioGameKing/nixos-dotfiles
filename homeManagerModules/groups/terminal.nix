{ pkgs, lib, ...}: {
  imports = [
    ./../programs/bash.nix
    ./../programs/gpg.nix
    ./../programs/television.nix
    ./../programs/nix-search-tv.nix
  ];
}
