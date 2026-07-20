{ lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.system.security.enable {
    security.pam.services.swaylock = {};
  };
}