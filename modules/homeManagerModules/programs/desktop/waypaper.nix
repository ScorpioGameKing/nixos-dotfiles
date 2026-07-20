{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.waypaper.enable {
    home.packages = with pkgs; [
      waypaper
    ];
  };
}