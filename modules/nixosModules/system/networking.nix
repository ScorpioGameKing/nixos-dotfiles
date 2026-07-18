{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.networking.enable {
    networking.hostName = "nix-box"; 
    networking.networkmanager.enable = true;
  };
}