{ lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = {
    niri-configs.enable = lib.mkEnableOption "enables niri-configs";
  };
  
  config = lib.mkIf config.niri-configs.enable {
    xdg.configFile.niri = {
      source = create_symlink "${niri-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  };
}