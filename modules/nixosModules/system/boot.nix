{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.system.boot.enable {
    boot.loader.systemd-boot.enable = config.nixos-modules.system.boot.settings.systemd-boot.enabled;
    boot.loader.efi.canTouchEfiVariables = config.nixos-modules.system.boot.settings.canTouchEfiVariables;
    boot.loader.systemd-boot.configurationLimit = config.nixos-modules.system.boot.settings.systemd-boot.configurationLimit;
    boot.kernelPackages = config.nixos-modules.system.boot.settings.kernelPackages;
  };
}