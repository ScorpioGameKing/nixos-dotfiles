{ lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = { };
  
  config = lib.mkIf config.window-managers.niri-configs.enable {
    xdg.configFile.niri = {
      source = create_symlink "${niri-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  };
}