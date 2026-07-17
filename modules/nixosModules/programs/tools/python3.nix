{ pkgs, lib, config, ... }: {

  options = {
    python3.enable = lib.mkEnableOption "enables python3";
  };
  
  config = lib.mkIf config.python3.enable {
    environment.systemPackages = with pkgs; [
      python3
    ];
  };
}