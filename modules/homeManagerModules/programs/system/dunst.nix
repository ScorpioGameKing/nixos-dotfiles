{ pkgs, lib, config, ... }: {
  
  options = { };

  config = lib.mkIf config.hm-modules.system.dunst.enable {
    home.packages = with pkgs; [
      dunst
    ];
    services.dunst.enable = true;
  };
}