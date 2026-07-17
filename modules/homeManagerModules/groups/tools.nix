{ pkgs, lib, config, ...}: {

  imports = [
    ./../programs/tools/eza.nix
    ./../programs/tools/fastfetch.nix
    ./../programs/tools/fuzzel.nix
    ./../programs/tools/fzf.nix
    ./../programs/tools/gh.nix
    ./../programs/tools/git.nix
    ./../programs/tools/gpg.nix
    ./../programs/tools/nix-search-tv.nix
    ./../programs/tools/update-nix-fetchgit.nix
    ./../programs/tools/zoxide.nix
  ];

  options = {

    tools.enable = lib.mkEnableOption "enables tools";

    tools.eza = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables eza";
        };
      };
      default = {};
    };

    tools.fastfetch = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables fastfetch";
        };
      };
      default = {};
    };

    tools.fuzzel = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables fuzzel";
        };
      };
      default = {};
    };

    tools.fzf = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables fzf";
        };
      };
      default = {};
    };

    tools.gh = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables gh";
        };
      };
      default = {};
    };

    tools.git = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables git";
        };
      };
      default = {};
    };

    tools.gpg = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables gpg";
        };
      };
      default = {};
    };

    tools.nix-search-tv = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables nix-search-tv";
        };
      };
      default = {};
    };

    tools.update-nix-fetchgit = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables update-nix-fetchgit";
        };
      };
      default = {};
    };

    tools.zoxide = lib.mkOption {
      type = lib.types.submodule {
        options = {
          enable = lib.mkEnableOption "enables zoxide";
        };
      };
      default = {};
    };
  };

  config = lib.mkIf config.tools.enable { };
}
