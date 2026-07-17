{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/terminals/wezterm.nix
    ./../programs/terminals/alacritty.nix
  ];

  options = {

    terminals.enable = lib.mkEnableOption "enables terminals";

    terminals.wezterm = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables wezterm";
        };
      };
      default = {};
    };

    terminals.alacritty = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables alacritty";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.terminals.enable { };
}
