{ pkgs, lib, config, ... }: {
  
  options = {
    fastfetch.enable = lib.mkEnableOption "enables fastfetch";
  };

  config = lib.mkIf config.fastfetch.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}