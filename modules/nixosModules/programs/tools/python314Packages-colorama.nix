{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.python314Packages-colorama.enable {
    environment.systemPackages = with pkgs; [
      python314Packages.colorama
    ];
  };
}