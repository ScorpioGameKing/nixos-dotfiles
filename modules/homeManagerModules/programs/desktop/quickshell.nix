{ pkgs, lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.desktop.quickshell.enable {
    home.packages = with pkgs; [
      quickshell
    ];
    xdg.configFile.quickshell = {
      source = create_symlink "${niri-dotfiles-repo}/.config/quickshell";
      recursive = true;
    };
  };
}