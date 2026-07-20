{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.gui-apps.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}