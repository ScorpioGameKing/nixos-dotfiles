{ pkgs, lib, config, inputs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.tools.fuzzel.enable {
    home.packages = with pkgs; [
      fuzzel
    ];
    xdg.configFile.fuzzel = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/fuzzel";
      recursive = true;
    };
  };
}