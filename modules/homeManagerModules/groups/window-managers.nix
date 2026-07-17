{ lib, osConfig, config, ... }: {
  imports = [
    ./../programs/window-managers/niri.nix
  ];

  options = {

    window-managers.enable = lib.mkEnableOption "enables desktop";

    window-managers.niri-configs = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables niri-configs";
        };
        config = { enable = lib.mkIf osConfig.niri.enable true; };
      };
      default = {};
    };
  };

  config = lib.mkIf config.window-managers.enable { };
  
}