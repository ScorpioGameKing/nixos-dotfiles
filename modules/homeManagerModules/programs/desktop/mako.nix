{ pkgs, lib, config, ... }: {
  
  options = {
    mako.enable = lib.mkEnableOption "enables mako";
  };

  config = lib.mkIf config.mako.enable {
    home.packages = with pkgs; [
      mako
    ];
    services.mako = {
      enable = true;
    }
  };
}