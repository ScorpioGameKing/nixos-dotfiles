{ lib, config, ...}: {

  options = {
    shells.enable = lib.mkEnableOption "enables shells";
  };

  config = lib.mkIf config.shells.enable {
    imports = [
      ./../programs/shells/bash.nix
    ];
  };
}
