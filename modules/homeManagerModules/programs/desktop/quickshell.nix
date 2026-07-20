{ pkgs, lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.desktop.quickshell.enable {
    home.packages = with pkgs; [
      quickshell
    ];
    xdg.configFile.quickshell = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/quickshell";
      recursive = true;
    };
  };
}