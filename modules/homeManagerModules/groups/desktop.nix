{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/desktop/mako.nix
    ./../programs/desktop/quickshell.nix
    ./../programs/desktop/swaybg.nix
    ./../programs/desktop/swaylock.nix
    ./../programs/desktop/waybar.nix
    ./../programs/desktop/waypaper.nix
  ];

  options = {

    desktop.enable = lib.mkEnableOption "enables desktop";

    desktop.mako = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables mako";
        };
      };
      default = {};
    };

    desktop.quickshell = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables quickshell";
        };
      };
      default = {};
    };

    desktop.swaybg = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables swaybg";
        };
      };
      default = {};
    };

    desktop.swaylock = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables swaylock";
        };
      };
      default = {};
    };

    desktop.waybar = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables waybar";
        };
      };
      default = {};
    };

    desktop.waypaper = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables waypaper";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.desktop.enable { };
}