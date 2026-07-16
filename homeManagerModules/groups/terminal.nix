{ pkgs, lib, ...}: {
  imports = [
    ./../programs/television.nix
    ./../programs/nix-search-tv.nix
  ];
}
