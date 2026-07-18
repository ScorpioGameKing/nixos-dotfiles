{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.gcc.enable {
    environment.systemPackages = with pkgs; [
      gcc
    ];
  };
}