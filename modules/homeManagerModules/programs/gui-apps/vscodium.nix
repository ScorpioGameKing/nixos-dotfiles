{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.gui-apps.vscodium.enable {
    home.packages = with pkgs; [
      vscodium
    ];
  };
}