{ lib, config, ... }: {

  options = {
    gcc.enable = lib.mkEnableOption "enables gcc";
  };
  
  config = lib.mkIf config.gcc.enable {
    environment.systemPackages = with pkgs; [
      gcc
    ];
  };
}