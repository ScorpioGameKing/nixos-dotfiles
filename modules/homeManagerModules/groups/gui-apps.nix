{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/gui-apps/brave.nix
    ./../programs/gui-apps/vscodium.nix
    ./../programs/gui-apps/equibop.nix
  ];

  options = {

    gui-apps.enable = lib.mkEnableOption "enables gui-apps";

    gui-apps.brave = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables brave";
        };
      };
      default = {};
    };

    gui-apps.vscodium = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables vscodium";
        };
      };
      default = {};
    };

    gui-apps.equibop = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables equibop";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.gui-apps.enable { };
}