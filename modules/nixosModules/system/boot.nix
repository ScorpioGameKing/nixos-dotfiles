{ pkgs, lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.boot.enable {
    boot.loader.systemd-boot.enable = config.nixos-modules.system.boot.settings.systemd-boot-enabled;
    boot.loader.efi.canTouchEfiVariables = config.nixos-modules.system.boot.settings.touchEfiVariables;
    boot.loader.systemd-boot.configurationLimit = config.nixos-modules.system.boot.settings.systemd-boot-config-limit;
    boot.kernelPackages = config.nixos-modules.system.boot.settings.kernelPkgs;
  };
}