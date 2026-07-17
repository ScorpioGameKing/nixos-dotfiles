{ pkgs, lib, config, ... }: {

  options = {
    wget.enable = lib.mkEnableOption "enables wget";
  };
  
  config = lib.mkIf config.wget.enable {
    environment.systemPackages = with pkgs; [
      wget
    ];
  };
}