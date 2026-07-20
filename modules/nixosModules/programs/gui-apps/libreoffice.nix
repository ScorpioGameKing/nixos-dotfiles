{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.gui-apps.libreoffice.enable {
    enviroment.systemPackages = with pkgs; [
      libreoffice
    ];
  };
}