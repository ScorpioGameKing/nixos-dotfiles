{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.cmake.enable {
    environment.systemPackages = with pkgs; [
      cmake
    ];
  };
}