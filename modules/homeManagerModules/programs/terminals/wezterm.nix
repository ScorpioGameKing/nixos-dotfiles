{ pkgs, lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.terminals.wezterm.enable {
    programs.wezterm = {
      enable = true;
    };
    xdg.configFile.wezterm = {
      source = create_symlink "${nixos-dotfiles-repo}/.config/wezterm/";
      recursive = true;
    };
  };
}