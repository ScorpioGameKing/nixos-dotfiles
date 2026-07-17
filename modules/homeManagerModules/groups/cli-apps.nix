{ pkgs, lib, config, ... }: {
  
  imports = [
    ./../programs/cli-apps/joshuto.nix
    ./../programs/cli-apps/lazygit.nix
    ./../programs/cli-apps/neovim.nix
    ./../programs/cli-apps/oh-my-posh.nix
    ./../programs/cli-apps/television.nix
    ./../programs/cli-apps/yazi.nix
  ];

  options = {

    cli-apps.enable = lib.mkEnableOption "enables cli-apps";

    cli-apps.joshuto = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables joshuto";
        };
      };
      default = {};
    };

    cli-apps.lazygit = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables lazygit";
        };
      };
      default = {};
    };

    cli-apps.neovim = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables neovim";
        };
      };
      default = {};
    };

    cli-apps.oh-my-posh = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables oh-my-posh";
        };
      };
      default = {};
    };

    cli-apps.television = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables television";
        };
      };
      default = {};
    };

    cli-apps.yazi = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables yazi";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.cli-apps.enable { };
}
