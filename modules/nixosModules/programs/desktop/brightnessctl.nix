{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.desktop.brightnessctl.enable {
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];
  };
}