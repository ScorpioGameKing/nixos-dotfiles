{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.nixos-modules.gui-apps.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}