{ lib, config, ... }: {

  options = {
    xwayland-satellite.enable = lib.mkEnableOption "enables xwayland-satellite";
  };
  
  config = lib.mkIf config.xwayland-satellite.enable {
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}