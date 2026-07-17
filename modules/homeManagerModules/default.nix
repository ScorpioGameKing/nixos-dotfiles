{ pkgs, lib, config, ...}: {

  imports = [
    ./groups/cli-apps.nix
    ./groups/desktop.nix
    ./groups/gui-apps.nix
    ./groups/resources.nix
    ./groups/shells.nix
    ./groups/terminals.nix
    ./groups/tools.nix
    ./groups/window-managers.nix
  ];
  
  options = {

    hm-modules.enable = lib.mkEnableOption "enables Home Manager Modules";

    hm-modules.cli-apps = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables cli-apps";
          joshuto = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables joshuto";
              };
            };
            default = {};
          };
          lazygit = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables lazygit";
              };
            };
            default = {};
          };
          neovim = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables neovim";
              };
            };
            default = {};
          };
          oh-my-posh = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables oh-my-posh";
              };
            };
            default = {};
          };
          television = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables television";
              };
            };
            default = {};
          };
          yazi = lib.mkOption {
            type = lib.types.submodule {
              options = {
                enable = lib.mkEnableOption "enables yazi";
              };
            };
            default = {};
          };
        };
        config = lib.mkIf config.hm-modules.cli-apps.enable { };
      };
      default = {};
    };
  };

  config = lib.mkIf config.hm-modules.enable { };
}