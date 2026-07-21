{ lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.window-managers.niri.enable {
    xdg.configFile.hypr = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  };
}