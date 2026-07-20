{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.tools.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs
    ];
  };
}