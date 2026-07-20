{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.system.udisks2.enable {
    services.udisks2.enable = true;
  };
}