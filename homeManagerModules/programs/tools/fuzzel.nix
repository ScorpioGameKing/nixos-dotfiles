{ pkgs, lib, config, ... }: {
  
  options = {
    fuzzel.enable = lib.mkEnableOption "enables fuzzel";
  };

  config = lib.mkIf config.fuzzel.enable {
    home.packages = with pkgs; [
      fuzzel
    ];
  };
}