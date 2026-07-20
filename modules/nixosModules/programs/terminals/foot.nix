{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.terminals.foot.enable {
    environment.systemPackages = with pkgs; [
      foot
    ];
    programs.foot = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}