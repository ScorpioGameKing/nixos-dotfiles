{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.python3.enable {
    environment.systemPackages = with pkgs; [
      python3
    ];
  };
}