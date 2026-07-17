{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.gui-apps.equibop.enable {
    home.packages = with pkgs; [
      equibop
    ];
  };
}