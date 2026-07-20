{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.hyprpaper.enable {
    services.hyprpaper.enable = true;
  };
}