{ lib, config, inputs, ...  }: 
let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) nixos-dotfiles-repo;
in
{
  config = lib.mkIf config.hm-modules.resources.gruvbox-wallpapers.enable {
    home.file = {
      "Pictures/wallpapers" = {
        source = create_symlink "${nixos-dotfiles-repo}/wallpapers";
        recursive = true;
      };
    };
  };
}