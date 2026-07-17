{ pkgs, lib, config, inputs, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = {
    fuzzel.enable = lib.mkEnableOption "enables fuzzel";
  };

  config = lib.mkIf config.fuzzel.enable {
    home.packages = with pkgs; [
      fuzzel
    ];
    xdg.configFile.fuzzel = {
      source = create_symlink "${niri-dotfiles-repo}/.config/fuzzel";
      recursive = true;
    };
  };
}