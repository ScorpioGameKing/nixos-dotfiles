{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.networking.enable {
    networking.hostName = config.nixos-modules.system.networking.hostName; 
    networking.networkmanager.enable = config.nixos-modules.system.networking.networkmanager.enable;
  };
}