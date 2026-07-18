{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.hardware.enable {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
  };
}