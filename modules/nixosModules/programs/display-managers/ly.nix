{ lib, config, ... }: 

let 
  hostname = if (builtins.pathExists ./private.nix) then (import ./private.nix) else  "NixOS"; 
in

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
        clock = "%I:%M %p";
        vi_mode = true;
        box_title = "${hostname}";
        corner_top_left = "shutdown,restart,britup,britdown,password,tty";
        corner_top_right = "clock,battery,numlock,capslock";
      };
    };
  };
}