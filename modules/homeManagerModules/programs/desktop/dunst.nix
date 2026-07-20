{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.dunst.enable {
    services.dunst.enable = true;
  };
}