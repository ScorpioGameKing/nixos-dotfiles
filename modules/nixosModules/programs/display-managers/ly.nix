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
        animation = "matrix";
        box_title = "${hostname}";
        corner_top_left = "shutdown,restart,britup,britdown,password,tty";
        corner_top_right = "clock,battery,numlock,capslock";
      };
    };
  };
}