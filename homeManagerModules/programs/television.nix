{ lib, config, ... }: {
  options = {
    television.enable = lib.mkEnableOption "enables television";
  };
  config = lib.mkIf config.television.enable {
    home.packages = with pkgs; [
      television
    ];
    programs.television = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
