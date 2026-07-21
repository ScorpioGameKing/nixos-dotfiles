{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.desktop.playerctl.enable {
    environment.systemPackages = with pkgs; [
      playerctl
    ];
  };
}