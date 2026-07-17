{ lib, config, ...}: {

  options = {
    cli-apps.enable = lib.mkEnableOption "enables cli-apps";
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
