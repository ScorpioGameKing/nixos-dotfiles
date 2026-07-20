{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.tools.ripgrep.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
    ];
  };
}