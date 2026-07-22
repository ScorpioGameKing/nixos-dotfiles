{ lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.window-managers.hyprland.enable {
    home.file.hypr = {
      source = "${nixos-dotfiles-repo}/.config/hypr";
      recursive = true;
    };
    #wayland.windowManager.hyprland = {
    #  enable = true;
    #  package = null;
    #  portalPackage = null;
    #};
  };
}