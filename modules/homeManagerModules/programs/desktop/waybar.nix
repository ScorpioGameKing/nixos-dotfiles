{ pkgs, lib, config, inputs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.desktop.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];
    xdg.configFile.waybar = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/waybar";
      recursive = true;
    };
  };
}