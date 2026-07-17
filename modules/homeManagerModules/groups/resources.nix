{ pkgs, lib, config, ...}: {

  imports = [
    ./../resources/gruvbox-wallpapers.nix
  ];

  options = { };
  
  config = lib.mkIf config.resources.enable { };
}