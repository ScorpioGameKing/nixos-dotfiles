{ ... }: {

  options = { };

  config = lib.mkIf config.nixos-modules.system.nix-settings.enable {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}