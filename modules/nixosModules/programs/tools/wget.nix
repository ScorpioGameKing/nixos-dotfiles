{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.wget.enable {
    environment.systemPackages = with pkgs; [
      wget
    ];
  };
}