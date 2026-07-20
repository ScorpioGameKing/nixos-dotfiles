{ lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.window-managers.niri.enable {
    xdg.configFile.niri = {
      source = create_symlink "${niri-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  };
}