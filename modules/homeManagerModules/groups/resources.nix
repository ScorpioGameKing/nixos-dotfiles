{ pkgs, lib, config, ...}: {

  imports = [
    ./../resources/gruvbox-wallpapers.nix
  ];

  options = {

    resources.enable = lib.mkEnableOption "enables resources";

    resources.gruvbox-wallpapers = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables gruvbox-wallpapers";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.resources.enable { };
}