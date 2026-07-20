{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.desktop.dunst.enable {
    home.packages = with pkgs; [
      dunst
    ];
    services.dunst.enable = true;
  };
}