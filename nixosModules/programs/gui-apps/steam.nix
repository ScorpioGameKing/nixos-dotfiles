{ pkgs, lib, config, ... }: {

  options = {
    steam.enable = mkEnableOption "enables steam";
  };
  
  config = mkIf config.steam.enable {
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