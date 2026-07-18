{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.ripgrep.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
    ];
  };
}