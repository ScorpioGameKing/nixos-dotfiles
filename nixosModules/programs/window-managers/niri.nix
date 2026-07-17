{ lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = {
    niri.enable = lib.mkEnableOption "enables niri";
  };

  xdg.configFile.niri = {
      source = create_symlink "${niri-dotfiles-repo}/.config/niri";
      recursive = true;
    };
  
  config = lib.mkIf config.niri.enable {
    programs.niri = {
      enable = true;
    };
  };
}