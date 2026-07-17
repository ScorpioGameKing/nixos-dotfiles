{ pkgs, lib, config, ... }: {
  
  options = {
    swaylock.enable = lib.mkEnableOption "enables swaylock";
  };

  config = lib.mkIf config.swaylock.enable {
    home.packages = with pkgs; [
      swaylock
    ];
  };
}