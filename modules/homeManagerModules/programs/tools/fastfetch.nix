{ pkgs, lib, config, inputs, ... }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.tools.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
    xdg.configFile.fastfetch = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/fastfetch";
      recursive = true;
    };
  };
}