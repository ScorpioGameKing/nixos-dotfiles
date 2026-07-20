{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.swaybg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}