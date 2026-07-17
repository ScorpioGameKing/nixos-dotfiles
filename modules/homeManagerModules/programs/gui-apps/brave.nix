{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.gui-apps.brave.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
}