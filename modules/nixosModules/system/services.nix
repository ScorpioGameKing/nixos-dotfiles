{ lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.system.services.enable {
    services.printing.enable = config.nixos-modules.system.services.printing.enable;
    services.libinput.enable = config.nixos-modules.system.services.libinput.enable;
  };
}