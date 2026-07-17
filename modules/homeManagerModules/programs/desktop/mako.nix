{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.desktop.mako.enable {
    home.packages = with pkgs; [
      mako
    ];
    services.mako = {
      enable = true;
    };
  };
}