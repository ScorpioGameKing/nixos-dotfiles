{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.desktop.swaybg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}