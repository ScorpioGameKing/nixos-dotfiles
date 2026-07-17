{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.desktop.mako.enable {
    home.packages = with pkgs; [
      mako
    ];
    services.mako = {
      enable = true;
    };
  };
}