{ pkgs, lib, config, inputs, ...  }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{

  options = { };

  config = lib.mkIf config.terminals.wezterm.enable {
    home.packages = with pkgs; [
      wezterm
    ];
    programs.wezterm = {
      enable = true;
    };
    xdg.configFile.wezterm = {
      source = create_symlink "${niri-dotfiles-repo}/.config/wezterm";
      recursive = true;
    };
  };
}