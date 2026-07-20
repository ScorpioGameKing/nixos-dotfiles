{ lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.system.time.enable {
    time.timeZone = "America/New_York";
  };
}