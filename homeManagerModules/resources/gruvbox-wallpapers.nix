{ lib, config, inputs, ...  }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) gruvbox-wallpapers;
in

{

  options = {
    gruvbox-wallpapers.enable = lib.mkEnableOption "enables gruvbox-wallpapers";
  };

  config = lib.mkIf config.gruvbox-wallpapers.enable {

    home.file = {
      "Pictures/wallpapers" = {
        source = create_symlink "${gruvbox-wallpapers}/wallpapers";
        recursive = true;
      };
    };
  };
}