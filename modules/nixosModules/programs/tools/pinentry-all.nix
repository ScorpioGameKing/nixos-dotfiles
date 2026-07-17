{ pkgs, lib, config, ... }: {

  options = {
    pinentry-all.enable = lib.mkEnableOption "enables pinentry-all";
  };
  
  config = lib.mkIf config.pinentry-all.enable {
    environment.systemPackages = with pkgs; [
      pinentry-all
    ];
  };
}