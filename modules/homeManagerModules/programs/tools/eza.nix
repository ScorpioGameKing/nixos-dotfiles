{ pkgs, lib, config, ... }: {
  
  options = {
    eza.enable = lib.mkEnableOption "enables eza";
    eza.enableBashIntegration = lib.mkEnableOption "enables eza bash integration";
  };

  config = lib.mkIf config.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
    programs.eza = {
      enable = true;
      enableBashIntegration = config.eza.enableBashIntegration;
      icons = "auto";
    };
  };
}