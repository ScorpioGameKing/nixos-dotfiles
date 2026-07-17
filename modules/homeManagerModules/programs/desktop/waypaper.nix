{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.desktop.waypaper.enable {
    home.packages = with pkgs; [
      waypaper
    ];
  };
}