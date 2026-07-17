{ lib, config, inputs, ...  }: 

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  inherit (inputs) gruvbox-wallpapers;
in

{

  options = { };

  config = lib.mkIf config.resources.gruvbox-wallpapers.enable {

    home.file = {
      "Pictures/wallpapers" = {
        source = create_symlink "${gruvbox-wallpapers}/wallpapers";
        recursive = true;
      };
    };
  };
}