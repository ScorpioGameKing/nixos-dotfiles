{ pkgs, lib, config, ... }: {

  options = {
    python314Packages.raylib-python-cffi.enable = lib.mkEnableOption "enables python314Packages.raylib-python-cffi (raylib for python 314)";
  };
  
  config = lib.mkIf config.python3.enable {
    environment.systemPackages = with pkgs; [
      python314Packages.raylib-python-cffi
    ];
  };
}