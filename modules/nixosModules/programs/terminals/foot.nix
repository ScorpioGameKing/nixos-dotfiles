{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.terminals.foot.enable {
    programs.foot = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}