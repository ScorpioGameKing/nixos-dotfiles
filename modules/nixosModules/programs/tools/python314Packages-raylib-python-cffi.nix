{ pkgs, lib, config, ... }: {

  options = { };
  
  config = lib.mkIf config.nixos-modules.tools.python314Packages-raylib-python-cffi.enable {
    environment.systemPackages = with pkgs; [
      python314Packages.raylib-python-cffi
    ];
  };
}