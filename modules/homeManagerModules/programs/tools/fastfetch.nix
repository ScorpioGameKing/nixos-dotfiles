{ pkgs, lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = { };

  config = lib.mkIf config.hm-modules.tools.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
    xdg.configFile.fastfetch = {
      source = create_symlink "${niri-dotfiles-repo}/.config/fastfetch";
      recursive = true;
    };
  };
}