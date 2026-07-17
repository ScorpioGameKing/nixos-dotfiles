{ pkgs, lib, config, ... }: {
  
  options = {
    vscodium.enable = lib.mkEnableOption "enables vscodium";
  };

  config = lib.mkIf config.vscodium.enable {
    home.packages = with pkgs; [
      vscodium
    ];
  };
}