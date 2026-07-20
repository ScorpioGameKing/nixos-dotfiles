{ lib, config, ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.nix-settings.enable {
    nixpkgs.config.allowUnfree = config.nixos-modules.system.nix-settings.allowUnfree;
    nix.settings.experimental-features = config.nixos-modules.system.nix-settings.experimental-features;
  };
}