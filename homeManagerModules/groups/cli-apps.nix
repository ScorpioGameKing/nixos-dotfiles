{ lib, config, ...}: {

  options = {
    cli-apps.enable = lib.mkEnableOption "enables cli-apps";
    cli-apps.yazi = lib.mkOption {
      type = lib.types.submodule {
        options = {
          yazi.enable = lib.mkEnableOption "enables yazi";
        };
      };
    };
  };
  config = lib.mkIf config.cli-apps.enable {
    imports = [
      ./../programs/cli-apps/lazygit.nix
      ./../programs/cli-apps/oh-my-posh.nix
      ./../programs/cli-apps/television.nix
      ./../programs/cli-apps/yazi.nix
    ];
  };
}
