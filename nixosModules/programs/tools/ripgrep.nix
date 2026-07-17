{ lib, config, ... }: {

  options = {
    ripgrep.enable = lib.mkEnableOption "enables ripgrep";
  };
  
  config = lib.mkIf config.ripgrep.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
    ];
  };
}