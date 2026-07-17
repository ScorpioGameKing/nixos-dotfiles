{ lib, config, ... }: {

  options = {
    nodejs.enable = lib.mkEnableOption "enables nodejs";
  };
  
  config = lib.mkIf config.nodejs.enable {
    environment.systemPackages = with pkgs; [
      nodejs
    ];
  };
}