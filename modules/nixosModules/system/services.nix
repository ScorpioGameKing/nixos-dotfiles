{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.services.enable {
    services.printing.enable = true;
    services.libinput.enable = true;
  };
}