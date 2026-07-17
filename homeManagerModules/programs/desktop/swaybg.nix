{ pkgs, lib, config, ... }: {
  
  options = {
    swaybg.enable = lib.mkEnableOption "enables swaybg";
  };

  config = lib.mkIf config.swaybg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}