{ pkgs, lib, config, ... }: {

  options = {
    cmake.enable = lib.mkEnableOption "enables cmake";
  };
  
  config = lib.mkIf config.cmake.enable {
    environment.systemPackages = with pkgs; [
      cmake
    ];
  };
}