{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.hyprpaper.enable {
    home.packages = with pkgs; [
      hyprpaper
    ];
    services.hyprpaper.enable = true;
  };
}