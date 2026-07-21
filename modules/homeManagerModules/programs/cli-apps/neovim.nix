{ pkgs, lib, config, inputs, ... }:
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.cli-apps.neovim.enable {
    #home.packages = with pkgs; [
    #  neovim
    #];
    #xdg.configFile.nvim = {
    #  source = create_symlink "${nixos-dotfiles-repo}/.config/nvim";
    #  recursive = true;
    #};

    programs.nvf = {
      enable = true;
    };
    vim = {
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
    };

  };
}