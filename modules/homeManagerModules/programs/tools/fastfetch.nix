{ pkgs, lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = {
    fastfetch.enable = lib.mkEnableOption "enables fastfetch";
  };

  config = lib.mkIf config.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
    xdg.configFile.fastfetch = {
      source = create_symlink "${niri-dotfiles-repo}/.config/fastfetch";
      recursive = true;
    };
  };
}