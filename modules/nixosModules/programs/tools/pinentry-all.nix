{ pkgs, lib, config, ... }: {=
  config = lib.mkIf config.nixos-modules.tools.pinentry-all.enable {
    environment.systemPackages = with pkgs; [
      pinentry-all
    ];
  };
}