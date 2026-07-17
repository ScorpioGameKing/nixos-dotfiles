{ pkgs, lib, config, ... }: {
  
  options = {
    waypaper.enable = lib.mkEnableOption "enables waypaper";
  };

  config = lib.mkIf config.waypaper.enable {
    home.packages = with pkgs; [
      waypaper
    ];
  };
}