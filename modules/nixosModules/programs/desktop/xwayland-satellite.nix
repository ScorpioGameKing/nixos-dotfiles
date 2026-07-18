{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.desktop.xwayland-satellite.enable {
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}