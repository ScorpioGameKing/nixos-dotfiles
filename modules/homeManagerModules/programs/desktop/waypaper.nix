{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.desktop.waypaper.enable {
    home.packages = with pkgs; [
      waypaper
    ];
  };
}