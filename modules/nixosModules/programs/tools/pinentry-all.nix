{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.pinentry-all.enable {
    environment.systemPackages = with pkgs; [
      pinentry-all
    ];
  };
}