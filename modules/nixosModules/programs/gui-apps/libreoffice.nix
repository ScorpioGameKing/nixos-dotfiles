{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.libreoffice.enable {
    environment.systemPackages = with pkgs; [
      libreoffice
    ];
  };
}