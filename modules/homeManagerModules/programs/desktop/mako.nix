{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.mako.enable {
    services.mako = {
      enable = true;
    };
  };
}