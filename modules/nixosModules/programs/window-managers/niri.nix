{ lib, config, inputs, ... }: 

{

  options = { };
  
  config = lib.mkIf config.nixos-modules.window-managers.niri.enable {
    programs.niri = {
      enable = true;
    };
  };
}