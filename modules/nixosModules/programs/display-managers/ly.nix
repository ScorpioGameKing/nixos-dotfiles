{ lib, config, ... }: 

{

  options = {
    ly.enable = lib.mkEnableOption "enables ly";
  };
  
  config = lib.mkIf config.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "colormix";
        cmatrix_min_codepoint = "0x3000";
        cmatrix_max_codepoint = "0x30FF";
        colormix_col1 = "0x00282828";
        colormix_col2 = "0x00504945";
        colormix_col3 = "0x00EBDBB2";
        clock = "%I:%M %p";
        box_title = "NixOS";
        corner_top_left = "shutdown,restart,britup,britdown,password,tty";
        corner_top_right = "clock,battery,numlock,capslock";
      };
    };
  };
}
