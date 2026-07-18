{ pkgs, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.configurationLimit = 20;
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}