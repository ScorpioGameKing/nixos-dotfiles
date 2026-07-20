{ pkgs, lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.desktop.swaylock.enable {
    home.packages = with pkgs; [
      swaylock
    ];
    xdg.configFile.swaylock = {
      source = create_symlink "${niri-dotfiles-repo}/.config/swaylock";
      recursive = true;
    };
  };
}