{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.gui-apps.libreoffice-qt.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}