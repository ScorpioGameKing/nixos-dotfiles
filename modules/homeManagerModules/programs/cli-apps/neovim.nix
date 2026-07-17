{ pkgs, lib, config, inputs, ... }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) niri-dotfiles-repo;
in

{
  
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      neovim
    ];
    xdg.configFile.nvim = {
      source = create_symlink "${niri-dotfiles-repo}/.config/nvim";
      recursive = true;
    };
  };
}