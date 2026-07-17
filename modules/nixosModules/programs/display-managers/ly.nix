{ lib, config, ... }: {

  options = {
    ly.enable = lib.mkEnableOption "enables ly";
  };
  
  config = lib.mkIf config.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "matrix";
        corner_top_left = "shutdown,restart,britup,britdown,password,tty";
        corner_top_right = "clock,battery,numlock,capslock";
      };
    };
  };
}