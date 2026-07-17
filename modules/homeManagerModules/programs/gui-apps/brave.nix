{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.gui-apps.brave.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
}