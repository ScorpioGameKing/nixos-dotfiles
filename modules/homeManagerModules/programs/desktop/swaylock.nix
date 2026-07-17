{ pkgs, lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = {
    swaylock.enable = lib.mkEnableOption "enables swaylock";
  };

  config = lib.mkIf config.swaylock.enable {
    home.packages = with pkgs; [
      swaylock
    ];
    xdg.configFile.swaylock = {
      source = create_symlink "${niri-dotfiles-repo}/.config/swaylock";
      recursive = true;
    };
  };
}