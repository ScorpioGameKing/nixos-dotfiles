{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.hm-modules.gui-apps.vscodium.enable {
    home.packages = with pkgs; [
      vscodium
    ];
  };
}