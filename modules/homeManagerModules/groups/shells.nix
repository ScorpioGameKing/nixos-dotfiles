{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/shells/bash.nix
    ./../programs/shells/nushell.nix
  ];

  options = {

    shells.enable = lib.mkEnableOption "enables shells";

    shells.bash = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables bash";
        };
      };
      default = {};
    };

    shells.nushell = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables nushell";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.shells.enable { };
}
