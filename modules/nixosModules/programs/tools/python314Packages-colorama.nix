{ pkgs, lib, config, ... }: {

  options = {
    python314Packages.colorama = lib.mkEnableOption "enables python314Packages.colorama";
  };
  
  config = lib.mkIf config.python3.enable {
    environment.systemPackages = with pkgs; [
      python314Packages.colorama
    ];
  };
}