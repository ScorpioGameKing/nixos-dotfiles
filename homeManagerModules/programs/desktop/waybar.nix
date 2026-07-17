{ pkgs, lib, config, ... }: {
  
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    home.packages = with pkgs; [
      waybar
    ];
  };
}