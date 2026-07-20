{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.gui-apps.libreoffice.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
  };
}