{ pkgs, lib, config, inputs, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = { };

  config = lib.mkIf config.desktop.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];
    xdg.configFile.waybar = {
      source = create_symlink "${niri-dotfiles-repo}/.config/waybar";
      recursive = true;
    };
  };
}