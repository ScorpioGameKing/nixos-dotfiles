{ pkgs, lib, config, ... }: {
  
  options = {
    television.enable = lib.mkEnableOption "enables television";
    television.enableBashIntegration = lib.mkEnableOption "enables bash integration";
  };

  config = lib.mkIf config.television.enable {
    home.packages = with pkgs; [
      television
    ];
    programs.television = {
      enable = true;
      enableBashIntegration = config.television.enableBashIntegration;
    };
  };
}
