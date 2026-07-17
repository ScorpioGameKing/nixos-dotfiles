{ lib, config, ... }: {

  options = {
    ly.enable = lib.mkEnableOption "enables ly";
  };
  
  config = lib.mkIf config.ly.enable {
    services.displayManager.ly.enable = true;
  };
}