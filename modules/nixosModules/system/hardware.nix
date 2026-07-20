{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.hardware.enable {
    hardware.graphics.enable = config.nixos-modules.system.hardware.graphics.enable;
    hardware.graphics.enable32Bit = config.nixos-modules.system.hardware.graphics.enable32Bit;
  };
}