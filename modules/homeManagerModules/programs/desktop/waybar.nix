{ pkgs, lib, config, inputs, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];
    xdg.configFile.waybar = {
      source = create_symlink "${niri-dotfiles-repo}/.config/waybar";
      recursive = true;
    };
  };
}